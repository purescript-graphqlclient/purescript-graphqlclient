module Examples.Github.Object.FundingLink where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__FundingLink)
import Examples.Github.Enum.FundingPlatform (FundingPlatform)
import Examples.Github.Scalars (Uri)

platform :: SelectionSet Scope__FundingLink FundingPlatform
platform = selectionForField "platform" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__FundingLink Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
