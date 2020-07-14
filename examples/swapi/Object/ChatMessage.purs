module Swapi.Object.ChatMessage where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Scalar
import Swapi.InputObject
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase
import Swapi.Scopes

character :: forall r . SelectionSet Scope__CharacterInterface r -> SelectionSet Scope__ChatMessage (Maybe r)
character = selectionForCompositeField "character" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

phrase :: SelectionSet Scope__ChatMessage Phrase
phrase = selectionForField "phrase" [] graphqlDefaultResponseScalarDecoder
