module Examples.Github.Object.CreateSponsorshipPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CreateSponsorshipPayload, Scope__Sponsorship)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__CreateSponsorshipPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

sponsorship
  :: forall r
   . SelectionSet Scope__Sponsorship r
  -> SelectionSet Scope__CreateSponsorshipPayload (Maybe r)
sponsorship = selectionForCompositeField
              "sponsorship"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
