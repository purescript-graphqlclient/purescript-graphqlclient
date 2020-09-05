module Examples.Github.Object.DisconnectedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__DisconnectedEvent, Scope__ReferencedSubject)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor :: forall r . SelectionSet
                    Scope__Actor
                    r -> SelectionSet
                         Scope__DisconnectedEvent
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__DisconnectedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__DisconnectedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isCrossRepository :: SelectionSet Scope__DisconnectedEvent Boolean
isCrossRepository = selectionForField
                    "isCrossRepository"
                    []
                    graphqlDefaultResponseScalarDecoder

source :: forall r . SelectionSet
                     Scope__ReferencedSubject
                     r -> SelectionSet
                          Scope__DisconnectedEvent
                          r
source = selectionForCompositeField
         "source"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

subject :: forall r . SelectionSet
                      Scope__ReferencedSubject
                      r -> SelectionSet
                           Scope__DisconnectedEvent
                           r
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
