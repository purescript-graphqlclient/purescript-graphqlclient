module MyExamplesTests.Example08Foldr where

import Control.Monad.Error.Class (throwError)
import Effect.Exception (error)
import Examples.Github.Scopes (Scope__Repository)
import MyExamplesTests.Util (inlineAndTrim)
import GraphQLClient (GraphQLError, Scope__RootQuery, SelectionSet, defaultInput, defaultRequestOptions, graphqlQueryRequest, nonNullOrFail, printGraphQLError, writeGraphQL)
import Prelude
import Data.Either (Either, either)
import Affjax.RequestHeader (RequestHeader(..))
import Examples.Github.Object.Repository as Examples.Github.Object.Repository
import Examples.Github.Object.StargazerConnection as Examples.Github.Object.StargazerConnection
import Examples.Github.Query as Examples.Github.Query
import GraphQLClient as GraphQLClient
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
query = GraphQLClient.foldl (+) 0 (repos <#> \input -> (Examples.Github.Query.repository input stargazerCount # nonNullOrFail))

stargazerCount :: SelectionSet Scope__Repository Int
stargazerCount = Examples.Github.Object.Repository.stargazers defaultInput Examples.Github.Object.StargazerConnection.totalCount

expectedQuery :: String
expectedQuery =
  inlineAndTrim
    """
query {
  repository789914293: repository(name: "purescript-dom-indexed", owner: "srghma") {
    stargazers {
      totalCount
    }
  }
  repository2058496834: repository(name: "purescript-halogen-vdom-string-renderer", owner: "srghma") {
    stargazers {
      totalCount
    }
  }
  repository1504278890: repository(name: "purescript-halogen-storybook", owner: "srghma") {
    stargazers {
      totalCount
    }
  }
}
"""

spec :: Test.Spec.Spec Unit
spec =
  Test.Spec.it "Example08Foldr" do
    writeGraphQL query `Test.Spec.shouldEqual` expectedQuery
    let
      opts = defaultRequestOptions { headers = [ RequestHeader "authorization" "Bearer 6dbebdecd059b288a14574709a4eac4154437aed" ] }
    (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://api.github.com/graphql" opts query
    (response' :: Response) <- either (throwError <<< error <<< printGraphQLError) pure $ response
    response' `Test.Spec.shouldEqual` 0
