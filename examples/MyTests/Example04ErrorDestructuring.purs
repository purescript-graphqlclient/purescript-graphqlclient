module Examples.MyTests.Example04ErrorDestructuring where

import GraphqlClient
import Protolude
import Swapi.Scalar

import Swapi.Object.Human as Human
import Swapi.Query (forcedError)
import Swapi.Query as Query
import Test.Spec as Test.Spec
import Test.Spec.Assertions as Test.Spec

type Response = Maybe String

query :: SelectionSet Scope__RootQuery Response
query = Query.forcedError

expectedQuery :: String
expectedQuery = """query { forcedError }"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example04ErrorDestructuring" do
  writeGraphql query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://elm-graphql.herokuapp.com" query

  case response of
       Left error -> pure unit
       Right _ -> Test.Spec.fail "should fail"
