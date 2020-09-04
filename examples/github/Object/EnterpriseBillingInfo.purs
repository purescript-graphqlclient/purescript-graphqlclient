module Examples.Github.Object.EnterpriseBillingInfo where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__EnterpriseBillingInfo
  )

allLicensableUsersCount :: SelectionSet Scope__EnterpriseBillingInfo Int
allLicensableUsersCount = selectionForField "allLicensableUsersCount" [] graphqlDefaultResponseScalarDecoder

assetPacks :: SelectionSet Scope__EnterpriseBillingInfo Int
assetPacks = selectionForField "assetPacks" [] graphqlDefaultResponseScalarDecoder

availableSeats :: SelectionSet Scope__EnterpriseBillingInfo Int
availableSeats = selectionForField "availableSeats" [] graphqlDefaultResponseScalarDecoder

bandwidthQuota :: SelectionSet Scope__EnterpriseBillingInfo Number
bandwidthQuota = selectionForField "bandwidthQuota" [] graphqlDefaultResponseScalarDecoder

bandwidthUsage :: SelectionSet Scope__EnterpriseBillingInfo Number
bandwidthUsage = selectionForField "bandwidthUsage" [] graphqlDefaultResponseScalarDecoder

bandwidthUsagePercentage :: SelectionSet Scope__EnterpriseBillingInfo Int
bandwidthUsagePercentage = selectionForField "bandwidthUsagePercentage" [] graphqlDefaultResponseScalarDecoder

seats :: SelectionSet Scope__EnterpriseBillingInfo Int
seats = selectionForField "seats" [] graphqlDefaultResponseScalarDecoder

storageQuota :: SelectionSet Scope__EnterpriseBillingInfo Number
storageQuota = selectionForField "storageQuota" [] graphqlDefaultResponseScalarDecoder

storageUsage :: SelectionSet Scope__EnterpriseBillingInfo Number
storageUsage = selectionForField "storageUsage" [] graphqlDefaultResponseScalarDecoder

storageUsagePercentage :: SelectionSet Scope__EnterpriseBillingInfo Int
storageUsagePercentage = selectionForField "storageUsagePercentage" [] graphqlDefaultResponseScalarDecoder

totalAvailableLicenses :: SelectionSet Scope__EnterpriseBillingInfo Int
totalAvailableLicenses = selectionForField "totalAvailableLicenses" [] graphqlDefaultResponseScalarDecoder

totalLicenses :: SelectionSet Scope__EnterpriseBillingInfo Int
totalLicenses = selectionForField "totalLicenses" [] graphqlDefaultResponseScalarDecoder
