module Examples.Github.Object.SponsorsTier where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__SponsorsTierAdminInfo, Scope__SponsorsTier, Scope__SponsorsListing)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Html, Id)

adminInfo
  :: forall r
   . SelectionSet Scope__SponsorsTierAdminInfo r
  -> SelectionSet Scope__SponsorsTier (Maybe r)
adminInfo = selectionForCompositeField
            "adminInfo"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__SponsorsTier DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__SponsorsTier String
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

descriptionHTML :: SelectionSet Scope__SponsorsTier Html
descriptionHTML = selectionForField
                  "descriptionHTML"
                  []
                  graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__SponsorsTier Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

monthlyPriceInCents :: SelectionSet Scope__SponsorsTier Int
monthlyPriceInCents = selectionForField
                      "monthlyPriceInCents"
                      []
                      graphqlDefaultResponseScalarDecoder

monthlyPriceInDollars :: SelectionSet Scope__SponsorsTier Int
monthlyPriceInDollars = selectionForField
                        "monthlyPriceInDollars"
                        []
                        graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__SponsorsTier String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

sponsorsListing
  :: forall r
   . SelectionSet Scope__SponsorsListing r
  -> SelectionSet Scope__SponsorsTier r
sponsorsListing = selectionForCompositeField
                  "sponsorsListing"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

updatedAt :: SelectionSet Scope__SponsorsTier DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
