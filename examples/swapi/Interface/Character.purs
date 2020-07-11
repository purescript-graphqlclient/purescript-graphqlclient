module Swapi.Interface.Character where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Scalar
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase

data Scope__Character

appearsIn :: SelectionSet Scope__Character (Maybe (Array (Maybe Episode)))
appearsIn = selectionForField "appearsIn" [] graphqlDefaultResponseScalarDecoder

avatarUrl :: SelectionSet Scope__Character (Maybe String)
avatarUrl = selectionForField "avatarUrl" [] graphqlDefaultResponseScalarDecoder

friends :: forall r . SelectionSet Scope__Character r -> SelectionSet Scope__Character (Maybe (Array (Maybe r)))
friends = selectionForCompositeField "friends" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Character (Maybe Id)
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Character (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder
