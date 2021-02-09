module Dillonkearns.Examples.Github.Object.FundingLink where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__FundingLink)
import Dillonkearns.Examples.Github.Enum.FundingPlatform (FundingPlatform)
import Dillonkearns.Examples.Github.Scalars (Uri)

platform :: SelectionSet Scope__FundingLink FundingPlatform
platform = selectionForField "platform" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__FundingLink Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
