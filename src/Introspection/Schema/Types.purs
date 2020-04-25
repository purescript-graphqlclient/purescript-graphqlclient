module Fernet.Introspection.Schema.Types where

import Prelude
import Data.Generic.Rep as GenericRep
import Data.Generic.Rep.Show as GenericRep
import Data.Argonaut.Decode as ArgonautCodecs
import Data.Argonaut.Encode as ArgonautCodecs
import Data.Argonaut.Decode.Generic.Rep as ArgonautGeneric
import Data.Argonaut.Encode.Generic.Rep as ArgonautGeneric

data Schema
  = Schema

data Type
  = Type

data Field
  = Field

data EnumValue
  = EnumValue

data InputValue
  = InputValue

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
  decodeJson = ArgonautGeneric.genericDecodeJson
