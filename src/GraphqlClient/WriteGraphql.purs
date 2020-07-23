module GraphqlClient.WriteGraphql where

import Protolude (Maybe(..), not, ($), (<$>), (<<<), (<>))

import Data.Array as Array
import Data.String as String
import GraphqlClient.Implementation (RawField(..), Scope__RootMutation, Scope__RootQuery, Scope__RootSubscription, SelectionSet(..))

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
  Leaf name cache ->
    case cache of
         Nothing -> name
         Just cache' -> name <> cache'.hash <> ": " <> name <> cache'.argsWritten
  Composite name subFields cache ->
    case cache of
         Nothing -> name <> writeGraphqlArrayRawField subFields
         Just cache' -> name <> cache'.hash <> ": " <> name <> cache'.argsWritten <> writeGraphqlArrayRawField subFields
  OnSpread onType [] -> ""
  OnSpread onType subFields -> "...on " <> onType <> writeGraphqlArrayRawField subFields

writeGraphqlArrayRawField :: Array RawField -> String
writeGraphqlArrayRawField [] = ""
writeGraphqlArrayRawField fields = " { " <> fields'' <> " }"
  where
    fields' :: Array RawField
    fields' = Array.filter (not <<< isEmptyChildren) fields

    fields'' :: String
    fields'' = String.joinWith " " $ __typename <> (writeGraphqlRawField <$> fields')

    __typename :: Array String
    __typename =
      if isOnSpreadPresent fields
        then ["__typename"]
        else []

isEmptyChildren :: RawField -> Boolean
isEmptyChildren = case _ of
  Composite _ [] _ -> true
  OnSpread _ [] -> true
  _ -> false

isOnSpreadPresent :: Array RawField -> Boolean
isOnSpreadPresent = Array.any isOnSpread

isOnSpread :: RawField -> Boolean
isOnSpread (OnSpread _ _) = true
isOnSpread _ = false
