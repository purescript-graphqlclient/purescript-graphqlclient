module Fernet.Example.Countries.Language where

import Data.Maybe (Maybe)
import Fernet.Example.Countries.Types (Language)
import Fernet.GraphQL.SelectionSet (SelectionSet, noArgs)

code :: SelectionSet (code :: Maybe String) Language
code = noArgs "code"

name :: SelectionSet (name :: Maybe String) Language
name = noArgs "name"

native :: SelectionSet (native :: Maybe String) Language
native = noArgs "native"

rtl :: SelectionSet (rtl :: Maybe Int) Language
rtl = noArgs "rtl"
