module Examples.Swapi.Object.ChatMessage where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Swapi.InputObject
import Type.Row
import Examples.Swapi.Enum.Episode
import Examples.Swapi.Enum.Language
import Examples.Swapi.Enum.Phrase
import Examples.Swapi.Scopes
import Examples.SwapiCustomScalars

character :: forall r . SelectionSet Scope__Character r -> SelectionSet Scope__ChatMessage (Maybe r)
character = selectionForCompositeField "character" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

phrase :: SelectionSet Scope__ChatMessage Phrase
phrase = selectionForField "phrase" [] graphqlDefaultResponseScalarDecoder
