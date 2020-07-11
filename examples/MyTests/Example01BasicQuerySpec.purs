module Examples.MyTests.Example01BasicQuerySpec where

import Protolude

import Test.Spec as Test.Spec
import Test.Spec.Assertions as Test.Spec
import GraphqlClient
import Swapi.Scalar

type Response = Character

type Character =
  {
  }

type HumanInput =
  { id :: Id
  }

data Scope__Human

-- | human :: ∀ r . HumanInput -> SelectionSet Scope__Human r -> SelectionSet Scope__RootQuery (Maybe r)
-- | human input = selectionForCompositeField "human" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

-- | id :: SelectionSet Scope__Human Id
-- | id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

-- | query :: SelectionSet Scope__RootQuery Response
-- | query = human { id: Id "1001" } id

-- | expectedQuery :: String
-- | expectedQuery = """query { human(id: "1001") { id } }"""

-- | spec :: Test.Spec.Spec Unit
-- | spec = Test.Spec.it "Example01BasicQuerySpec" do
-- |   writeGraphql query `Test.Spec.shouldEqual` expectedQuery

-- |   (response :: Either (GraphqlError Response) Response) <- gqlRequest "https://elm-graphql.herokuapp.com" query

-- |   (response' :: Response) <- (throwError <<< error <<< printGraphqlError) \/ pure $ response

-- |   response' `Test.Spec.shouldEqual` Just (Id "1001")
