module Examples.MyTests.Example00SingleFieldQuerySpec where

import Protolude

import Test.Spec as Test.Spec
import Test.Spec.Assertions as Test.Spec
import GraphqlClient
import Swapi.Scalar
import Swapi.Object.Human
import Swapi.Query

type Response = Maybe Id

query :: SelectionSet Scope__RootQuery Response
query = human { id: Id "1001" } id

expectedQuery :: String
expectedQuery = """query { human(id: "1001") { id } }"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example00SingleFieldQuerySpec" do
  writeGraphql query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://elm-graphql.herokuapp.com" query

  (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

  response' `Test.Spec.shouldEqual` Just (Id "1001")
