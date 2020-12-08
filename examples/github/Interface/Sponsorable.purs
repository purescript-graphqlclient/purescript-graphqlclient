module Examples.Github.Interface.Sponsorable where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphQLArguments
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Sponsorable
  , Scope__SponsorsListing
  , Scope__SponsorshipConnection
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe(..))
import Examples.Github.InputObject (SponsorshipOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Prelude (pure)

hasSponsorsListing :: SelectionSet Scope__Sponsorable Boolean
hasSponsorsListing = selectionForField
                     "hasSponsorsListing"
                     []
                     graphqlDefaultResponseScalarDecoder

isSponsoringViewer :: SelectionSet Scope__Sponsorable Boolean
isSponsoringViewer = selectionForField
                     "isSponsoringViewer"
                     []
                     graphqlDefaultResponseScalarDecoder

sponsorsListing :: forall r . SelectionSet
                              Scope__SponsorsListing
                              r -> SelectionSet
                                   Scope__Sponsorable
                                   (Maybe
                                    r)
sponsorsListing = selectionForCompositeField
                  "sponsorsListing"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsMaintainerInputRowOptional r = ( after :: Optional String
                                                  , before :: Optional String
                                                  , first :: Optional Int
                                                  , last :: Optional Int
                                                  , includePrivate :: Optional
                                                                      Boolean
                                                  , orderBy :: Optional
                                                               Examples.Github.InputObject.SponsorshipOrder
                                                  | r
                                                  )

type SponsorshipsAsMaintainerInput = {
| SponsorshipsAsMaintainerInputRowOptional + ()
}

sponsorshipsAsMaintainer :: forall r . SponsorshipsAsMaintainerInput -> SelectionSet
                                                                        Scope__SponsorshipConnection
                                                                        r -> SelectionSet
                                                                             Scope__Sponsorable
                                                                             r
sponsorshipsAsMaintainer input = selectionForCompositeField
                                 "sponsorshipsAsMaintainer"
                                 (toGraphQLArguments
                                  input)
                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsSponsorInputRowOptional r = ( after :: Optional String
                                               , before :: Optional String
                                               , first :: Optional Int
                                               , last :: Optional Int
                                               , orderBy :: Optional
                                                            Examples.Github.InputObject.SponsorshipOrder
                                               | r
                                               )

type SponsorshipsAsSponsorInput = {
| SponsorshipsAsSponsorInputRowOptional + ()
}

sponsorshipsAsSponsor :: forall r . SponsorshipsAsSponsorInput -> SelectionSet
                                                                  Scope__SponsorshipConnection
                                                                  r -> SelectionSet
                                                                       Scope__Sponsorable
                                                                       r
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

type Fragments decodesTo = { onOrganization :: SelectionSet
                                               Scope__Organization
                                               decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__Sponsorable
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Organization" selections.onOrganization
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure Nothing, onUser: pure Nothing }
