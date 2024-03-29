module Examples.Github.Object.Sponsorship where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__Sponsorship
  , Scope__User
  , Scope__Sponsor
  , Scope__Sponsorable
  , Scope__SponsorsTier
  )
import Examples.Github.Scalars (DateTime, Id)
import Data.Maybe (Maybe)
import Examples.Github.Enum.SponsorshipPrivacy (SponsorshipPrivacy)

createdAt :: SelectionSet Scope__Sponsorship DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Sponsorship Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isOneTimePayment :: SelectionSet Scope__Sponsorship Boolean
isOneTimePayment = selectionForField
                   "isOneTimePayment"
                   []
                   graphqlDefaultResponseScalarDecoder

isSponsorOptedIntoEmail :: SelectionSet Scope__Sponsorship (Maybe Boolean)
isSponsorOptedIntoEmail = selectionForField
                          "isSponsorOptedIntoEmail"
                          []
                          graphqlDefaultResponseScalarDecoder

maintainer
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__Sponsorship r
maintainer = selectionForCompositeField
             "maintainer"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

privacyLevel :: SelectionSet Scope__Sponsorship SponsorshipPrivacy
privacyLevel = selectionForField
               "privacyLevel"
               []
               graphqlDefaultResponseScalarDecoder

sponsor
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__Sponsorship (Maybe r)
sponsor = selectionForCompositeField
          "sponsor"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorEntity
  :: forall r
   . SelectionSet Scope__Sponsor r
  -> SelectionSet Scope__Sponsorship (Maybe r)
sponsorEntity = selectionForCompositeField
                "sponsorEntity"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorable
  :: forall r
   . SelectionSet Scope__Sponsorable r
  -> SelectionSet Scope__Sponsorship r
sponsorable = selectionForCompositeField
              "sponsorable"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

tier
  :: forall r
   . SelectionSet Scope__SponsorsTier r
  -> SelectionSet Scope__Sponsorship (Maybe r)
tier = selectionForCompositeField
       "tier"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

tierSelectedAt :: SelectionSet Scope__Sponsorship (Maybe DateTime)
tierSelectedAt = selectionForField
                 "tierSelectedAt"
                 []
                 graphqlDefaultResponseScalarDecoder
