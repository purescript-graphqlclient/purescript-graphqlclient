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
import Fernet.GraphQL.SelectionSet ((<|>), SelectionSet, RootQuery)
import Fernet.GraphQL.WriteGraphQL (writeGQL)
import Fernet.HTTP (gqlRequest, printGraphqlError)
import Fernet.Introspection.Schema.Field as Field
import Fernet.Introspection.Schema.Query (schema)
import Fernet.Introspection.Schema.Schema (types)
import Fernet.Introspection.Schema.Type as Type
import Fernet.Introspection.Schema.InputValue as InputValue
import Fernet.Introspection.Schema.Types (InputValue(..), Type(..), TypeKind(..))
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Node.FS.Aff.Mkdirp as Node.FS.Aff.Mkdirp

type FieldResult
  = { name :: String
    , type ::
      { name :: Maybe String
      , kind :: TypeKind
      }
    }

type TypeResult
  = { name :: Maybe String
    , kind :: TypeKind
    , fields :: Maybe (Array FieldResult)
    }

type Result
  = ( __schema ::
      { types ::
        Array TypeResult
      }
    )

typeRefSelection ::
  SelectionSet
    ( kind :: TypeKind
    , name :: Maybe String
    , ofType ::
      { kind :: TypeKind
      , name :: Maybe String
      , ofType ::
        { kind :: TypeKind
        , name :: Maybe String
        , ofType ::
          { kind :: TypeKind
          , name :: Maybe String
          , ofType ::
            { kind :: TypeKind
            , name :: Maybe String
            , ofType ::
              { kind :: TypeKind
              , name :: Maybe String
              , ofType ::
                { kind :: TypeKind
                , name :: Maybe String
                }
              }
            }
          }
        }
      }
    )
    Type
typeRefSelection =
  Type.kind
    <|> Type.name
    <|> Type.ofType
        ( Type.kind
            <|> Type.name
            <|> Type.ofType
                ( Type.kind
                    <|> Type.name
                    <|> Type.ofType
                        ( Type.kind
                            <|> Type.name
                            <|> Type.ofType
                                ( Type.kind
                                    <|> Type.name
                                    <|> Type.ofType
                                        ( Type.kind
                                            <|> Type.name
                                            <|> Type.ofType
                                                ( Type.kind
                                                    <|> Type.name
                                                )
                                        )
                                )
                        )
                )
        )

inputValueSelection ::
  SelectionSet
    ( defaultValue :: Maybe String
    , desciption :: Maybe String
    , name :: Maybe String
    , type ::
      { kind :: TypeKind
      , name :: Maybe String
      , ofType ::
        { kind :: TypeKind
        , name :: Maybe String
        , ofType ::
          { kind :: TypeKind
          , name :: Maybe String
          , ofType ::
            { kind :: TypeKind
            , name :: Maybe String
            , ofType ::
              { kind :: TypeKind
              , name :: Maybe String
              , ofType ::
                { kind :: TypeKind
                , name :: Maybe String
                , ofType ::
                  { kind :: TypeKind
                  , name :: Maybe String
                  }
                }
              }
            }
          }
        }
      }
    )
    InputValue
inputValueSelection =
  InputValue.name
    <|> InputValue.description
    <|> (InputValue.type' typeRefSelection)
    <|> InputValue.defaultValue

introspectionQuery :: SelectionSet Result RootQuery
introspectionQuery =
  schema
    ( types
        ( Type.name
          <|> Type.kind
          <|> Type.fields (Just false)
              ( Field.name
                  <|> Field.type'
                      ( Type.name
                          <|> Type.kind
                      )
              )
        )
    )

main :: Effect Unit
main =
  launchAff_ do
    resp <- gqlRequest "https://countries.trevorblades.com/" introspectionQuery
    case resp of
      Left e -> log $ printGraphqlError e
      Right queryResult -> do
        let dir = "examples/countries"
        void $ Node.FS.Aff.Mkdirp.mkdirp dir
        writePurescriptFiles dir $ onlyObjects >>> (filter (not <<< isSchemaObject)) $ queryResult.data
  where
    writePurescriptFiles :: String -> Array TypeResult -> Aff Unit
    writePurescriptFiles dir objectTypes = do
      _ <- parTraverse (writePurescriptFile dir) objectTypes
      pure unit

    writePurescriptFile :: String -> TypeResult -> Aff Unit
    writePurescriptFile dir object = do
      case object.name of
        Just name -> writeTextFile UTF8 (dir <> "/" <> name <> ".purs") $ generateForObject object
        Nothing -> pure unit

    generateForObject :: TypeResult -> String
    generateForObject object = case object.name of
      Just name ->
        "module Text."
          <> name
          <> generateForFields name object.fields
      Nothing -> ""

    generateForFields :: String -> Maybe (Array FieldResult) -> String
    generateForFields onObject = case _ of
      Just fields -> joinWith "\n" ((generateForField onObject) <$> fields)
      Nothing -> ""

    generateForField :: String -> FieldResult -> String
    generateForField onObject field =
      field.name
        <> " :: SelectionSet ("
        <> field.name
        <> " :: ?) "
        <> onObject

    onlyObjects :: (Record Result) -> Array TypeResult
    onlyObjects result = filter (\t -> t.kind == Object) result.__schema.types

    objectNames :: Array TypeResult -> Array (Maybe String)
    objectNames = map _.name

    isSchemaObject :: forall a. { name :: Maybe String | a } -> Boolean
    isSchemaObject object = case object.name of
      Just name -> (take 2 name) == "__"
      Nothing -> false
