module Examples.Github.Object.UpdateSponsorshipPreferencesPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__UpdateSponsorshipPreferencesPayload, Scope__Sponsorship)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__UpdateSponsorshipPreferencesPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

sponsorship
  :: forall r
   . SelectionSet Scope__Sponsorship r
  -> SelectionSet Scope__UpdateSponsorshipPreferencesPayload (Maybe r)
sponsorship = selectionForCompositeField
              "sponsorship"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
