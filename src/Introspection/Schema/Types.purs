module Fernet.Introspection.Schema.Types where

import Prelude

import Data.Generic.Rep (class Generic)
import Fernet.Foreign.GraphQLEnumReadForeign (graphQLEnumReadForeign)
import Simple.JSON (class ReadForeign)
import Data.Generic.Rep.Show (genericShow)

data Schema = Schema

data Type = Type

data Field = Field

data EnumValue = EnumValue

data InputValue = InputValue

data TypeKind = Scalar
  | Object
  | Interface
  | Union
  | Enum
  | InputObject
  | List
  | NonNull
derive instance eqTypeKind :: Eq TypeKind
derive instance genericTypeKind :: Generic TypeKind _

instance showTypeKind :: Show TypeKind where
  show = genericShow

instance typeKindReadForeign :: ReadForeign TypeKind where
  readImpl = graphQLEnumReadForeign
