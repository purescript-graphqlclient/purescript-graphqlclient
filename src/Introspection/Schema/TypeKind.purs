module Fernet.Introspection.Schema.TypeKind where

import Prelude

import Data.Argonaut.Decode as ArgonautCodecs
import Data.Argonaut.Decode.Generic.Rep as ArgonautGeneric
import Data.Argonaut.Encode as ArgonautCodecs
import Data.Argonaut.Encode.Generic.Rep as ArgonautGeneric
import Data.Generic.Rep as GenericRep
import Data.Generic.Rep.Show as GenericRep
import Fernet.Decode.GraphqlEnum as Fernet.Decode.GraphqlEnum
import Fernet.Graphql.SelectionSet as Fernet.Graphql.SelectionSet

data TypeKind
  = Scalar
  | Object
  | Interface
  | Union
  | Enum
  | InputObject
  | List
  | NonNull

derive instance eqTypeKind :: Eq TypeKind

derive instance genericTypeKind :: GenericRep.Generic TypeKind _

instance showTypeKind :: Show TypeKind where
  show = GenericRep.genericShow

instance typeKindGraphqlDefaultResponseScalarDecoder :: Fernet.Graphql.SelectionSet.GraphqlDefaultResponseScalarDecoder TypeKind where
  graphqlDefaultResponseScalarDecoder = Fernet.Decode.GraphqlEnum.genericDecodeGraphqlEnum
