module Dillonkearns.Examples.Swapi.Subscription where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , Scope__RootSubscription
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Swapi.Scopes (Scope__ChatMessage)

newMessage
  :: forall r
   . SelectionSet Scope__ChatMessage r
  -> SelectionSet Scope__RootSubscription r
newMessage = selectionForCompositeField
             "newMessage"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
