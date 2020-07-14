module Swapi.Object.Droid where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Scalar
import Swapi.InputObject
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase
import Swapi.Interface
import Swapi.Object

appearsIn :: SelectionSet Scope__Droid (Array Episode)
appearsIn = selectionForField "appearsIn" [] graphqlDefaultResponseScalarDecoder

avatarUrl :: SelectionSet Scope__Droid String
avatarUrl = selectionForField "avatarUrl" [] graphqlDefaultResponseScalarDecoder

friends :: forall r . SelectionSet Scope__Character r -> SelectionSet Scope__Droid (Array r)
friends = selectionForCompositeField "friends" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Droid Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Droid String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

primaryFunction :: SelectionSet Scope__Droid (Maybe String)
primaryFunction = selectionForField "primaryFunction" [] graphqlDefaultResponseScalarDecoder
