module Examples.Github.Object.MarketplaceListing where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , toGraphqlArguments
  )
import Examples.Github.Scopes
  (Scope__App, Scope__MarketplaceListing, Scope__MarketplaceCategory)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, Html, Id)
import Type.Row (type (+))

app :: forall r . SelectionSet
                  Scope__App
                  r -> SelectionSet
                       Scope__MarketplaceListing
                       (Maybe
                        r)
app = selectionForCompositeField
      "app"
      []
      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

companyUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
companyUrl = selectionForField
             "companyUrl"
             []
             graphqlDefaultResponseScalarDecoder

configurationResourcePath :: SelectionSet Scope__MarketplaceListing Uri
configurationResourcePath = selectionForField
                            "configurationResourcePath"
                            []
                            graphqlDefaultResponseScalarDecoder

configurationUrl :: SelectionSet Scope__MarketplaceListing Uri
configurationUrl = selectionForField
                   "configurationUrl"
                   []
                   graphqlDefaultResponseScalarDecoder

documentationUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
documentationUrl = selectionForField
                   "documentationUrl"
                   []
                   graphqlDefaultResponseScalarDecoder

extendedDescription :: SelectionSet Scope__MarketplaceListing (Maybe String)
extendedDescription = selectionForField
                      "extendedDescription"
                      []
                      graphqlDefaultResponseScalarDecoder

extendedDescriptionHTML :: SelectionSet Scope__MarketplaceListing Html
extendedDescriptionHTML = selectionForField
                          "extendedDescriptionHTML"
                          []
                          graphqlDefaultResponseScalarDecoder

fullDescription :: SelectionSet Scope__MarketplaceListing String
fullDescription = selectionForField
                  "fullDescription"
                  []
                  graphqlDefaultResponseScalarDecoder

fullDescriptionHTML :: SelectionSet Scope__MarketplaceListing Html
fullDescriptionHTML = selectionForField
                      "fullDescriptionHTML"
                      []
                      graphqlDefaultResponseScalarDecoder

hasPublishedFreeTrialPlans :: SelectionSet Scope__MarketplaceListing Boolean
hasPublishedFreeTrialPlans = selectionForField
                             "hasPublishedFreeTrialPlans"
                             []
                             graphqlDefaultResponseScalarDecoder

hasTermsOfService :: SelectionSet Scope__MarketplaceListing Boolean
hasTermsOfService = selectionForField
                    "hasTermsOfService"
                    []
                    graphqlDefaultResponseScalarDecoder

howItWorks :: SelectionSet Scope__MarketplaceListing (Maybe String)
howItWorks = selectionForField
             "howItWorks"
             []
             graphqlDefaultResponseScalarDecoder

howItWorksHTML :: SelectionSet Scope__MarketplaceListing Html
howItWorksHTML = selectionForField
                 "howItWorksHTML"
                 []
                 graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__MarketplaceListing Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

installationUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
installationUrl = selectionForField
                  "installationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

installedForViewer :: SelectionSet Scope__MarketplaceListing Boolean
installedForViewer = selectionForField
                     "installedForViewer"
                     []
                     graphqlDefaultResponseScalarDecoder

isArchived :: SelectionSet Scope__MarketplaceListing Boolean
isArchived = selectionForField
             "isArchived"
             []
             graphqlDefaultResponseScalarDecoder

isDraft :: SelectionSet Scope__MarketplaceListing Boolean
isDraft = selectionForField "isDraft" [] graphqlDefaultResponseScalarDecoder

isPaid :: SelectionSet Scope__MarketplaceListing Boolean
isPaid = selectionForField "isPaid" [] graphqlDefaultResponseScalarDecoder

isPublic :: SelectionSet Scope__MarketplaceListing Boolean
isPublic = selectionForField "isPublic" [] graphqlDefaultResponseScalarDecoder

isRejected :: SelectionSet Scope__MarketplaceListing Boolean
isRejected = selectionForField
             "isRejected"
             []
             graphqlDefaultResponseScalarDecoder

isUnverified :: SelectionSet Scope__MarketplaceListing Boolean
isUnverified = selectionForField
               "isUnverified"
               []
               graphqlDefaultResponseScalarDecoder

isUnverifiedPending :: SelectionSet Scope__MarketplaceListing Boolean
isUnverifiedPending = selectionForField
                      "isUnverifiedPending"
                      []
                      graphqlDefaultResponseScalarDecoder

isVerificationPendingFromDraft :: SelectionSet Scope__MarketplaceListing Boolean
isVerificationPendingFromDraft = selectionForField
                                 "isVerificationPendingFromDraft"
                                 []
                                 graphqlDefaultResponseScalarDecoder

isVerificationPendingFromUnverified :: SelectionSet
                                       Scope__MarketplaceListing
                                       Boolean
isVerificationPendingFromUnverified = selectionForField
                                      "isVerificationPendingFromUnverified"
                                      []
                                      graphqlDefaultResponseScalarDecoder

isVerified :: SelectionSet Scope__MarketplaceListing Boolean
isVerified = selectionForField
             "isVerified"
             []
             graphqlDefaultResponseScalarDecoder

