module Main where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class.Console (logShow)
import Fernet.GraphQL.HTTP (gqlRequest)
import Fernet.GraphQL.SelectionSet (RootQuery, SelectionSet, (<|>))
import Fernet.GraphQL.WriteGraphQL (writeGQL)

import Fernet.Examples.Countries (language, languages, code, name, native, rtl)

languagesQuery :: SelectionSet
  ( languages :: Array
                   { code :: Maybe String
                   , name :: Maybe String
                   , native :: Maybe String
                   , rtl :: Maybe Int
                   }
  )
  RootQuery
languagesQuery =
  languages (code <|> name <|> native <|> rtl)

languageQuery :: SelectionSet
  ( language :: { name :: Maybe String
                }
  )
  RootQuery
languageQuery = language "ar" name

finalQuery :: SelectionSet
  ( language :: { name :: Maybe String
                }
  , languages :: Array
                   { code :: Maybe String
                   , name :: Maybe String
                   , native :: Maybe String
                   , rtl :: Maybe Int
                   }
  )
  RootQuery
finalQuery = languagesQuery <|> languageQuery

main :: Effect Unit
main =
  launchAff_ do
    logShow $ writeGQL finalQuery
    resp <- gqlRequest "https://countries.trevorblades.com/" finalQuery
    case resp of
      Left e -> logShow e
      Right query -> logShow query
