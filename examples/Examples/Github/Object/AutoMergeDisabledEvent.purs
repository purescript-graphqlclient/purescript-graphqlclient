module Examples.Github.Object.AutoMergeDisabledEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__AutoMergeDisabledEvent, Scope__User, Scope__PullRequest)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__AutoMergeDisabledEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__AutoMergeDisabledEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

disabler
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__AutoMergeDisabledEvent (Maybe r)
disabler = selectionForCompositeField
           "disabler"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__AutoMergeDisabledEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__AutoMergeDisabledEvent (Maybe r)
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

reason :: SelectionSet Scope__AutoMergeDisabledEvent (Maybe String)
reason = selectionForField "reason" [] graphqlDefaultResponseScalarDecoder

reasonCode :: SelectionSet Scope__AutoMergeDisabledEvent (Maybe String)
reasonCode = selectionForField
             "reasonCode"
             []
             graphqlDefaultResponseScalarDecoder
