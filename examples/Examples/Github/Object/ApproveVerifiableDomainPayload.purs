module Examples.Github.Object.ApproveVerifiableDomainPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__ApproveVerifiableDomainPayload, Scope__VerifiableDomain)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__ApproveVerifiableDomainPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

domain
  :: forall r
   . SelectionSet Scope__VerifiableDomain r
  -> SelectionSet Scope__ApproveVerifiableDomainPayload (Maybe r)
domain = selectionForCompositeField
         "domain"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
