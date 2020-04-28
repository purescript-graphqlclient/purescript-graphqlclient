module Fernet.Graphql.WriteGraphql where

import Prelude
import Data.Int (decimal, toStringAs)
import Data.Maybe (Maybe(..))
import Data.String (joinWith)
import Fernet.Graphql.SelectionSet (Argument(..), ArgumentValue(..), RawField(..), RootQuery, SelectionSet(..))

class WriteGraphql a where
  writeGraphql :: a -> String

instance writeGraphQlSelectionSet :: WriteGraphql (SelectionSet RootQuery a) where
  writeGraphql (SelectionSet fields _decoder) = "query " <> writeGraphql fields

instance writeGraphQlRawField :: WriteGraphql RawField where
  writeGraphql field = case field of
    Leaf name args -> name <> writeGraphql args
    Composite name args subFields -> name <> writeGraphql args <> writeGraphql subFields

instance writeGraphQlArgument :: WriteGraphql Argument where
  writeGraphql arg = case arg of
    RequiredArgument name value -> name <> ": " <> writeGraphql value
    OptionalArgument name mValue -> case mValue of
      Just value -> name <> ": " <> writeGraphql value
      Nothing -> ""

instance writeGraphQlGqlArgument :: WriteGraphql ArgumentValue where
  writeGraphql value = case value of
    ArgString s -> "\"" <> s <> "\""
    ArgInt i -> toStringAs decimal i
    ArgBoolean b -> if b then "true" else "false"

instance writeGraphQlArrayRawField :: WriteGraphql (Array RawField) where
  writeGraphql [] = ""
  writeGraphql fields = " { " <> joinWith ", " (writeGraphql <$> fields) <> " } "

instance writeGraphQlArrayArgument :: WriteGraphql (Array Argument) where
  writeGraphql [] = ""
  writeGraphql args = "(" <> joinWith ", " (writeGraphql <$> args) <> ")"
