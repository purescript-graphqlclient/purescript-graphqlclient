module Swapi.Object.ChatMessage where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Scalar
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase
import Swapi.Interface.Character

data Scope__ChatMessage

character :: SelectionSet Scope__ChatMessage Scope__Character
character = selectionForField "character" [] graphqlDefaultResponseScalarDecoder

phrase :: SelectionSet Scope__ChatMessage (Maybe Phrase)
phrase = selectionForField "phrase" [] graphqlDefaultResponseScalarDecoder
