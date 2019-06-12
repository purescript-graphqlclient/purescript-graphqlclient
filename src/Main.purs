module Main where

import Prelude

import Control.Parallel (parTraverse)
import Data.Array (filter)
import Data.Either (Either(..))
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String (take)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class.Console (logShow)
import Fernet.GraphQL.SelectionSet ((<|>), SelectionSet, RootQuery)
import Fernet.GraphQL.WriteGraphQL (writeGQL)
import Fernet.HTTP (gqlRequest)
import Fernet.Introspection.Schema.Field as Field
import Fernet.Introspection.Schema.Query (schema)
import Fernet.Introspection.Schema.Schema (types)
import Fernet.Introspection.Schema.Type as Type
import Fernet.Introspection.Schema.Types (TypeKind(..))
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Node.Path (FilePath)

type TypeResult =
  { fields ::
      Maybe (Array
        { name :: String
        , type ::
            { name :: Maybe String
            , kind :: TypeKind
            }
        })
  , kind :: TypeKind
  , name :: Maybe String
  }

type Result =
  ( __schema ::
        { types ::
            Array TypeResult
        }
    )

query :: SelectionSet Result RootQuery
query =
  schema
    ( types
      ( Type.name
        <|> Type.kind
        <|> Type.fields (Just false)
            ( Field.name
              <|> Field.type'
                    (   Type.name
                    <|> Type.kind
                    )
            )
      )
    )

main :: Effect Unit
main =
  launchAff_ do
    logShow $ writeGQL query
    resp <- gqlRequest "https://countries.trevorblades.com/" query
    case resp of
      Left e -> logShow e
      Right queryResult ->
         writeFiles "output-test" (
          (onlyObjects >>> objectNames >>> existingNonSchemaObjects)
          queryResult.data
        )
  where
  writeFiles :: String -> Array String -> Aff Unit
  writeFiles dir files = do
    _ <- parTraverse
          (\f ->
            writeTextFile
              UTF8
              (dir <> "/" <> f <> ".purs")
              ""
          ) files
    pure unit

  onlyObjects :: (Record Result) -> Array TypeResult
  onlyObjects result = filter (\t -> t.kind == Object) result.__schema.types

  objectNames :: Array TypeResult -> Array (Maybe String)
  objectNames = map _.name

  existingNonSchemaObjects :: Array (Maybe String) -> Array String
  existingNonSchemaObjects =
    filter
      (case _ of
        Just name -> (take 2 name) /= "__"
        Nothing -> false)
    >>> (map $ fromMaybe "")
