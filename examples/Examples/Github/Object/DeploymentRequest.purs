module Examples.Github.Object.DeploymentRequest where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphQLArguments
  )
import Examples.Github.Scopes
  ( Scope__DeploymentRequest
  , Scope__Environment
  , Scope__DeploymentReviewerConnection
  )
import Type.Row (type (+))
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime)

currentUserCanApprove :: SelectionSet Scope__DeploymentRequest Boolean
currentUserCanApprove = selectionForField
                        "currentUserCanApprove"
                        []
                        graphqlDefaultResponseScalarDecoder

environment
  :: forall r
   . SelectionSet Scope__Environment r
  -> SelectionSet Scope__DeploymentRequest r
environment = selectionForCompositeField
              "environment"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReviewersInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type ReviewersInput = { | ReviewersInputRowOptional + () }

reviewers
  :: forall r
   . ReviewersInput
  -> SelectionSet Scope__DeploymentReviewerConnection r
  -> SelectionSet Scope__DeploymentRequest r
reviewers input = selectionForCompositeField
                  "reviewers"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

waitTimer :: SelectionSet Scope__DeploymentRequest Int
waitTimer = selectionForField "waitTimer" [] graphqlDefaultResponseScalarDecoder

waitTimerStartedAt :: SelectionSet Scope__DeploymentRequest (Maybe DateTime)
waitTimerStartedAt = selectionForField
                     "waitTimerStartedAt"
                     []
                     graphqlDefaultResponseScalarDecoder
