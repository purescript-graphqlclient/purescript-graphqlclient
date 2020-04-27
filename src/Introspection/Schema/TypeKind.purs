module Fernet.Introspection.Schema.TypeKind where

import Prelude
import Data.Generic.Rep as GenericRep
import Data.Generic.Rep.Show as GenericRep
import Data.Argonaut.Decode as ArgonautCodecs
import Data.Argonaut.Encode as ArgonautCodecs
import Data.Argonaut.Decode.Generic.Rep as ArgonautGeneric
import Data.Argonaut.Encode.Generic.Rep as ArgonautGeneric
import Fernet.Decode.GraphqlEnum as Fernet.Decode.GraphqlEnum

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

instance decodeJsonTypeKind :: ArgonautCodecs.DecodeJson TypeKind where
  decodeJson = Fernet.Decode.GraphqlEnum.genericDecodeGraphqlEnum
