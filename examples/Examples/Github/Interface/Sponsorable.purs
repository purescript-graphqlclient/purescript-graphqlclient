module Examples.Github.Interface.Sponsorable where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , toGraphQLArguments
  , Optional
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Sponsorable
  , Scope__SponsorConnection
  , Scope__SponsorsActivityConnection
  , Scope__SponsorsListing
  , Scope__Sponsorship
  , Scope__SponsorshipNewsletterConnection
  , Scope__SponsorshipConnection
  , Scope__Organization
  , Scope__User
  )
import Type.Row (type (+))
import Examples.Github.InputObject
  ( SponsorOrder
  , SponsorsActivityOrder
  , SponsorshipNewsletterOrder
  , SponsorshipOrder
  ) as Examples.Github.InputObject
import Examples.Github.Scalars (Id)
import Examples.Github.Enum.SponsorsActivityPeriod (SponsorsActivityPeriod)
import Data.Maybe (Maybe(..))
import Prelude (pure)

estimatedNextSponsorsPayoutInCents :: SelectionSet Scope__Sponsorable Int
estimatedNextSponsorsPayoutInCents = selectionForField
                                     "estimatedNextSponsorsPayoutInCents"
                                     []
                                     graphqlDefaultResponseScalarDecoder

hasSponsorsListing :: SelectionSet Scope__Sponsorable Boolean
hasSponsorsListing = selectionForField
                     "hasSponsorsListing"
                     []
                     graphqlDefaultResponseScalarDecoder

type IsSponsoredByInputRowRequired r = ( accountLogin :: String | r )

type IsSponsoredByInput = { | IsSponsoredByInputRowRequired + () }

isSponsoredBy :: IsSponsoredByInput -> SelectionSet Scope__Sponsorable Boolean
isSponsoredBy input = selectionForField
                      "isSponsoredBy"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseScalarDecoder

isSponsoringViewer :: SelectionSet Scope__Sponsorable Boolean
isSponsoringViewer = selectionForField
                     "isSponsoringViewer"
                     []
                     graphqlDefaultResponseScalarDecoder

monthlyEstimatedSponsorsIncomeInCents :: SelectionSet Scope__Sponsorable Int
monthlyEstimatedSponsorsIncomeInCents = selectionForField
                                        "monthlyEstimatedSponsorsIncomeInCents"
                                        []
                                        graphqlDefaultResponseScalarDecoder

type SponsoringInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.SponsorOrder
    | r
    )

type SponsoringInput = { | SponsoringInputRowOptional + () }

sponsoring
  :: forall r
   . SponsoringInput
  -> SelectionSet Scope__SponsorConnection r
  -> SelectionSet Scope__Sponsorable r
sponsoring input = selectionForCompositeField
                   "sponsoring"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , tierId :: Optional Id
    , orderBy :: Optional Examples.Github.InputObject.SponsorOrder
    | r
    )

type SponsorsInput = { | SponsorsInputRowOptional + () }

sponsors
  :: forall r
   . SponsorsInput
  -> SelectionSet Scope__SponsorConnection r
  -> SelectionSet Scope__Sponsorable r
sponsors input = selectionForCompositeField
                 "sponsors"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorsActivitiesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , period :: Optional SponsorsActivityPeriod
    , orderBy :: Optional Examples.Github.InputObject.SponsorsActivityOrder
    | r
    )

type SponsorsActivitiesInput = { | SponsorsActivitiesInputRowOptional + () }

sponsorsActivities
  :: forall r
   . SponsorsActivitiesInput
  -> SelectionSet Scope__SponsorsActivityConnection r
  -> SelectionSet Scope__Sponsorable r
sponsorsActivities input = selectionForCompositeField
                           "sponsorsActivities"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorsListing
  :: forall r
   . SelectionSet Scope__SponsorsListing r
  -> SelectionSet Scope__Sponsorable (Maybe r)
sponsorsListing = selectionForCompositeField
                  "sponsorsListing"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorshipForViewerAsSponsor
  :: forall r
   . SelectionSet Scope__Sponsorship r
  -> SelectionSet Scope__Sponsorable (Maybe r)
sponsorshipForViewerAsSponsor = selectionForCompositeField
                                "sponsorshipForViewerAsSponsor"
                                []
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorshipForViewerAsSponsorable
  :: forall r
   . SelectionSet Scope__Sponsorship r
  -> SelectionSet Scope__Sponsorable (Maybe r)
sponsorshipForViewerAsSponsorable = selectionForCompositeField
                                    "sponsorshipForViewerAsSponsorable"
                                    []
                                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipNewslettersInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.SponsorshipNewsletterOrder
    | r
    )

type SponsorshipNewslettersInput
  = { | SponsorshipNewslettersInputRowOptional + () }

sponsorshipNewsletters
  :: forall r
   . SponsorshipNewslettersInput
  -> SelectionSet Scope__SponsorshipNewsletterConnection r
  -> SelectionSet Scope__Sponsorable r
sponsorshipNewsletters input = selectionForCompositeField
                               "sponsorshipNewsletters"
                               (toGraphQLArguments
                                input)
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsMaintainerInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , includePrivate :: Optional Boolean
    , orderBy :: Optional Examples.Github.InputObject.SponsorshipOrder
    | r
    )

type SponsorshipsAsMaintainerInput
  = { | SponsorshipsAsMaintainerInputRowOptional + () }

sponsorshipsAsMaintainer
  :: forall r
   . SponsorshipsAsMaintainerInput
  -> SelectionSet Scope__SponsorshipConnection r
  -> SelectionSet Scope__Sponsorable r
sponsorshipsAsMaintainer input = selectionForCompositeField
                                 "sponsorshipsAsMaintainer"
                                 (toGraphQLArguments
                                  input)
                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsSponsorInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.SponsorshipOrder
    | r
    )

type SponsorshipsAsSponsorInput
  = { | SponsorshipsAsSponsorInputRowOptional + () }

sponsorshipsAsSponsor
  :: forall r
   . SponsorshipsAsSponsorInput
  -> SelectionSet Scope__SponsorshipConnection r
  -> SelectionSet Scope__Sponsorable r
sponsorshipsAsSponsor input = selectionForCompositeField
                              "sponsorshipsAsSponsor"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanSponsor :: SelectionSet Scope__Sponsorable Boolean
viewerCanSponsor = selectionForField
                   "viewerCanSponsor"
                   []
                   graphqlDefaultResponseScalarDecoder

viewerIsSponsoring :: SelectionSet Scope__Sponsorable Boolean
viewerIsSponsoring = selectionForField
                     "viewerIsSponsoring"
                     []
                     graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onOrganization :: SelectionSet Scope__Organization decodesTo
    , onUser :: SelectionSet Scope__User decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__Sponsorable decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Organization" selections.onOrganization
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure Nothing, onUser: pure Nothing }
