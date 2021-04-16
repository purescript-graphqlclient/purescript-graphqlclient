module MyExamplesTests.Example10Github where

import Control.Monad.Error.Class (throwError)
import Effect.Exception (error)
import Examples.Github.Scopes (Scope__Release, Scope__ReleaseConnection, Scope__Repository)
import MyExamplesTests.Util (inlineAndTrim)
import GraphQLClient (GraphQLError, Optional(..), Scope__RootQuery, SelectionSet, defaultInput, defaultRequestOptions, graphqlQueryRequest, nonNullElementsOrFail, nonNullOrFail, printGraphQLError, writeGraphQL)
import Prelude
import Data.Either (Either, either)
import Data.Maybe (Maybe(..), fromMaybe)
import Affjax.RequestHeader (RequestHeader(..))
import Examples.Github.Object.Repository as Examples.Github.Object.Repository
import Examples.Github.Object.Release as Examples.Github.Object.Release
import Examples.Github.Object.StargazerConnection as Examples.Github.Object.StargazerConnection
import Examples.Github.Object.Topic as Examples.Github.Object.Topic
import Examples.Github.Object.ReleaseConnection as Examples.Github.Object.ReleaseConnection
import Examples.Github.Query as Examples.Github.Query
import Examples.Github.Scalars as Examples.Github.Scalars
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response
  = { repoInfo :: RepositoryInfo
    , topicId :: Maybe Examples.Github.Scalars.Id
    }

type RepositoryInfo
  = { createdAt :: Examples.Github.Scalars.DateTime
    , earlyReleases :: ReleaseInfo
    , lateReleases :: ReleaseInfo
    , stargazersCount :: Int
    }

type ReleaseInfo
  = { totalCount :: Int
    , releases :: Array Release
    }

type Release
  = { name :: String
    , url :: Examples.Github.Scalars.Uri
    }

query :: SelectionSet Scope__RootQuery Response
query =
  { repoInfo: _
  , topicId: _
  }
    <$> (Examples.Github.Query.repository { owner: "srghma", name: "purescript-dom-indexed" } repo # nonNullOrFail)
    <*> Examples.Github.Query.topic { name: "" } Examples.Github.Object.Topic.id

repo :: SelectionSet Scope__Repository RepositoryInfo
repo =
  { createdAt: _, earlyReleases: _, lateReleases: _, stargazersCount: _ }
    <$> Examples.Github.Object.Repository.createdAt
    <*> (Examples.Github.Object.Repository.releases ((defaultInput :: Examples.Github.Object.Repository.ReleasesInput) { first = Present 2 }) releases)
    <*> (Examples.Github.Object.Repository.releases ((defaultInput :: Examples.Github.Object.Repository.ReleasesInput) { last = Present 10 }) releases)
    <*> (Examples.Github.Object.Repository.stargazers defaultInput Examples.Github.Object.StargazerConnection.totalCount)

releases :: SelectionSet Scope__ReleaseConnection ReleaseInfo
releases =
  { totalCount: _, releases: _ }
    <$> Examples.Github.Object.ReleaseConnection.totalCount
    <*> (Examples.Github.Object.ReleaseConnection.nodes release # nonNullOrFail # nonNullElementsOrFail)

release :: SelectionSet Scope__Release Release
release =
  { name: _, url: _ }
    <$> (Examples.Github.Object.Release.name <#> (fromMaybe ""))
    <*> Examples.Github.Object.Release.url

expectedQuery :: String
expectedQuery =
  inlineAndTrim
    """
query {
  repository585355806239197: repository(name: "purescript-dom-indexed", owner: "srghma") {
    createdAt
    releases3873518373821440: releases(first: 2) {
      totalCount
      nodes {
        name
        url
      }
    }
    releases3931642775315639: releases(last: 10) {
      totalCount
      nodes {
        name
        url
      }
    }
    stargazers {
      totalCount
    }
  }
  topic6959180692994983: topic(name: "") {
    id
  }
}
"""

spec :: Test.Spec.Spec Unit
spec =
  Test.Spec.it "Example10Github" do
    writeGraphQL query `Test.Spec.shouldEqual` expectedQuery
    let
      opts = defaultRequestOptions { headers = [ RequestHeader "authorization" "Bearer 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" ] }
    (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://api.github.com/graphql" opts query
    (response' :: Response) <- either (throwError <<< error <<< printGraphQLError) pure $ response
    response'
      `Test.Spec.shouldEqual`
        { repoInfo:
          { createdAt: Examples.Github.Scalars.DateTime "2020-06-12T19:04:51Z"
          , earlyReleases:
            { releases: []
            , totalCount: 0
            }
          , lateReleases:
            { releases: []
            , totalCount: 0
            }
          , stargazersCount: 0
          }
        , topicId: Nothing
        }
