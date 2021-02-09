module Dillonkearns.MyExamplesTests.Example02AdoSyntax where

import Control.Monad.Error.Class (throwError)
import Effect.Exception (error)
import Data.Either (Either, either)
import Prelude
import Dillonkearns.Examples.Swapi.Interface.Character as Character
import Dillonkearns.Examples.Swapi.Query as Query
import Dillonkearns.Examples.Swapi.Scopes (Scope__Character)
import Dillonkearns.Examples.SwapiCustomScalars (Id(..))
import Dillonkearns.GraphQLClient (GraphQLError, Scope__RootQuery, SelectionSet, defaultInput, defaultRequestOptions, graphqlQueryRequest, printGraphQLError, writeGraphQL)
import Dillonkearns.MyExamplesTests.Util (inlineAndTrim)
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

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
characterInfoSelection = ado
  name' <- Character.name
  id' <- Character.id
  friends' <- Character.friends Character.name
  in { name: name', id: id', friends: friends' }

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
  Test.Spec.it "Example02AdoSyntax" do
    writeGraphQL query `Test.Spec.shouldEqual` expectedQuery
    (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://elm-graphql.herokuapp.com" defaultRequestOptions query
    (response' :: Response) <- either (throwError <<< error <<< printGraphQLError) pure $ response
    response' `Test.Spec.shouldEqual` { friends: [ "Han Solo", "Leia Organa", "C-3PO", "R2-D2" ], id: Id 1000, name: "Luke Skywalker" }
