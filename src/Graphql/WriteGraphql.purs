module Fernet.Graphql.WriteGraphql where

import Protolude

import Data.Int (decimal, toStringAs)
import Data.Maybe (Maybe(..))
import Data.String (joinWith)
import Data.String (null) as Data.String
import Fernet.Graphql.SelectionSet (Argument(..), ArgumentValue(..), RawField(..), RootQuery, SelectionSet(..), Optional(..))

class WriteGraphql a where
  writeGraphql :: a -> String

instance writeGraphQlSelectionSet :: WriteGraphql (SelectionSet RootQuery a) where
  writeGraphql (SelectionSet fields _decoder) = "query" <> writeGraphql fields

instance writeGraphQlRawField :: WriteGraphql RawField where
  writeGraphql field = case field of
    Leaf name args -> name <> writeGraphql args
    Composite name args subFields -> name <> writeGraphql args <> writeGraphql subFields

instance writeGraphQlArrayRawField :: WriteGraphql (Array RawField) where
  writeGraphql [] = ""
  writeGraphql fields = " { " <> joinWith " " (writeGraphql <$> fields) <> " }"

-------------------------

instance writeGraphQlArgument :: WriteGraphql Argument where
  writeGraphql arg = case arg of
    RequiredArgument name value -> name <> ": " <> writeGraphql value
    OptionalArgument name mValue -> case mValue of
      Present value -> name <> ": " <> writeGraphql value
      Absent -> ""

instance writeGraphQlGqlArgument :: WriteGraphql ArgumentValue where
  writeGraphql value = case value of
    ArgumentValueString s -> "\"" <> s <> "\""
    ArgumentValueInt i -> toStringAs decimal i
    ArgumentValueBoolean b -> if b then "true" else "false"
    ArgumentValueNested arguments -> writeGraphql arguments
    ArgumentValueMaybeEmpty maybeArg -> maybe "null" writeGraphql maybeArg

instance writeGraphQlArrayArgument :: WriteGraphql (Array Argument) where
  writeGraphql [] = ""
  writeGraphql args =
    let args' = joinWith ", " $ writeGraphql <$> args
     in if Data.String.null args' then "" else "(" <> args' <> ")"
