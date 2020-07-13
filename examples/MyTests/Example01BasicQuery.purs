module Examples.MyTests.Example01BasicQuery where

import Protolude

import Test.Spec as Test.Spec
import Test.Spec.Assertions as Test.Spec
import GraphqlClient
import Swapi.Scalar
import Swapi.Query as Query
import Swapi.Interface.Character as Character

type Response = CharacterResponse

type CharacterResponse =
  { name :: String
  , id :: Id
  , friends :: Array String
  }

query :: SelectionSet Scope__RootQuery Response
query = Query.hero defaultInput characterInfoSelection

characterInfoSelection :: SelectionSet Character.Scope__Character CharacterResponse
characterInfoSelection = { name: _, id: _, friends: _ } <$> Character.name <*> Character.id <*> Character.friends Character.name

expectedQuery :: String
expectedQuery = """query { hero { name id friends { name } } }"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example01BasicQuery" do
  writeGraphql query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://elm-graphql.herokuapp.com" query

  (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

  response' `Test.Spec.shouldEqual` { friends: ["Han Solo","Leia Organa","C-3PO","R2-D2"], id: Id "1000", name: "Luke Skywalker" }
