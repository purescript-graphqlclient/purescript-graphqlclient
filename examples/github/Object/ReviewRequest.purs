module Examples.Github.Object.ReviewRequest where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__ReviewRequest, Scope__PullRequest, Scope__RequestedReviewer)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id)

databaseId :: SelectionSet Scope__ReviewRequest (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ReviewRequest Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet
                          Scope__PullRequest
                          r -> SelectionSet
                               Scope__ReviewRequest
                               r
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

requestedReviewer :: forall r . SelectionSet
                                Scope__RequestedReviewer
                                r -> SelectionSet
                                     Scope__ReviewRequest
                                     (Maybe
                                      r)
requestedReviewer = selectionForCompositeField
                    "requestedReviewer"
                    []
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer
