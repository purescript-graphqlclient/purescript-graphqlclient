module Dillonkearns.Examples.Github.Object.CreatedPullRequestContribution where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__CreatedPullRequestContribution, Scope__PullRequest, Scope__User)
import Dillonkearns.Examples.Github.Scalars (DateTime, Uri)

isRestricted :: SelectionSet Scope__CreatedPullRequestContribution Boolean
isRestricted = selectionForField
               "isRestricted"
               []
               graphqlDefaultResponseScalarDecoder

occurredAt :: SelectionSet Scope__CreatedPullRequestContribution DateTime
occurredAt = selectionForField
             "occurredAt"
             []
             graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__CreatedPullRequestContribution r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__CreatedPullRequestContribution Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__CreatedPullRequestContribution Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__CreatedPullRequestContribution r
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