logoBackgroundColor :: SelectionSet Scope__MarketplaceListing String
logoBackgroundColor = selectionForField
                      "logoBackgroundColor"
                      []
                      graphqlDefaultResponseScalarDecoder

type LogoUrlInputRowOptional r = ( size :: Optional Int | r )

type LogoUrlInput = { | LogoUrlInputRowOptional + () }

logoUrl :: LogoUrlInput -> SelectionSet Scope__MarketplaceListing (Maybe Uri)
logoUrl input = selectionForField
                "logoUrl"
                (toGraphqlArguments
                 input)
                graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__MarketplaceListing String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

normalizedShortDescription :: SelectionSet Scope__MarketplaceListing String
normalizedShortDescription = selectionForField
                             "normalizedShortDescription"
                             []
                             graphqlDefaultResponseScalarDecoder

pricingUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
pricingUrl = selectionForField
             "pricingUrl"
             []
             graphqlDefaultResponseScalarDecoder

primaryCategory :: forall r . SelectionSet
                              Scope__MarketplaceCategory
                              r -> SelectionSet
                                   Scope__MarketplaceListing
                                   r
primaryCategory = selectionForCompositeField
                  "primaryCategory"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

privacyPolicyUrl :: SelectionSet Scope__MarketplaceListing Uri
privacyPolicyUrl = selectionForField
                   "privacyPolicyUrl"
                   []
                   graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__MarketplaceListing Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

screenshotUrls :: SelectionSet Scope__MarketplaceListing (Array (Maybe String))
screenshotUrls = selectionForField
                 "screenshotUrls"
                 []
                 graphqlDefaultResponseScalarDecoder

secondaryCategory :: forall r . SelectionSet
                                Scope__MarketplaceCategory
                                r -> SelectionSet
                                     Scope__MarketplaceListing
                                     (Maybe
                                      r)
secondaryCategory = selectionForCompositeField
                    "secondaryCategory"
                    []
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

shortDescription :: SelectionSet Scope__MarketplaceListing String
shortDescription = selectionForField
                   "shortDescription"
                   []
                   graphqlDefaultResponseScalarDecoder

slug :: SelectionSet Scope__MarketplaceListing String
slug = selectionForField "slug" [] graphqlDefaultResponseScalarDecoder

statusUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
statusUrl = selectionForField "statusUrl" [] graphqlDefaultResponseScalarDecoder

supportEmail :: SelectionSet Scope__MarketplaceListing (Maybe String)
supportEmail = selectionForField
               "supportEmail"
               []
               graphqlDefaultResponseScalarDecoder

supportUrl :: SelectionSet Scope__MarketplaceListing Uri
supportUrl = selectionForField
             "supportUrl"
             []
             graphqlDefaultResponseScalarDecoder

termsOfServiceUrl :: SelectionSet Scope__MarketplaceListing (Maybe Uri)
termsOfServiceUrl = selectionForField
                    "termsOfServiceUrl"
                    []
                    graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__MarketplaceListing Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanAddPlans :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanAddPlans = selectionForField
                    "viewerCanAddPlans"
                    []
                    graphqlDefaultResponseScalarDecoder

viewerCanApprove :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanApprove = selectionForField
                   "viewerCanApprove"
                   []
                   graphqlDefaultResponseScalarDecoder

viewerCanDelist :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanDelist = selectionForField
                  "viewerCanDelist"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanEdit :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanEdit = selectionForField
                "viewerCanEdit"
                []
                graphqlDefaultResponseScalarDecoder

viewerCanEditCategories :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanEditCategories = selectionForField
                          "viewerCanEditCategories"
                          []
                          graphqlDefaultResponseScalarDecoder

viewerCanEditPlans :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanEditPlans = selectionForField
                     "viewerCanEditPlans"
                     []
                     graphqlDefaultResponseScalarDecoder

viewerCanRedraft :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanRedraft = selectionForField
                   "viewerCanRedraft"
                   []
                   graphqlDefaultResponseScalarDecoder

viewerCanReject :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanReject = selectionForField
                  "viewerCanReject"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanRequestApproval :: SelectionSet Scope__MarketplaceListing Boolean
viewerCanRequestApproval = selectionForField
                           "viewerCanRequestApproval"
                           []
                           graphqlDefaultResponseScalarDecoder

viewerHasPurchased :: SelectionSet Scope__MarketplaceListing Boolean
viewerHasPurchased = selectionForField
                     "viewerHasPurchased"
                     []
                     graphqlDefaultResponseScalarDecoder

viewerHasPurchasedForAllOrganizations :: SelectionSet
                                         Scope__MarketplaceListing
                                         Boolean
viewerHasPurchasedForAllOrganizations = selectionForField
                                        "viewerHasPurchasedForAllOrganizations"
                                        []
                                        graphqlDefaultResponseScalarDecoder

viewerIsListingAdmin :: SelectionSet Scope__MarketplaceListing Boolean
viewerIsListingAdmin = selectionForField
                       "viewerIsListingAdmin"
                       []
                       graphqlDefaultResponseScalarDecoder
