module Dillonkearns.Examples.Github.Object.ContributionCalendarWeek where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__ContributionCalendarDay, Scope__ContributionCalendarWeek)
import Dillonkearns.Examples.Github.Scalars (Date)

contributionDays
  :: forall r
   . SelectionSet Scope__ContributionCalendarDay r
  -> SelectionSet Scope__ContributionCalendarWeek (Array r)
contributionDays = selectionForCompositeField
                   "contributionDays"
                   []
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

firstDay :: SelectionSet Scope__ContributionCalendarWeek Date
firstDay = selectionForField "firstDay" [] graphqlDefaultResponseScalarDecoder
