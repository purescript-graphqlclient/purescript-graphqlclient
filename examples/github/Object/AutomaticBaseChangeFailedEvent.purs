module Examples.Github.Object.AutomaticBaseChangeFailedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__AutomaticBaseChangeFailedEvent, Scope__PullRequest)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor :: forall r . SelectionSet
                    Scope__Actor
                    r -> SelectionSet
                         Scope__AutomaticBaseChangeFailedEvent
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__AutomaticBaseChangeFailedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__AutomaticBaseChangeFailedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

newBase :: SelectionSet Scope__AutomaticBaseChangeFailedEvent String
newBase = selectionForField "newBase" [] graphqlDefaultResponseScalarDecoder

oldBase :: SelectionSet Scope__AutomaticBaseChangeFailedEvent String
oldBase = selectionForField "oldBase" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet
                          Scope__PullRequest
                          r -> SelectionSet
                               Scope__AutomaticBaseChangeFailedEvent
                               r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
