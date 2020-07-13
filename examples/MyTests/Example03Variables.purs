module Examples.MyTests.Example03Variables where

import GraphqlClient
import Protolude
import Swapi.Scalar

import Swapi.Object.Human (homePlanet)
import Swapi.Object.Human as Human
import Swapi.Query as Query
import Test.Spec as Test.Spec
import Test.Spec.Assertions as Test.Spec

type Response = Maybe HumanResponse

type HumanResponse =
  { name :: String
  , homePlanet :: Maybe String
  }

query :: Id -> SelectionSet Scope__RootQuery Response
query id = Query.human { id } humanInfoSelection

humanInfoSelection :: SelectionSet Human.Scope__Human HumanResponse
humanInfoSelection = { name: _, homePlanet: _ } <$> Human.name <*> Human.homePlanet

expectedQuery :: String
expectedQuery = """query { human(id: "1001") { name homePlanet } }"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example03Variables" do
  writeGraphql (query (Id "1001")) `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://elm-graphql.herokuapp.com" (query (Id "1001"))

  (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

  response' `Test.Spec.shouldEqual` Just { homePlanet: Just "Tatooine", name: "Darth Vader" }
