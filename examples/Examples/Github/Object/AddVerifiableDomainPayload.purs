module Examples.Github.Object.AddVerifiableDomainPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__AddVerifiableDomainPayload, Scope__VerifiableDomain)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__AddVerifiableDomainPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

domain
  :: forall r
   . SelectionSet Scope__VerifiableDomain r
  -> SelectionSet Scope__AddVerifiableDomainPayload (Maybe r)
domain = selectionForCompositeField
         "domain"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
