module Examples.Swapi.Subscription where

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

newMessage :: forall r . SelectionSet Scope__ChatMessage r -> SelectionSet Scope__RootSubscription r
newMessage = selectionForCompositeField "newMessage" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
