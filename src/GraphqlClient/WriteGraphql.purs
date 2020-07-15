module GraphqlClient.WriteGraphql where

import Protolude

import Data.Array as Array
import Data.Int as Int
import Data.String as String
import GraphqlClient.Implementation (Argument(..), ArgumentValue(..), RawField(..), Scope__RootQuery, Scope__RootMutation, Scope__RootSubscription, SelectionSet(..), Optional(..))

class WriteGraphql a where
  writeGraphql :: a -> String

instance writeGraphQuery :: WriteGraphql (SelectionSet Scope__RootQuery a) where
  writeGraphql (SelectionSet fields _decoder) = "query" <> writeGraphqlArrayRawField fields

instance writeGraphMutation :: WriteGraphql (SelectionSet Scope__RootMutation a) where
  writeGraphql (SelectionSet fields _decoder) = "mutation" <> writeGraphqlArrayRawField fields

instance writeGraphSubscription :: WriteGraphql (SelectionSet Scope__RootSubscription a) where
  writeGraphql (SelectionSet fields _decoder) = "subscription" <> writeGraphqlArrayRawField fields

writeGraphqlRawField :: RawField -> String
writeGraphqlRawField = case _ of
  Leaf name args -> name <> writeGraphqlArguments args
  Composite name args subFields -> name <> writeGraphqlArguments args <> writeGraphqlArrayRawField subFields
  OnSpread onType [] -> ""
  OnSpread onType subFields -> "...on " <> onType <> writeGraphqlArrayRawField subFields

writeGraphqlArrayRawField :: Array RawField -> String
writeGraphqlArrayRawField [] = ""
writeGraphqlArrayRawField fields = " { " <> fields'' <> " }"
  where
    fields' :: Array RawField
    fields' = Array.filter isNonEmpty fields

    fields'' :: String
    fields'' = String.joinWith " " $ __typename <> (writeGraphqlRawField <$> fields')

    __typename :: Array String
    __typename =
      if isOnSpreadPresent fields
        then ["__typename"]
        else []


isNonEmpty :: RawField -> Boolean
isNonEmpty = case _ of
  Composite _ _ [] -> false
  OnSpread _ [] -> false
  _ -> true

isOnSpreadPresent :: Array RawField -> Boolean
isOnSpreadPresent = Array.any isOnSpread

isOnSpread :: RawField -> Boolean
isOnSpread (OnSpread _ _) = true
isOnSpread _ = false

-------------------------

filterAbsent :: Array Argument -> Array (String /\ ArgumentValue)
filterAbsent = Array.mapMaybe go
  where
  go = case _ of
    RequiredArgument n v -> Just (n /\ v)
    OptionalArgument n (Present v) -> Just (n /\ v)
    OptionalArgument _ Absent -> Nothing

writeGraphqlArguments :: Array Argument -> String
writeGraphqlArguments [] = ""
writeGraphqlArguments args =
  let args' = String.joinWith ", " $ writeGraphqlArgumentsNameVal <$> (filterAbsent args)
   in if String.null args' then "" else "(" <> args' <> ")"

writeGraphqlArgumentsNameVal :: String /\ ArgumentValue -> String
writeGraphqlArgumentsNameVal (name /\ value) = name <> ": " <> writeGraphqlArgumentsArgumentValue value

writeGraphqlArgumentsArgumentValue :: ArgumentValue -> String
writeGraphqlArgumentsArgumentValue = case _ of
  ArgumentValueString s -> "\"" <> s <> "\""
  ArgumentValueInt i -> Int.toStringAs Int.decimal i
  ArgumentValueBoolean b -> if b then "true" else "false"
  ArgumentValueMaybe maybeArg -> maybe "null" writeGraphqlArgumentsArgumentValue maybeArg
  ArgumentValueArray [] -> "[]"
  ArgumentValueArray argsArray -> "[" <> (String.joinWith ", " $ map writeGraphqlArgumentsArgumentValue argsArray) <> "]"
  ArgumentValueObject arguments -> writeGraphqlArgumentsArray arguments

writeGraphqlArgumentsArray :: Array Argument -> String
writeGraphqlArgumentsArray [] = ""
writeGraphqlArgumentsArray args =
  let args' = String.joinWith ", " $ writeGraphqlArgumentsNameVal <$> (filterAbsent args)
    in if String.null args' then "" else "{ " <> args' <> " }"
