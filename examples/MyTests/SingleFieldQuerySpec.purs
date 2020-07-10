module Examples.MyTests.SingleFieldQuerySpec where

import Protolude

import Test.Spec as Test.Spec
import GraphqlClient
import Swapi.Scalar

type Response = Maybe Id

type HumanInput =
  { id :: Id
  }

data Scope__Human

human :: ∀ r . HumanInput -> SelectionSet Scope__Human r -> SelectionSet RootQuery (Maybe r)
human input = selectionForCompositeField "human" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Human Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

query :: SelectionSet RootQuery Response
query = human { id: Id "1001" } id

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "SingleFieldQuerySpec" do
  pure unit
