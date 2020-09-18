module Examples.Github.Object.BaseRefDeletedEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__BaseRefDeletedEvent, Scope__PullRequest)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor :: forall r . SelectionSet
                    Scope__Actor
                    r -> SelectionSet
                         Scope__BaseRefDeletedEvent
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

baseRefName :: SelectionSet Scope__BaseRefDeletedEvent (Maybe String)
baseRefName = selectionForField
              "baseRefName"
              []
              graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__BaseRefDeletedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__BaseRefDeletedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet
                          Scope__PullRequest
                          r -> SelectionSet
                               Scope__BaseRefDeletedEvent
                               (Maybe
                                r)
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
