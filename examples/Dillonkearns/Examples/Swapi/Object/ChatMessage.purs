module Dillonkearns.Examples.Swapi.Object.ChatMessage where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Swapi.Scopes (Scope__Character, Scope__ChatMessage)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Swapi.Enum.Phrase (Phrase)

character
  :: forall r
   . SelectionSet Scope__Character r
  -> SelectionSet Scope__ChatMessage (Maybe r)
character = selectionForCompositeField
            "character"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

phrase :: SelectionSet Scope__ChatMessage Phrase
phrase = selectionForField "phrase" [] graphqlDefaultResponseScalarDecoder
