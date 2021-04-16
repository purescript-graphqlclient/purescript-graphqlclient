module MyExamplesTests.Example11GithubPagination where

import Control.Monad.Error.Class (throwError)
import Effect.Exception (error)
import Examples.Github.Scopes (Scope__PageInfo, Scope__Repository, Scope__SearchResultItem, Scope__SearchResultItemConnection)
import MyExamplesTests.Util (inlineAndTrim)
import GraphQLClient (GraphQLError, Optional(..), Scope__RootQuery, SelectionSet, defaultRequestOptions, defaultInput, graphqlQueryRequest, printGraphQLError, writeGraphQL)
import Prelude
import Data.Either (Either, either)
import Data.Maybe (Maybe(..), isJust)
import Affjax.RequestHeader (RequestHeader(..))
import Data.Array (length) as Array
import Examples.Github.Enum.SearchType as Examples.Github.Enum.SearchType
import Examples.Github.Object.PageInfo as Examples.Github.Object.PageInfo
import Examples.Github.Object.Repository as Examples.Github.Object.Repository
import Examples.Github.Object.SearchResultItemConnection as Examples.Github.Object.SearchResultItemConnection
import Examples.Github.Object.SearchResultItemEdge as Examples.Github.Object.SearchResultItemEdge
import Examples.Github.Object.StargazerConnection as Examples.Github.Object.StargazerConnection
import Examples.Github.Query as Examples.Github.Query
import Examples.Github.Scalars as Examples.Github.Scalars
import Examples.Github.Union.SearchResultItem as Examples.Github.Union.SearchResultItem
import GraphQLClient as GraphQLClient
import Record as Record
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response
  = Paginator (Array Repo) String

type Paginator dataType cursorType
  = { data :: dataType
    , paginationData :: PaginationData cursorType
    }

type PaginationData cursorType
  = { cursor :: Maybe cursorType
    , hasNextPage :: Boolean
    }

type Repo
  = { name :: String
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
  in
    Examples.Github.Query.search args searchSelection

searchSelection :: SelectionSet Scope__SearchResultItemConnection Response
searchSelection = ado
  data_ <- searchResultFieldEdges
  paginationData <- Examples.Github.Object.SearchResultItemConnection.pageInfo searchPageInfoSelection
  in { "data": data_, paginationData }

searchResultFieldEdges :: SelectionSet Scope__SearchResultItemConnection (Array Repo)
searchResultFieldEdges =
  Examples.Github.Object.SearchResultItemConnection.edges
    (Examples.Github.Object.SearchResultItemEdge.node searchResultSelection # GraphQLClient.nonNullOrFail)
    # GraphQLClient.nonNullOrFail
    # GraphQLClient.nonNullElementsOrFail
    # GraphQLClient.nonNullElementsOrFail

searchPageInfoSelection :: SelectionSet Scope__PageInfo (PaginationData String)
searchPageInfoSelection = ado
  cursor <- Examples.Github.Object.PageInfo.endCursor
  hasNextPage <- Examples.Github.Object.PageInfo.hasNextPage
  in { cursor, hasNextPage }

searchResultFieldNodes :: SelectionSet Scope__SearchResultItemConnection (Array Repo)
searchResultFieldNodes =
  Examples.Github.Object.SearchResultItemConnection.nodes searchResultSelection
    # GraphQLClient.nonNullOrFail
    # GraphQLClient.nonNullElementsOrFail
    # GraphQLClient.nonNullElementsOrFail

searchResultSelection :: SelectionSet Scope__SearchResultItem (Maybe Repo)
searchResultSelection =
  Examples.Github.Union.SearchResultItem.fragments
    ( Examples.Github.Union.SearchResultItem.maybeFragments
        { onRepository = repositorySelection <#> Just }
    )

repositorySelection :: SelectionSet Scope__Repository Repo
repositorySelection = ado
  name <- Examples.Github.Object.Repository.nameWithOwner
  description <- Examples.Github.Object.Repository.description
  createdAt <- Examples.Github.Object.Repository.createdAt
  updatedAt <- Examples.Github.Object.Repository.updatedAt
  stargazers <- Examples.Github.Object.Repository.stargazers defaultInput Examples.Github.Object.StargazerConnection.totalCount
  in { name, description, createdAt, updatedAt, stargazers }

expectedQuery :: String
expectedQuery =
  inlineAndTrim
    """
query {
  search674867616051567: search(first: 10, query: "language:purescript", type: REPOSITORY) {
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
spec =
  Test.Spec.it "Example11GithubPagination" do
    writeGraphQL (query Nothing) `Test.Spec.shouldEqual` expectedQuery
    let
      opts = defaultRequestOptions { headers = [ RequestHeader "authorization" "Bearer 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" ] }
    (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://api.github.com/graphql" opts (query Nothing)
    (response' :: Response) <- either (throwError <<< error <<< printGraphQLError) pure $ response
    Array.length response'.data `Test.Spec.shouldEqual` 10
    isJust response'.paginationData.cursor `Test.Spec.shouldEqual` true
    response'.paginationData.hasNextPage `Test.Spec.shouldEqual` true
