module Examples.Github.Object.MarketplaceCategory where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__MarketplaceCategory)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id, Uri)

description :: SelectionSet Scope__MarketplaceCategory (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

howItWorks :: SelectionSet Scope__MarketplaceCategory (Maybe String)
howItWorks = selectionForField
             "howItWorks"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__MarketplaceCategory Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__MarketplaceCategory String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

primaryListingCount :: SelectionSet Scope__MarketplaceCategory Int
primaryListingCount = selectionForField
                      "primaryListingCount"
                      []
                      graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__MarketplaceCategory Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

secondaryListingCount :: SelectionSet Scope__MarketplaceCategory Int
secondaryListingCount = selectionForField
                        "secondaryListingCount"
                        []
                        graphqlDefaultResponseScalarDecoder

slug :: SelectionSet Scope__MarketplaceCategory String
slug = selectionForField "slug" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__MarketplaceCategory Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
