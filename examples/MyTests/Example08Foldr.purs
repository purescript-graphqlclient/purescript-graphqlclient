module Examples.MyTests.Example08Foldr where

import Examples.Github.Scopes
import Examples.MyTests.Util
import GraphqlClient
import Protolude

import Affjax.RequestHeader (RequestHeader(..))
import Data.Generic.Rep.Show (genericShow)
import Examples.Github.Object.Repository as Examples.Github.Object.Repository
import Examples.Github.Object.StargazerConnection as Examples.Github.Object.StargazerConnection
import Examples.Github.Query as Examples.Github.Query
import GraphqlClient as GraphqlClient
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response = Int

repos :: _
repos =
  [ { owner: "dillonkearns", name: "mobster" }
  , { owner: "dillonkearns", name: "elm-graphql" }
  , { owner: "dillonkearns", name: "elm-typescript-interop" }
  ]

query :: SelectionSet Scope__RootQuery Response
query = GraphqlClient.foldl (+) 0 (repos <#> \input -> (Examples.Github.Query.repository input stargazerCount # nonNullOrFail))

stargazerCount :: SelectionSet Scope__Repository Int
stargazerCount = Examples.Github.Object.Repository.stargazers defaultInput Examples.Github.Object.StargazerConnection.totalCount

expectedQuery :: String
expectedQuery = inlineAndTrim """
query {
  repository788135211: repository(name: "mobster", owner: "dillonkearns") {
    stargazers {
      totalCount
    }
  }
  repository1200065311: repository(name: "elm-graphql", owner: "dillonkearns") {
    stargazers {
      totalCount
    }
  }
  repository595118603: repository(name: "elm-typescript-interop", owner: "dillonkearns") {
    stargazers {
      totalCount
    }
  }
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example08Foldr" do
  writeGraphql query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://api.github.com/graphql" [RequestHeader "authorization" "Bearer dbd4c239b0bbaa40ab0ea291fa811775da8f5b59"] query

  (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

  response' `Test.Spec.shouldEqual` 984
