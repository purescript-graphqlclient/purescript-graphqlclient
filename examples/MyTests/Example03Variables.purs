module Examples.MyTests.Example03Variables where

import GraphqlClient (GraphqlError, Scope__RootQuery, SelectionSet, gqlRequest, printGraphqlError, writeGraphql)
import Protolude (Either, Maybe(..), Unit, bind, discard, error, pure, throwError, ($), (<$>), (<*>), (<<<), (\/))
import Swapi.Scalar (Id(..))

import Swapi.Object.Human as Human
import Swapi.Scopes
import Swapi.Query as Query
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec
import Examples.MyTests.Util

type Response = Maybe HumanResponse

type HumanResponse =
  { name :: String
  , homePlanet :: Maybe String
  }

query :: Id -> SelectionSet Scope__RootQuery Response
query id = Query.human { id } humanInfoSelection

humanInfoSelection :: SelectionSet Scope__Human HumanResponse
humanInfoSelection = { name: _, homePlanet: _ } <$> Human.name <*> Human.homePlanet

expectedQuery :: String
expectedQuery = inlineAndTrim """
query {
  human(id: "1001") {
    name
    homePlanet
  }
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example03Variables" do
  writeGraphql (query (Id "1001")) `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://elm-graphql.herokuapp.com" (query (Id "1001"))

  (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

  response' `Test.Spec.shouldEqual` Just { homePlanet: Just "Tatooine", name: "Darth Vader" }
