module Examples.MyTests.Example08Foldr where

import Examples.MyTests.Util
import GraphqlClient
import Protolude

import Data.Generic.Rep.Show (genericShow)
import Examples.Github.Query as Examples.Github.Query
import Examples.Github.Scopes
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
query = foldl (+) 0 repos

expectedQuery :: String
expectedQuery = inlineAndTrim """
query {
  heroUnion {
    __typename
  }
  hero {
    __typename
    name
  }
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example08Foldr" do
  writeGraphql query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://elm-graphql.herokuapp.com" [] query

  (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

  response' `Test.Spec.shouldEqual`
    { heroUnion: Human
    , heroInterface:
      { name: "Luke Skywalker"
      , details: Human
      }
    }
