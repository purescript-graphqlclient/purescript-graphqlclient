module Examples.Github.Object.WorkflowRun where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , toGraphQLArguments
  )
import Examples.Github.Scopes
  ( Scope__CheckSuite
  , Scope__WorkflowRun
  , Scope__DeploymentReviewConnection
  , Scope__DeploymentRequestConnection
  , Scope__Workflow
  )
import Examples.Github.Scalars (DateTime, Id, Uri)
import Data.Maybe (Maybe)
import Type.Row (type (+))

checkSuite
  :: forall r
   . SelectionSet Scope__CheckSuite r
  -> SelectionSet Scope__WorkflowRun r
checkSuite = selectionForCompositeField
             "checkSuite"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__WorkflowRun DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__WorkflowRun (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

type DeploymentReviewsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type DeploymentReviewsInput = { | DeploymentReviewsInputRowOptional + () }

deploymentReviews
  :: forall r
   . DeploymentReviewsInput
  -> SelectionSet Scope__DeploymentReviewConnection r
  -> SelectionSet Scope__WorkflowRun r
deploymentReviews input = selectionForCompositeField
                          "deploymentReviews"
                          (toGraphQLArguments
                           input)
                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__WorkflowRun Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type PendingDeploymentRequestsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type PendingDeploymentRequestsInput
  = { | PendingDeploymentRequestsInputRowOptional + () }

pendingDeploymentRequests
  :: forall r
   . PendingDeploymentRequestsInput
  -> SelectionSet Scope__DeploymentRequestConnection r
  -> SelectionSet Scope__WorkflowRun r
pendingDeploymentRequests input = selectionForCompositeField
                                  "pendingDeploymentRequests"
                                  (toGraphQLArguments
                                   input)
                                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__WorkflowRun Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

runNumber :: SelectionSet Scope__WorkflowRun Int
runNumber = selectionForField "runNumber" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__WorkflowRun DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__WorkflowRun Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

workflow
  :: forall r
   . SelectionSet Scope__Workflow r
  -> SelectionSet Scope__WorkflowRun r
workflow = selectionForCompositeField
           "workflow"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer
