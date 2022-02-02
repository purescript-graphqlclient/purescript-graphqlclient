module MyExamplesTests.Example08Foldr where

import Prelude

import Affjax.RequestHeader (RequestHeader(..))
import Control.Monad.Error.Class (throwError)
import Data.Either (Either, either)
import Effect.Exception (error)
import Examples.Github.Object.Repository as Examples.Github.Object.Repository
import Examples.Github.Object.StargazerConnection as Examples.Github.Object.StargazerConnection
import Examples.Github.Query as Examples.Github.Query
import Examples.Github.Scopes (Scope__Repository)
import GraphQLClient (GraphQLError, Scope__RootQuery, SelectionSet, defaultInput, defaultRequestOptions, graphqlQueryRequest, nonNullOrFail, printGraphQLError, writeGraphQL)
import GraphQLClient as GraphQLClient
import MyExamplesTests.Util (inlineAndTrim)
import Record (merge) as Record
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response
  = Int

-- repos that improbably have any stars, so that we dont update tests very often
repos ::
  Array
    { name :: String
    , owner :: String
    }
repos =
  [ { owner: "srghma", name: "purescript-dom-indexed" }
  , { owner: "srghma", name: "purescript-halogen-vdom-string-renderer" }
  , { owner: "srghma", name: "purescript-halogen-storybook" }
  ]

query :: SelectionSet Scope__RootQuery Response
query =
  let
    repos' = repos <#> \repo ->
      ( Record.merge
          repo
          (defaultInput :: { | Examples.Github.Query.RepositoryInputRowOptional () })
      )
  in GraphQLClient.foldl (+) 0 (repos' <#> \input -> (Examples.Github.Query.repository input stargazerCount # nonNullOrFail))

stargazerCount :: SelectionSet Scope__Repository Int
stargazerCount = Examples.Github.Object.Repository.stargazers defaultInput Examples.Github.Object.StargazerConnection.totalCount

expectedQuery :: String
expectedQuery =
  inlineAndTrim
    """
query {
  repository585355806239197: repository(name: "purescript-dom-indexed", owner: "srghma") {
    stargazers {
      totalCount
    }
  }
  repository1768679368232301: repository(name: "purescript-halogen-vdom-string-renderer", owner: "srghma") {
    stargazers {
      totalCount
    }
  }
  repository1757330627540431: repository(name: "purescript-halogen-storybook", owner: "srghma") {
    stargazers {
      totalCount
    }
  }
}
"""

spec :: String -> Test.Spec.Spec Unit
spec githubGraphqlEndpointToken =
  Test.Spec.it "Example08Foldr" do
    writeGraphQL query `Test.Spec.shouldEqual` expectedQuery
    let
      opts = defaultRequestOptions { headers = [ RequestHeader "authorization" ("Bearer " <> githubGraphqlEndpointToken) ] }
    (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://api.github.com/graphql" opts query
    (response' :: Response) <- either (throwError <<< error <<< printGraphQLError) pure $ response
    response' `Test.Spec.shouldEqual` 0
