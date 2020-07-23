module Examples.MyTests.Example12Mutation where

import Protolude (Either, Unit, apply, bind, discard, error, map, pure, throwError, ($), (<<<), (\/))

import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec
import GraphqlClient (GraphqlError, Scope__RootMutation, SelectionSet, defaultInput, gqlRequest, printGraphqlError, writeGraphql)
import Examples.SwapiCustomScalars (Id(..))
import Examples.Swapi.Mutation as Mutation
import Examples.Swapi.Interface.Character as Character
import Examples.Swapi.Scopes
import Examples.MyTests.Util

type Response = Int

mutation :: SelectionSet Scope__RootMutation Response
mutation = Mutation.increment

expectedMutation :: String
expectedMutation = inlineAndTrim """
mutation {
  increment
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example12Mutation" do
  writeGraphql mutation `Test.Spec.shouldEqual` expectedMutation

  (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://elm-graphql.herokuapp.com" [] mutation

  (throwError <<< error <<< printGraphqlError) \/ pure $ response
