module Dillonkearns.MyExamplesTests.Example12Mutation where

import Control.Monad.Error.Class (throwError)
import Effect.Exception (error)
import Dillonkearns.MyExamplesTests.Util (inlineAndTrim)
import Data.Either (Either, either)
import Dillonkearns.Examples.Swapi.Mutation as Mutation
import Dillonkearns.GraphQLClient (GraphQLError, Scope__RootMutation, SelectionSet, defaultRequestOptions, graphqlMutationRequest, printGraphQLError, writeGraphQL)
import Prelude
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response
  = Int

mutation :: SelectionSet Scope__RootMutation Response
mutation = Mutation.increment

expectedMutation :: String
expectedMutation =
  inlineAndTrim
    """
mutation {
  increment
}
"""

spec :: Test.Spec.Spec Unit
spec =
  Test.Spec.it "Example12Mutation" do
    writeGraphQL mutation `Test.Spec.shouldEqual` expectedMutation
    (response :: Either (GraphQLError Response) Response) <- graphqlMutationRequest "https://elm-graphql.herokuapp.com" defaultRequestOptions mutation
    void $ either (throwError <<< error <<< printGraphQLError) pure $ response
