module GraphqlClient.WriteGraphql where

import Protolude

import Data.Array as Array
import Data.Int as Int
import Data.String as String
import GraphqlClient.Implementation (Argument(..), ArgumentValue(..), RawField(..), Scope__RootQuery, SelectionSet(..), Optional(..))

class WriteGraphql a where
  writeGraphql :: a -> String

instance writeGraphQlSelectionSet :: WriteGraphql (SelectionSet Scope__RootQuery a) where
  writeGraphql (SelectionSet fields _decoder) = "query" <> writeGraphql fields

instance writeGraphQlRawField :: WriteGraphql RawField where
  writeGraphql field = case field of
    Leaf name args -> name <> writeGraphqlArguments args
    Composite name args subFields -> name <> writeGraphqlArguments args <> writeGraphql subFields
    OnSpread onType subFields -> "...on " <> onType <> writeGraphql subFields

instance writeGraphQlArrayRawField :: WriteGraphql (Array RawField) where
  writeGraphql [] = ""
  writeGraphql fields = " { " <> __typename <> fields' <> " }"
    where
      fields' :: String
      fields' = String.joinWith " " (writeGraphql <$> fields)

      __typename :: String
      __typename =
        if isOnSpreadPresent fields
          then "__typename "
          else ""


isOnSpreadPresent :: Array RawField -> Boolean
isOnSpreadPresent = Array.any isOnSpread

isOnSpread :: RawField -> Boolean
isOnSpread (OnSpread _ _) = true
isOnSpread _ = false

-------------------------

writeGraphqlArguments :: Array Argument -> String
writeGraphqlArguments [] = ""
writeGraphqlArguments args =
  let args' = String.joinWith ", " $ writeGraphqlArgumentsImpl <$> args
   in if String.null args' then "" else "(" <> args' <> ")"

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
    ArgumentValueInt i -> Int.toStringAs Int.decimal i
    ArgumentValueBoolean b -> if b then "true" else "false"
    ArgumentValueMaybe maybeArg -> maybe "null" writeGraphqlArgumentsImpl maybeArg
    ArgumentValueArray [] -> "[]"
    ArgumentValueArray argsArray -> "[" <> (String.joinWith ", " $ map writeGraphqlArgumentsImpl argsArray) <> "]"
    ArgumentValueObject arguments -> writeGraphqlArgumentsImpl arguments

instance writeGraphQlArrayArgument :: WriteGraphqlArgumentsImpl (Array Argument) where
  writeGraphqlArgumentsImpl [] = ""
  writeGraphqlArgumentsImpl args =
    let args' = String.joinWith ", " $ writeGraphqlArgumentsImpl <$> args
     in if String.null args' then "" else "{ " <> args' <> " }"
