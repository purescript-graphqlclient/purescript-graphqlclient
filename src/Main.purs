module Main where

import Prelude

import Control.Parallel (parTraverse)
import Data.Array (filter)
import Data.Either (Either(..))
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String (joinWith, take)
import Data.Symbol (SProxy(..))
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class.Console (logShow, log)
import Fernet.GraphQL.WriteGraphQL (writeGQL)
import Fernet.HTTP (gqlRequest, printGraphqlError)
import Fernet.Introspection.IntrospectionSchema as Fernet.Introspection.IntrospectionSchema
-- import Fernet.Introspection.Schema.Field as Fernet.Introspection.Schema.Field
-- import Fernet.Introspection.Schema.TypeKind as Fernet.Introspection.Schema.TypeKind
-- import Fernet.Introspection.Schema.Types as Fernet.Introspection.Schema.Types
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Node.FS.Aff.Mkdirp as Node.FS.Aff.Mkdirp

main :: Effect Unit
main =
  launchAff_ do
    resp <- gqlRequest "https://countries.trevorblades.com/" $ Fernet.Introspection.IntrospectionSchema.introspectionQuery false
    case resp of
      Left e -> log $ printGraphqlError e
      Right queryResult -> do
        pure unit
        -- let dir = "examples/countries"
        -- void $ Node.FS.Aff.Mkdirp.mkdirp dir
        -- writePurescriptFiles dir $ onlyObjects >>> (filter (not <<< isSchemaObject)) $ queryResult.data
  -- where
  --   writePurescriptFiles :: String -> Array Fernet.Introspection.IntrospectionSchema.TypeResult -> Aff Unit
  --   writePurescriptFiles dir objectTypes = do
  --     _ <- parTraverse (writePurescriptFile dir) objectTypes
  --     pure unit

  --   writePurescriptFile :: String -> Fernet.Introspection.IntrospectionSchema.TypeResult -> Aff Unit
  --   writePurescriptFile dir object = do
  --     case object.name of
  --       Just name -> writeTextFile UTF8 (dir <> "/" <> name <> ".purs") $ generateForObject object
  --       Nothing -> pure unit

  --   generateForObject :: Fernet.Introspection.IntrospectionSchema.TypeResult -> String
  --   generateForObject object = case object.name of
  --     Just name ->
  --       "module Text."
  --         <> name
  --         <> generateForFields name object.fields
  --     Nothing -> ""

  --   generateForFields :: String -> Maybe (Array Fernet.Introspection.IntrospectionSchema.FieldResult) -> String
  --   generateForFields onObject = case _ of
  --     Just fields -> joinWith "\n" ((generateForField onObject) <$> fields)
  --     Nothing -> ""

  --   generateForField :: String -> Fernet.Introspection.IntrospectionSchema.FieldResult -> String
  --   generateForField onObject field =
  --     field.name
  --       <> " :: SelectionSet ("
  --       <> field.name
  --       <> " :: ?) "
  --       <> onObject

  --   onlyObjects :: (Record Fernet.Introspection.IntrospectionSchema.Result) -> Array Fernet.Introspection.IntrospectionSchema.TypeResult
  --   onlyObjects result = filter (\t -> t.kind == Fernet.Introspection.Schema.TypeKind.Object) result.__schema.types

  --   objectNames :: Array Fernet.Introspection.IntrospectionSchema.TypeResult -> Array (Maybe String)
  --   objectNames = map _.name

  --   isSchemaObject :: forall a. { name :: Maybe String | a } -> Boolean
  --   isSchemaObject object = case object.name of
  --     Just name -> (take 2 name) == "__"
  --     Nothing -> false
