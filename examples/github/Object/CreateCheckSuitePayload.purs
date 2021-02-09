module Examples.Github.Object.CreateCheckSuitePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__CheckSuite, Scope__CreateCheckSuitePayload)
import Data.Maybe (Maybe)

checkSuite
  :: forall r
   . SelectionSet Scope__CheckSuite r
  -> SelectionSet Scope__CreateCheckSuitePayload (Maybe r)
checkSuite = selectionForCompositeField
             "checkSuite"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet Scope__CreateCheckSuitePayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
