module Main where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class.Console (logShow)
import Fernet.GraphQL.HTTP (gqlRequest)
import Fernet.GraphQL.SelectionSet (RootQuery, SelectionSet(..), emptyArgs, (<|>), RawField(..), Argument(..), ArgumentValue(..))
import Fernet.GraphQL.WriteGraphQL (writeGQL)
import Type.Data.Row (RProxy(..))

-- Examples/
-- Countries GQL API
data Language
  = Language

language ::
 forall r.
 String ->
 SelectionSet r Language ->
 SelectionSet (language :: Record r) RootQuery
language code (SelectionSet fields _) =
 SelectionSet
   [Composite "language" [RequiredArgument "code" (ArgString code)] fields] RProxy

languages :: forall r. SelectionSet r Language -> SelectionSet (languages :: Array (Record r)) RootQuery
languages (SelectionSet fields _) = SelectionSet [Composite "languages" [] fields] RProxy

code :: SelectionSet (code :: Maybe String) Language
code = emptyArgs "code"

name :: SelectionSet  (name :: Maybe String) Language
name = emptyArgs "name"

native :: SelectionSet (native :: Maybe String) Language
native = emptyArgs "native"

rtl :: SelectionSet (rtl :: Maybe Int) Language
rtl = emptyArgs "rtl"

-- /Examples
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
