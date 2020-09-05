module Examples.Github.Object.ActorLocation where

import GraphqlClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__ActorLocation)
import Data.Maybe (Maybe)

city :: SelectionSet Scope__ActorLocation (Maybe String)
city = selectionForField "city" [] graphqlDefaultResponseScalarDecoder

country :: SelectionSet Scope__ActorLocation (Maybe String)
country = selectionForField "country" [] graphqlDefaultResponseScalarDecoder

countryCode :: SelectionSet Scope__ActorLocation (Maybe String)
countryCode = selectionForField
              "countryCode"
              []
              graphqlDefaultResponseScalarDecoder

region :: SelectionSet Scope__ActorLocation (Maybe String)
region = selectionForField "region" [] graphqlDefaultResponseScalarDecoder

regionCode :: SelectionSet Scope__ActorLocation (Maybe String)
regionCode = selectionForField
             "regionCode"
             []
             graphqlDefaultResponseScalarDecoder
