module Main where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class.Console (logShow)
import Fernet.GraphQL.HTTP (gqlRequest)
import Fernet.GraphQL.SelectionSet (RootQuery, SelectionSet, proxy, (<~>))

-- Examples/
-- Countries GQL API
data Language = Language

_languages :: forall r. SelectionSet r Language -> SelectionSet (languages :: Array (Record r)) RootQuery
_languages _ = proxy

_code :: SelectionSet (code :: Maybe String) Language
_code = proxy

_name :: SelectionSet (name :: Maybe String) Language
_name = proxy

_native :: SelectionSet (native :: Maybe String) Language
_native = proxy

_rtl :: SelectionSet (rtl :: Maybe Int) Language
_rtl = proxy

-- /Examples

main :: Effect Unit
main = launchAff_ do
  resp <- gqlRequest "https://countries.trevorblades.com/" (_languages (_code <~> _name <~> _native <~> _rtl))
  case resp of
    Left e -> logShow e
    Right query -> logShow query
