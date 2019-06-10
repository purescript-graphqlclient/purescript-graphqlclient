module Main where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class.Console (logShow)
import Fernet.GraphQL.HTTP (gqlRequest)
import Fernet.GraphQL.SelectionSet (RootQuery, SelectionSet(..), emptyArgs, (<~>))
import Type.Data.Row (RProxy(..))

-- Examples/
-- Countries GQL API
data Language = Language

type LanguageArgs = { code :: String }
_language ::
  forall a r.
  LanguageArgs ->
  SelectionSet a r Language ->
  SelectionSet ( language :: LanguageArgs ) ( language :: Record r ) RootQuery
_language args _ = SelectionSet { language: args } RProxy

_languages :: forall a r. SelectionSet a r Language -> SelectionSet () (languages :: Array (Record r)) RootQuery
_languages _ = emptyArgs

_code :: SelectionSet () (code :: Maybe String) Language
_code = emptyArgs

_name :: SelectionSet () (name :: Maybe String) Language
_name = emptyArgs

_native :: SelectionSet () (native :: Maybe String) Language
_native = emptyArgs

_rtl :: SelectionSet () (rtl :: Maybe Int) Language
_rtl = emptyArgs

-- /Examples

languagesQuery :: SelectionSet ()
  ( languages :: Array
                   { code :: Maybe String
                   , name :: Maybe String
                   , native :: Maybe String
                   , rtl :: Maybe Int
                   }
  )
  RootQuery
languagesQuery = (_languages (_code <~> _name <~> _native <~> _rtl))
languageQuery :: SelectionSet
  ( language :: { code :: String
                }
  )
  ( language :: { name :: Maybe String
                }
  )
  RootQuery
languageQuery = _language {code: "ar"} _name

main :: Effect Unit
main = launchAff_ do
  resp <- gqlRequest "https://countries.trevorblades.com/" (languagesQuery)
  case resp of
    Left e -> logShow e
    Right query -> logShow query
