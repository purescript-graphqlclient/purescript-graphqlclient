module Examples.Github.Object.ContributionCalendarMonth where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__ContributionCalendarMonth)
import Examples.Github.Scalars (Date)

firstDay :: SelectionSet Scope__ContributionCalendarMonth Date
firstDay = selectionForField "firstDay" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__ContributionCalendarMonth String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

totalWeeks :: SelectionSet Scope__ContributionCalendarMonth Int
totalWeeks = selectionForField
             "totalWeeks"
             []
             graphqlDefaultResponseScalarDecoder

year :: SelectionSet Scope__ContributionCalendarMonth Int
year = selectionForField "year" [] graphqlDefaultResponseScalarDecoder
