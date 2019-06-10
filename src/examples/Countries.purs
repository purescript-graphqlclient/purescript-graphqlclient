module Fernet.Examples.Countries where

import Data.Maybe (Maybe)
import Fernet.GraphQL.SelectionSet (Argument(..), ArgumentValue(..), RawField(..), RootQuery, SelectionSet(..), noArgs)
import Type.Data.Row (RProxy(..))

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
code = noArgs "code"

name :: SelectionSet  (name :: Maybe String) Language
name = noArgs "name"

native :: SelectionSet (native :: Maybe String) Language
native = noArgs "native"

rtl :: SelectionSet (rtl :: Maybe Int) Language
rtl = noArgs "rtl"
