module Examples.MyTests.Example11GithubPagination where

import Examples.Github.Scopes
import Examples.MyTests.Util
import GraphqlClient
import Protolude

import Affjax.RequestHeader (RequestHeader(..))
import Data.Array (length) as Array
import Data.Generic.Rep.Show (genericShow)
import Examples.Github.Enum.SearchType as Examples.Github.Enum.SearchType
import Examples.Github.Object.PageInfo as Examples.Github.Object.PageInfo
import Examples.Github.Object.Release as Examples.Github.Object.Release
import Examples.Github.Object.ReleaseConnection as Examples.Github.Object.ReleaseConnection
import Examples.Github.Object.Repository as Examples.Github.Object.Repository
import Examples.Github.Object.SearchResultItemConnection as Examples.Github.Object.SearchResultItemConnection
import Examples.Github.Object.SearchResultItemEdge as Examples.Github.Object.SearchResultItemEdge
import Examples.Github.Object.StargazerConnection as Examples.Github.Object.StargazerConnection
import Examples.Github.Object.Topic as Examples.Github.Object.Topic
import Examples.Github.Query as Examples.Github.Query
import Examples.Github.Scalars as Examples.Github.Scalars
import Examples.Github.Union.SearchResultItem as Examples.Github.Union.SearchResultItem
import GraphqlClient as GraphqlClient
import Record as Record
import Test.Spec as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response = Paginator (Array Repo) String

type Paginator dataType cursorType =
    { data :: dataType
    , paginationData :: PaginationData cursorType
    }

type PaginationData cursorType =
    { cursor :: Maybe cursorType
    , hasNextPage :: Boolean
    }

type Repo =
    { name :: String
    , description :: Maybe String
    , createdAt :: Examples.Github.Scalars.DateTime
    , updatedAt :: Examples.Github.Scalars.DateTime
    , stargazers :: Int
    }

query :: Maybe String -> SelectionSet Scope__RootQuery Response
query cursor =
  let
      args =
        ( Record.merge
          { query: "language:purescript"
          , "type": Examples.Github.Enum.SearchType.Repository
          , first: Present 10 -- first OR last is required
          }
          (defaultInput :: { | Examples.Github.Query.SearchInputRowOptional () })
        )
  in Examples.Github.Query.search args searchSelection

searchSelection :: SelectionSet Scope__SearchResultItemConnection Response
searchSelection = ado
  data_ <- searchResultFieldEdges
  paginationData <- Examples.Github.Object.SearchResultItemConnection.pageInfo searchPageInfoSelection
  in { "data": data_, paginationData }

searchResultFieldEdges :: SelectionSet Scope__SearchResultItemConnection (Array Repo)
searchResultFieldEdges =
    Examples.Github.Object.SearchResultItemConnection.edges
        (Examples.Github.Object.SearchResultItemEdge.node searchResultSelection # GraphqlClient.nonNullOrFail)
        # GraphqlClient.nonNullOrFail
        # GraphqlClient.nonNullElementsOrFail
        # GraphqlClient.nonNullElementsOrFail

searchPageInfoSelection :: SelectionSet Scope__PageInfo (PaginationData String)
searchPageInfoSelection = ado
  cursor <- Examples.Github.Object.PageInfo.endCursor
  hasNextPage <- Examples.Github.Object.PageInfo.hasNextPage
  in { cursor, hasNextPage }


searchResultFieldNodes :: SelectionSet Scope__SearchResultItemConnection (Array Repo)
searchResultFieldNodes =
    Examples.Github.Object.SearchResultItemConnection.nodes searchResultSelection
        # GraphqlClient.nonNullOrFail
        # GraphqlClient.nonNullElementsOrFail
        # GraphqlClient.nonNullElementsOrFail

searchResultSelection :: SelectionSet Scope__SearchResultItem (Maybe Repo)
searchResultSelection =
    Examples.Github.Union.SearchResultItem.fragments
      (Examples.Github.Union.SearchResultItem.maybeFragments
      { onRepository = repositorySelection <#> Just }
      )
repositorySelection :: SelectionSet Scope__Repository Repo
repositorySelection = ado
  name        <- Examples.Github.Object.Repository.nameWithOwner
  description <- Examples.Github.Object.Repository.description
  createdAt   <- Examples.Github.Object.Repository.createdAt
  updatedAt   <- Examples.Github.Object.Repository.updatedAt
  stargazers  <- Examples.Github.Object.Repository.stargazers defaultInput Examples.Github.Object.StargazerConnection.totalCount
  in { name, description, createdAt, updatedAt, stargazers }

expectedQuery :: String
expectedQuery = inlineAndTrim """
query {
  search158737529: search(first: 10, query: "language:purescript", type: REPOSITORY) {
    edges {
      node {
        __typename
        ...on Repository {
          nameWithOwner
          description
          createdAt
          updatedAt
          stargazers {
            totalCount
          }
        }
      }
    }
    pageInfo {
      endCursor
      hasNextPage
    }
  }
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example11GithubPagination" do
  writeGraphql (query Nothing) `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- graphqlQueryRequest "https://api.github.com/graphql" [RequestHeader "authorization" "Bearer dbd4c239b0bbaa40ab0ea291fa811775da8f5b59"] (query Nothing)

  (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

  Array.length response'.data `Test.Spec.shouldEqual` 10
  isJust response'.paginationData.cursor `Test.Spec.shouldEqual` true
  response'.paginationData.hasNextPage `Test.Spec.shouldEqual` true
