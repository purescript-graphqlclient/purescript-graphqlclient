module GraphQLClient.WriteGraphQL where

import Prelude
import Data.Array as Array
import Data.String as String
import Data.Maybe (Maybe(..))
import GraphQLClient.Implementation (RawField(..), Scope__RootMutation, Scope__RootQuery, Scope__RootSubscription, SelectionSet(..))

class WriteGraphQL a where
  writeGraphQL :: a -> String

instance writeGraphQuery :: WriteGraphQL (SelectionSet Scope__RootQuery a) where
  writeGraphQL (SelectionSet fields _decoder) = "query" <> writeGraphQLArrayRawField fields

instance writeGraphMutation :: WriteGraphQL (SelectionSet Scope__RootMutation a) where
  writeGraphQL (SelectionSet fields _decoder) = "mutation" <> writeGraphQLArrayRawField fields

instance writeGraphSubscription :: WriteGraphQL (SelectionSet Scope__RootSubscription a) where
  writeGraphQL (SelectionSet fields _decoder) = "subscription" <> writeGraphQLArrayRawField fields

writeGraphQLRawField :: RawField -> String
writeGraphQLRawField = case _ of
  Leaf name cache -> case cache of
    Nothing -> name
    Just cache' -> name <> cache'.hash <> ": " <> name <> cache'.argsWritten
  Composite name subFields cache -> case cache of
    Nothing -> name <> writeGraphQLArrayRawField subFields
    Just cache' -> name <> cache'.hash <> ": " <> name <> cache'.argsWritten <> writeGraphQLArrayRawField subFields
  OnSpread onType [] -> ""
  OnSpread onType subFields -> "...on " <> onType <> writeGraphQLArrayRawField subFields

writeGraphQLArrayRawField :: Array RawField -> String
writeGraphQLArrayRawField [] = ""
writeGraphQLArrayRawField fields = " { " <> fields'' <> " }"
  where
  fields' :: Array RawField
  fields' = Array.filter (not <<< isEmptyChildren) fields

  fields'' :: String
  fields'' = String.joinWith " " $ __typename <> (writeGraphQLRawField <$> fields')

  __typename :: Array String
  __typename =
    if isOnSpreadPresent fields then
      [ "__typename" ]
    else
      []

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
