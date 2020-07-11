module Swapi.Query where

import Prelude
import GraphqlClient
import Data.Maybe
import Swapi.Scalar
import Swapi.Enum.Episode
import Swapi.Enum.Language
import Swapi.Enum.Phrase
import Swapi.Interface.Character
import Swapi.Object.ChatMessage
import Swapi.Object.Droid
import Swapi.Object.Human
import Swapi.Union.CharacterUnion

droid :: forall r . SelectionSet Scope__Droid r -> SelectionSet Scope__RootQuery (Maybe r)
droid = selectionForCompositeField "droid" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

forcedError :: SelectionSet Scope__RootQuery (Maybe String)
forcedError = selectionForField "forcedError" [] graphqlDefaultResponseScalarDecoder

greet :: SelectionSet Scope__RootQuery String
greet = selectionForField "greet" [] graphqlDefaultResponseScalarDecoder

hello :: SelectionSet Scope__RootQuery String
hello = selectionForField "hello" [] graphqlDefaultResponseScalarDecoder

hero :: forall r . SelectionSet Scope__Character r -> SelectionSet Scope__RootQuery r
hero = selectionForCompositeField "hero" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

heroUnion :: forall r . SelectionSet Scope__CharacterUnion r -> SelectionSet Scope__RootQuery r
heroUnion = selectionForCompositeField "heroUnion" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

human :: forall r . SelectionSet Scope__Human r -> SelectionSet Scope__RootQuery (Maybe r)
human = selectionForCompositeField "human" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

now :: SelectionSet Scope__RootQuery PosixTime
now = selectionForField "now" [] graphqlDefaultResponseScalarDecoder

today :: SelectionSet Scope__RootQuery String
today = selectionForField "today" [] graphqlDefaultResponseScalarDecoder
