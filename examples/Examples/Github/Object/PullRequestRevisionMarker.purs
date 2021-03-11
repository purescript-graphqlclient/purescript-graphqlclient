module Examples.Github.Object.PullRequestRevisionMarker where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__PullRequestRevisionMarker, Scope__Commit, Scope__PullRequest)
import Examples.Github.Scalars (DateTime)

createdAt :: SelectionSet Scope__PullRequestRevisionMarker DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

lastSeenCommit
  :: forall r
   . SelectionSet Scope__Commit r
  -> SelectionSet Scope__PullRequestRevisionMarker r
lastSeenCommit = selectionForCompositeField
                 "lastSeenCommit"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__PullRequestRevisionMarker r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
