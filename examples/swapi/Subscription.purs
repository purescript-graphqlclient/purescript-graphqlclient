module Examples.Swapi.Subscription where

import GraphQLClient
  ( SelectionSet
  , Scope__RootSubscription
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Swapi.Scopes (Scope__ChatMessage)

newMessage :: forall r . SelectionSet
                         Scope__ChatMessage
                         r -> SelectionSet
                              Scope__RootSubscription
                              r
newMessage = selectionForCompositeField
             "newMessage"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
