module Swapi.Object.Droid where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Scalar
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase
import Swapi.Interface.Character

data Scope__Droid

appearsIn :: SelectionSet Scope__Droid (Maybe (Array (Maybe Episode)))
appearsIn = selectionForField "appearsIn" [] graphqlDefaultResponseScalarDecoder

avatarUrl :: SelectionSet Scope__Droid (Maybe String)
avatarUrl = selectionForField "avatarUrl" [] graphqlDefaultResponseScalarDecoder

friends :: SelectionSet Scope__Droid (Maybe (Array (Maybe Scope__Character)))
friends = selectionForField "friends" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Droid (Maybe Id)
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Droid (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

primaryFunction :: SelectionSet Scope__Droid String
primaryFunction = selectionForField "primaryFunction" [] graphqlDefaultResponseScalarDecoder
