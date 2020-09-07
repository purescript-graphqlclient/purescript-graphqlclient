module MyExamplesTests.Example12Mutation where

import MyExamplesTests.Util (inlineAndTrim)

import Examples.Swapi.Mutation as Mutation
import GraphqlClient (GraphqlError, Scope__RootMutation, SelectionSet, defaultRequestOptions, graphqlMutationRequest, printGraphqlError, writeGraphql)
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

  (response :: Either (GraphqlError Response) Response) <- graphqlMutationRequest "https://elm-graphql.herokuapp.com" defaultRequestOptions mutation

  void $ (throwError <<< error <<< printGraphqlError) \/ pure $ response
