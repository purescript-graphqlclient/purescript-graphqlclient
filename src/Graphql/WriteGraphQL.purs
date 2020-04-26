module Fernet.GraphQL.WriteGraphQL where

import Prelude
import Data.Int (decimal, toStringAs)
import Data.Maybe (Maybe(..))
import Data.String (joinWith)
import Fernet.GraphQL.SelectionSet (Argument(..), ArgumentValue(..), RawField(..), RootQuery, SelectionSet(..))

class WriteGraphQL a where
  writeGQL :: a -> String

instance writeGraphQlSelectionSet :: WriteGraphQL (SelectionSet a RootQuery) where
  writeGQL (SelectionSet fields) = "query " <> writeGQL fields

instance writeGraphQlRawField :: WriteGraphQL RawField where
  writeGQL field = case field of
    Leaf name args -> name <> writeGQL args
    Composite name args subFields -> name <> writeGQL args <> writeGQL subFields

instance writeGraphQlArgument :: WriteGraphQL Argument where
  writeGQL arg = case arg of
    RequiredArgument name value -> name <> ": " <> writeGQL value
    OptionalArgument name mValue -> case mValue of
      Just value -> name <> ": " <> writeGQL value
      Nothing -> ""

instance writeGraphQlGqlArgument :: WriteGraphQL ArgumentValue where
  writeGQL value = case value of
    ArgString s -> "\"" <> s <> "\""
    ArgInt i -> toStringAs decimal i
    ArgBoolean b -> if b then "true" else "false"

instance writeGraphQlArrayRawField :: WriteGraphQL (Array RawField) where
  writeGQL [] = ""
  writeGQL fields = " { " <> joinWith ", " (writeGQL <$> fields) <> " } "

instance writeGraphQlArrayArgument :: WriteGraphQL (Array Argument) where
  writeGQL [] = ""
  writeGQL args = "(" <> joinWith ", " (writeGQL <$> args) <> ")"
