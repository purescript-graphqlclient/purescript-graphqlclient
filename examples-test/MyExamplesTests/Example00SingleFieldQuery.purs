module MyExamplesTests.Example00SingleFieldQuery where

import Protolude

import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec
import GraphQLClient (GraphQLError, Scope__RootQuery, SelectionSet, defaultRequestOptions, graphqlQueryRequest, printGraphQLError, writeGraphQL)
import Examples.SwapiCustomScalars (Id(..))
import Examples.Swapi.Object.Human (id)
import Examples.Swapi.Query (human)
import MyExamplesTests.Util

type Response = Maybe Id

query :: SelectionSet Scope__RootQuery Response
query = human { id: Id 1001 } id

expectedQuery :: String
expectedQuery = inlineAndTrim """
query {
  human1563269760: human(id: "1001") {
    id
  }
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example00SingleFieldQuery" do
  writeGraphQL query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://elm-graphql.herokuapp.com" defaultRequestOptions query

  (response' :: Response) <- (throwError <<< error <<< printGraphQLError) \/ pure $ response

  response' `Test.Spec.shouldEqual` Just (Id 1001)
