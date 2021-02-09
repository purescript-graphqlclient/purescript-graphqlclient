module Examples.Github.Object.RerequestCheckSuitePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__CheckSuite, Scope__RerequestCheckSuitePayload)
import Data.Maybe (Maybe)

checkSuite
  :: forall r
   . SelectionSet Scope__CheckSuite r
  -> SelectionSet Scope__RerequestCheckSuitePayload (Maybe r)
checkSuite = selectionForCompositeField
             "checkSuite"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId
  :: SelectionSet
     Scope__RerequestCheckSuitePayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
