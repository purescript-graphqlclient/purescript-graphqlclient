module Dillonkearns.Examples.Github.Object.AutoMergeRequest where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__AutoMergeRequest, Scope__Actor, Scope__PullRequest)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime)
import Dillonkearns.Examples.Github.Enum.PullRequestMergeMethod
  (PullRequestMergeMethod)

authorEmail :: SelectionSet Scope__AutoMergeRequest (Maybe String)
authorEmail = selectionForField
              "authorEmail"
              []
              graphqlDefaultResponseScalarDecoder

commitBody :: SelectionSet Scope__AutoMergeRequest (Maybe String)
commitBody = selectionForField
             "commitBody"
             []
             graphqlDefaultResponseScalarDecoder

commitHeadline :: SelectionSet Scope__AutoMergeRequest (Maybe String)
commitHeadline = selectionForField
                 "commitHeadline"
                 []
                 graphqlDefaultResponseScalarDecoder

enabledAt :: SelectionSet Scope__AutoMergeRequest (Maybe DateTime)
enabledAt = selectionForField "enabledAt" [] graphqlDefaultResponseScalarDecoder

enabledBy
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__AutoMergeRequest (Maybe r)
enabledBy = selectionForCompositeField
            "enabledBy"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mergeMethod :: SelectionSet Scope__AutoMergeRequest PullRequestMergeMethod
mergeMethod = selectionForField
              "mergeMethod"
              []
              graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__AutoMergeRequest r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
