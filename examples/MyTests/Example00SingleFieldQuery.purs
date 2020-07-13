module Examples.MyTests.Example00SingleFieldQuery where

import Protolude (Either, Maybe(..), Unit, bind, discard, error, pure, throwError, ($), (<<<), (\/))

import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec
import GraphqlClient (GraphqlError, Scope__RootQuery, SelectionSet, gqlRequest, printGraphqlError, writeGraphql)
import Swapi.Scalar (Id(..))
import Swapi.Object.Human (id)
import Swapi.Query (human)

type Response = Maybe Id

query :: SelectionSet Scope__RootQuery Response
query = human { id: Id "1001" } id

expectedQuery :: String
expectedQuery = """query { human(id: "1001") { id } }"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example00SingleFieldQuery" do
  writeGraphql query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://elm-graphql.herokuapp.com" query

  (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

  response' `Test.Spec.shouldEqual` Just (Id "1001")
