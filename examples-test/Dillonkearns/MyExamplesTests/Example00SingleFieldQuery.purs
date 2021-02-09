module Dillonkearns.MyExamplesTests.Example00SingleFieldQuery where

import Control.Monad.Error.Class (throwError)
import Effect.Exception (error)
import Dillonkearns.MyExamplesTests.Util (inlineAndTrim)
import Prelude
import Data.Either (Either, either)
import Data.Maybe (Maybe(..))
import Dillonkearns.Examples.Swapi.Object.Human (id)
import Dillonkearns.Examples.Swapi.Query (human)
import Dillonkearns.Examples.SwapiCustomScalars (Id(..))
import Dillonkearns.GraphQLClient (GraphQLError, Scope__RootQuery, SelectionSet, defaultRequestOptions, graphqlQueryRequest, printGraphQLError, writeGraphQL)
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response
  = Maybe Id

query :: SelectionSet Scope__RootQuery Response
query = human { id: Id 1001 } id

expectedQuery :: String
expectedQuery =
  inlineAndTrim
    """
query {
  human1563269760: human(id: "1001") {
    id
  }
}
"""

spec :: Test.Spec.Spec Unit
spec =
  Test.Spec.it "Example00SingleFieldQuery" do
    writeGraphQL query `Test.Spec.shouldEqual` expectedQuery
    (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://elm-graphql.herokuapp.com" defaultRequestOptions query
    (response' :: Response) <- either (throwError <<< error <<< printGraphQLError) pure $ response
    response' `Test.Spec.shouldEqual` Just (Id 1001)
