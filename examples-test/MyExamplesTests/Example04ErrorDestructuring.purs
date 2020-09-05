module MyExamplesTests.Example04ErrorDestructuring where

import GraphqlClient (GraphqlError(..), GraphqlUserErrorDetail(..), PossiblyParsedData(..), Scope__RootQuery, SelectionSet, graphqlQueryRequest, writeGraphql)
import Protolude (Either(..), Maybe(..), Unit, bind, discard)
import Data.Array.NonEmpty as NonEmptyArray

import Examples.Swapi.Query as Query
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (fail, shouldEqual) as Test.Spec
import MyExamplesTests.Util

type Response = Maybe String

query :: SelectionSet Scope__RootQuery Response
query = Query.forcedError

expectedQuery :: String
expectedQuery = inlineAndTrim """
query {
  forcedError
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example04ErrorDestructuring" do
  writeGraphql query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphqlError Response) Response) <- graphqlQueryRequest "https://elm-graphql.herokuapp.com" [] query

  case response of
       Left (GraphqlUserError detail (ParsedData Nothing)) ->
         case NonEmptyArray.uncons detail of
              { head: GraphqlUserErrorDetail { message }, tail: [] } -> message `Test.Spec.shouldEqual` "Artificial error..."
              _ -> Test.Spec.fail "should be only 1"
       Left _ -> Test.Spec.fail "should be GraphqlUserError"
       Right _ -> Test.Spec.fail "should fail"
