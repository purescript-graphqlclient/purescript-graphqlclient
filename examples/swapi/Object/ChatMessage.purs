module Examples.Swapi.Object.ChatMessage where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Swapi.Scopes (Scope__Character, Scope__ChatMessage)
import Data.Maybe (Maybe)
import Examples.Swapi.Enum.Phrase (Phrase)

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
