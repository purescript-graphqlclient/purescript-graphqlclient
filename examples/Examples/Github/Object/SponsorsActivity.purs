module Examples.Github.Object.SponsorsActivity where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__SponsorsActivity
  , Scope__SponsorsTier
  , Scope__Sponsor
  , Scope__Sponsorable
  )
import Examples.Github.Enum.SponsorsActivityAction (SponsorsActivityAction)
import Examples.Github.Scalars (Id, DateTime)
import Data.Maybe (Maybe)

action :: SelectionSet Scope__SponsorsActivity SponsorsActivityAction
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__SponsorsActivity Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

previousSponsorsTier
  :: forall r
   . SelectionSet Scope__SponsorsTier r
  -> SelectionSet Scope__SponsorsActivity (Maybe r)
previousSponsorsTier = selectionForCompositeField
                       "previousSponsorsTier"
                       []
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsor
  :: forall r
   . SelectionSet Scope__Sponsor r
  -> SelectionSet Scope__SponsorsActivity (Maybe r)
sponsor = selectionForCompositeField
          "sponsor"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorable
  :: forall r
   . SelectionSet Scope__Sponsorable r
  -> SelectionSet Scope__SponsorsActivity r
sponsorable = selectionForCompositeField
              "sponsorable"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorsTier
  :: forall r
   . SelectionSet Scope__SponsorsTier r
  -> SelectionSet Scope__SponsorsActivity (Maybe r)
sponsorsTier = selectionForCompositeField
               "sponsorsTier"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

timestamp :: SelectionSet Scope__SponsorsActivity (Maybe DateTime)
timestamp = selectionForField "timestamp" [] graphqlDefaultResponseScalarDecoder
