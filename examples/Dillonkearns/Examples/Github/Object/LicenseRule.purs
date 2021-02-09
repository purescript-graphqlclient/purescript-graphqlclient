module Dillonkearns.Examples.Github.Object.LicenseRule where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__LicenseRule)

description :: SelectionSet Scope__LicenseRule String
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

key :: SelectionSet Scope__LicenseRule String
key = selectionForField "key" [] graphqlDefaultResponseScalarDecoder

label :: SelectionSet Scope__LicenseRule String
label = selectionForField "label" [] graphqlDefaultResponseScalarDecoder
