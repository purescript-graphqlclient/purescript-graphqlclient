module Swapi.Interface.Character where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Scalar
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase

data Scope__Character

appearsIn :: SelectionSet Scope__Character (Array Episode)
appearsIn = selectionForField "appearsIn" [] graphqlDefaultResponseScalarDecoder

avatarUrl :: SelectionSet Scope__Character String
avatarUrl = selectionForField "avatarUrl" [] graphqlDefaultResponseScalarDecoder

friends :: forall r . SelectionSet Scope__Character r -> SelectionSet Scope__Character (Array r)
friends = selectionForCompositeField "friends" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Character Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Character String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder
