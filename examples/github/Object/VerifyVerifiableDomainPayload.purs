module Examples.Github.Object.VerifyVerifiableDomainPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__VerifyVerifiableDomainPayload, Scope__VerifiableDomain)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__VerifyVerifiableDomainPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

domain
  :: forall r
   . SelectionSet Scope__VerifiableDomain r
  -> SelectionSet Scope__VerifyVerifiableDomainPayload (Maybe r)
domain = selectionForCompositeField
         "domain"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
