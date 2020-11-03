module MyExamplesTests.Example01BasicQuery where

import Control.Monad.Error.Class (throwError)
import Effect.Exception (error)
import Prelude
import Data.Either (Either, either)
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec
import GraphQLClient (GraphQLError, Scope__RootQuery, SelectionSet, defaultInput, defaultRequestOptions, graphqlQueryRequest, printGraphQLError, writeGraphQL)
import Examples.SwapiCustomScalars (Id(..))
import Examples.Swapi.Query as Query
import Examples.Swapi.Interface.Character as Character
import Examples.Swapi.Scopes (Scope__Character)
import MyExamplesTests.Util (inlineAndTrim)

type Response
  = CharacterResponse

type CharacterResponse
  = { name :: String
    , id :: Id
    , friends :: Array String
    }

query :: SelectionSet Scope__RootQuery Response
query = Query.hero defaultInput characterInfoSelection

characterInfoSelection :: SelectionSet Scope__Character CharacterResponse
characterInfoSelection = { name: _, id: _, friends: _ } <$> Character.name <*> Character.id <*> Character.friends Character.name

expectedQuery :: String
expectedQuery =
  inlineAndTrim
    """
query {
  hero {
    name
    id
    friends {
      name
    }
  }
}
"""

spec :: Test.Spec.Spec Unit
spec =
  Test.Spec.it "Example01BasicQuery" do
    writeGraphQL query `Test.Spec.shouldEqual` expectedQuery
    (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://elm-graphql.herokuapp.com" defaultRequestOptions query
    (response' :: Response) <- either (throwError <<< error <<< printGraphQLError) pure $ response
    response' `Test.Spec.shouldEqual` { friends: [ "Han Solo", "Leia Organa", "C-3PO", "R2-D2" ], id: Id 1000, name: "Luke Skywalker" }
