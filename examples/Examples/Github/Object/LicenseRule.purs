module Examples.Github.Object.LicenseRule where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__LicenseRule)

description :: SelectionSet Scope__LicenseRule String
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

key :: SelectionSet Scope__LicenseRule String
key = selectionForField "key" [] graphqlDefaultResponseScalarDecoder

label :: SelectionSet Scope__LicenseRule String
label = selectionForField "label" [] graphqlDefaultResponseScalarDecoder
