module Dillonkearns.Examples.Github.Object.ReviewRequest where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__ReviewRequest, Scope__PullRequest, Scope__RequestedReviewer)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Id)

asCodeOwner :: SelectionSet Scope__ReviewRequest Boolean
asCodeOwner = selectionForField
              "asCodeOwner"
              []
              graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__ReviewRequest (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ReviewRequest Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__ReviewRequest r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

requestedReviewer
  :: forall r
   . SelectionSet Scope__RequestedReviewer r
  -> SelectionSet Scope__ReviewRequest (Maybe r)
requestedReviewer = selectionForCompositeField
                    "requestedReviewer"
                    []
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer
