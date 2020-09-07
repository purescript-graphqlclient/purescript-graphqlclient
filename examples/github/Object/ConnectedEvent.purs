module Examples.Github.Object.ConnectedEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__ConnectedEvent, Scope__ReferencedSubject)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor :: forall r . SelectionSet
                    Scope__Actor
                    r -> SelectionSet
                         Scope__ConnectedEvent
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ConnectedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ConnectedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isCrossRepository :: SelectionSet Scope__ConnectedEvent Boolean
isCrossRepository = selectionForField
                    "isCrossRepository"
                    []
                    graphqlDefaultResponseScalarDecoder

source :: forall r . SelectionSet
                     Scope__ReferencedSubject
                     r -> SelectionSet
                          Scope__ConnectedEvent
                          r
source = selectionForCompositeField
         "source"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

subject :: forall r . SelectionSet
                      Scope__ReferencedSubject
                      r -> SelectionSet
                           Scope__ConnectedEvent
                           r
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
