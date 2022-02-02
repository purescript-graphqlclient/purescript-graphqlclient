module Examples.Github.Object.ApproveDeploymentsPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__ApproveDeploymentsPayload, Scope__Deployment)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__ApproveDeploymentsPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

deployments
  :: forall r
   . SelectionSet Scope__Deployment r
  -> SelectionSet Scope__ApproveDeploymentsPayload (Maybe (Array r))
deployments = selectionForCompositeField
              "deployments"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
