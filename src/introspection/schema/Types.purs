module Fernet.Introspection.Schema.Types where

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
