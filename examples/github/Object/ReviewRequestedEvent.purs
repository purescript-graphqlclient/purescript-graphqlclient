module Examples.Github.Object.ReviewRequestedEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__ReviewRequestedEvent
  , Scope__PullRequest
  , Scope__RequestedReviewer
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor :: forall r . SelectionSet
                    Scope__Actor
                    r -> SelectionSet
                         Scope__ReviewRequestedEvent
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ReviewRequestedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ReviewRequestedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet
                          Scope__PullRequest
                          r -> SelectionSet
                               Scope__ReviewRequestedEvent
                               r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

requestedReviewer :: forall r . SelectionSet
                                Scope__RequestedReviewer
                                r -> SelectionSet
                                     Scope__ReviewRequestedEvent
                                     (Maybe
                                      r)
requestedReviewer = selectionForCompositeField
                    "requestedReviewer"
                    []
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer
