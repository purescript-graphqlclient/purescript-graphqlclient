module Examples.Github.Object.RejectDeploymentsPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__RejectDeploymentsPayload, Scope__Deployment)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__RejectDeploymentsPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

deployments
  :: forall r
   . SelectionSet Scope__Deployment r
  -> SelectionSet Scope__RejectDeploymentsPayload (Maybe (Array r))
deployments = selectionForCompositeField
              "deployments"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
