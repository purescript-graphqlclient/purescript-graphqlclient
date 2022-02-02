module Examples.Github.Object.CancelSponsorshipPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CancelSponsorshipPayload, Scope__SponsorsTier)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__CancelSponsorshipPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

sponsorsTier
  :: forall r
   . SelectionSet Scope__SponsorsTier r
  -> SelectionSet Scope__CancelSponsorshipPayload (Maybe r)
sponsorsTier = selectionForCompositeField
               "sponsorsTier"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer
