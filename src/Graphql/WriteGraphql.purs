module Fernet.Graphql.WriteGraphql where

import Protolude

import Data.Int (decimal, toStringAs)
import Data.String (joinWith)
import Data.String (null) as Data.String
import Fernet.Graphql.SelectionSet (Argument(..), ArgumentValue(..), RawField(..), RootQuery, SelectionSet(..), Optional(..))

class WriteGraphql a where
  writeGraphql :: a -> String

instance writeGraphQlSelectionSet :: WriteGraphql (SelectionSet RootQuery a) where
  writeGraphql (SelectionSet fields _decoder) = "query" <> writeGraphql fields

instance writeGraphQlRawField :: WriteGraphql RawField where
  writeGraphql field = case field of
    Leaf name args -> name <> writeGraphqlArguments args
    Composite name args subFields -> name <> writeGraphqlArguments args <> writeGraphql subFields

instance writeGraphQlArrayRawField :: WriteGraphql (Array RawField) where
  writeGraphql [] = ""
  writeGraphql fields = " { " <> joinWith " " (writeGraphql <$> fields) <> " }"

-------------------------

writeGraphqlArguments :: Array Argument -> String
writeGraphqlArguments [] = ""
writeGraphqlArguments args =
  let args' = joinWith ", " $ writeGraphqlArgumentsImpl <$> args
   in if Data.String.null args' then "" else "(" <> args' <> ")"

class WriteGraphqlArgumentsImpl a where
  writeGraphqlArgumentsImpl :: a -> String

instance writeGraphQlArgument :: WriteGraphqlArgumentsImpl Argument where
  writeGraphqlArgumentsImpl arg = case arg of
    RequiredArgument name value -> name <> ": " <> writeGraphqlArgumentsImpl value
    OptionalArgument name mValue -> case mValue of
      Present value -> name <> ": " <> writeGraphqlArgumentsImpl value
      Absent -> ""

instance writeGraphQlGqlArgument :: WriteGraphqlArgumentsImpl ArgumentValue where
  writeGraphqlArgumentsImpl value = case value of
    ArgumentValueString s -> "\"" <> s <> "\""
    ArgumentValueInt i -> toStringAs decimal i
    ArgumentValueBoolean b -> if b then "true" else "false"
    ArgumentValueNested arguments -> writeGraphqlArgumentsImpl arguments
    ArgumentValueMaybeEmpty maybeArg -> maybe "null" writeGraphqlArgumentsImpl maybeArg

instance writeGraphQlArrayArgument :: WriteGraphqlArgumentsImpl (Array Argument) where
  writeGraphqlArgumentsImpl [] = ""
  writeGraphqlArgumentsImpl args =
    let args' = joinWith ", " $ writeGraphqlArgumentsImpl <$> args
     in if Data.String.null args' then "" else "{ " <> args' <> " }"
