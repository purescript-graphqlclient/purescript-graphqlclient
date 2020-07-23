module Examples.MyTests.Example12Mutation where

import Examples.MyTests.Util
import Examples.Swapi.Scopes

import Examples.Swapi.Interface.Character as Character
import Examples.Swapi.Mutation as Mutation
import Examples.SwapiCustomScalars (Id(..))
import GraphqlClient (GraphqlError, Scope__RootMutation, SelectionSet, defaultInput, graphqlMutationRequest, printGraphqlError, writeGraphql)
import Protolude
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

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

  (response :: Either (GraphqlError Response) Response) <- graphqlMutationRequest "https://elm-graphql.herokuapp.com" [] mutation

  void $ (throwError <<< error <<< printGraphqlError) \/ pure $ response
