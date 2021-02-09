module Dillonkearns.Examples.Github.Object.GitHubMetadata where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__GitHubMetadata)
import Dillonkearns.Examples.Github.Scalars (GitObjectId)
import Data.Maybe (Maybe)

gitHubServicesSha :: SelectionSet Scope__GitHubMetadata GitObjectId
gitHubServicesSha = selectionForField
                    "gitHubServicesSha"
                    []
                    graphqlDefaultResponseScalarDecoder

gitIpAddresses :: SelectionSet Scope__GitHubMetadata (Maybe (Array String))
gitIpAddresses = selectionForField
                 "gitIpAddresses"
                 []
                 graphqlDefaultResponseScalarDecoder

hookIpAddresses :: SelectionSet Scope__GitHubMetadata (Maybe (Array String))
hookIpAddresses = selectionForField
                  "hookIpAddresses"
                  []
                  graphqlDefaultResponseScalarDecoder

importerIpAddresses :: SelectionSet Scope__GitHubMetadata (Maybe (Array String))
importerIpAddresses = selectionForField
                      "importerIpAddresses"
                      []
                      graphqlDefaultResponseScalarDecoder

isPasswordAuthenticationVerifiable :: SelectionSet Scope__GitHubMetadata Boolean
isPasswordAuthenticationVerifiable = selectionForField
                                     "isPasswordAuthenticationVerifiable"
                                     []
                                     graphqlDefaultResponseScalarDecoder

pagesIpAddresses :: SelectionSet Scope__GitHubMetadata (Maybe (Array String))
pagesIpAddresses = selectionForField
                   "pagesIpAddresses"
                   []
                   graphqlDefaultResponseScalarDecoder
