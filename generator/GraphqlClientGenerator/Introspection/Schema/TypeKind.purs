module GraphqlClientGenerator.Introspection.Schema.TypeKind where

import Prelude

import Data.Argonaut.Decode as ArgonautCodecs
import Data.Argonaut.Decode.Generic.Rep as ArgonautGeneric
import Data.Argonaut.Encode as ArgonautCodecs
import Data.Argonaut.Encode.Generic.Rep as ArgonautGeneric
import Data.Generic.Rep as GenericRep
import Data.Generic.Rep.Show as GenericRep
import GraphqlClient.GraphqlEnum as GraphqlClient.GraphqlEnum
import GraphqlClient.Implementation as GraphqlClient.Implementation

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

instance typeKindGraphqlDefaultResponseScalarDecoder :: GraphqlClient.Implementation.GraphqlDefaultResponseScalarDecoder TypeKind where
  graphqlDefaultResponseScalarDecoder = GraphqlClient.GraphqlEnum.genericDecodeGraphqlEnum
