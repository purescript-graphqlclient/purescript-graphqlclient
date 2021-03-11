module Examples.Github.Object.DeleteVerifiableDomainPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeleteVerifiableDomainPayload, Scope__VerifiableDomainOwner)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__DeleteVerifiableDomainPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

owner
  :: forall r
   . SelectionSet Scope__VerifiableDomainOwner r
  -> SelectionSet Scope__DeleteVerifiableDomainPayload (Maybe r)
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
