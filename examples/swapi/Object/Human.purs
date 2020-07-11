module Swapi.Object.Human where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Scalar
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase
import Swapi.Interface.Character

data Scope__Human

appearsIn :: SelectionSet Scope__Human (Maybe (Array (Maybe Episode)))
appearsIn = selectionForField "appearsIn" [] graphqlDefaultResponseScalarDecoder

avatarUrl :: SelectionSet Scope__Human (Maybe String)
avatarUrl = selectionForField "avatarUrl" [] graphqlDefaultResponseScalarDecoder

friends :: SelectionSet Scope__Human (Maybe (Array (Maybe Scope__Character)))
friends = selectionForField "friends" [] graphqlDefaultResponseScalarDecoder

homePlanet :: SelectionSet Scope__Human String
homePlanet = selectionForField "homePlanet" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Human (Maybe Id)
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Human (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder
