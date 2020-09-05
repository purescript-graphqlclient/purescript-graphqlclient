module Examples.Github.Object.TransferredEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__TransferredEvent, Scope__Repository, Scope__Issue)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor :: forall r . SelectionSet
                    Scope__Actor
                    r -> SelectionSet
                         Scope__TransferredEvent
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__TransferredEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

fromRepository :: forall r . SelectionSet
                             Scope__Repository
                             r -> SelectionSet
                                  Scope__TransferredEvent
                                  (Maybe
                                   r)
fromRepository = selectionForCompositeField
                 "fromRepository"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__TransferredEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

issue :: forall r . SelectionSet
                    Scope__Issue
                    r -> SelectionSet
                         Scope__TransferredEvent
                         r
issue = selectionForCompositeField
        "issue"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
