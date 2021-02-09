module Dillonkearns.Examples.Github.Object.ContributionCalendarDay where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__ContributionCalendarDay)
import Dillonkearns.Examples.Github.Enum.ContributionLevel (ContributionLevel)
import Dillonkearns.Examples.Github.Scalars (Date)

color :: SelectionSet Scope__ContributionCalendarDay String
color = selectionForField "color" [] graphqlDefaultResponseScalarDecoder

contributionCount :: SelectionSet Scope__ContributionCalendarDay Int
contributionCount = selectionForField
                    "contributionCount"
                    []
                    graphqlDefaultResponseScalarDecoder

contributionLevel
  :: SelectionSet
     Scope__ContributionCalendarDay
     ContributionLevel
contributionLevel = selectionForField
                    "contributionLevel"
                    []
                    graphqlDefaultResponseScalarDecoder

date :: SelectionSet Scope__ContributionCalendarDay Date
date = selectionForField "date" [] graphqlDefaultResponseScalarDecoder

weekday :: SelectionSet Scope__ContributionCalendarDay Int
weekday = selectionForField "weekday" [] graphqlDefaultResponseScalarDecoder
