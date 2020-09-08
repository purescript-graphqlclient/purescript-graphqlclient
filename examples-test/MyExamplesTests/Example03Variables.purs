module MyExamplesTests.Example03Variables where

import GraphQLClient (GraphQLError, Scope__RootQuery, SelectionSet, defaultRequestOptions, graphqlQueryRequest, printGraphQLError, writeGraphQL)
import Protolude
import Examples.SwapiCustomScalars (Id(..))

import Examples.Swapi.Object.Human as Human
import Examples.Swapi.Scopes (Scope__Human)
import Examples.Swapi.Query as Query
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec
import MyExamplesTests.Util (inlineAndTrim)

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
  human1563269760: human(id: "1001") {
    name
    homePlanet
  }
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example03Variables" do
  writeGraphQL (query (Id 1001)) `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://elm-graphql.herokuapp.com" defaultRequestOptions (query (Id 1001))

  (response' :: Response) <- (throwError <<< error <<< printGraphQLError) \/ pure $ response

  response' `Test.Spec.shouldEqual` Just { homePlanet: Just "Tatooine", name: "Darth Vader" }
