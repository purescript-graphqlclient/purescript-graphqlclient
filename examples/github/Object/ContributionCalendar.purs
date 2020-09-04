module Examples.Github.Object.ContributionCalendar where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__ContributionCalendar
  , Scope__ContributionCalendarMonth
  , Scope__ContributionCalendarWeek
  )

colors :: SelectionSet Scope__ContributionCalendar (Array String)
colors = selectionForField "colors" [] graphqlDefaultResponseScalarDecoder

isHalloween :: SelectionSet Scope__ContributionCalendar Boolean
isHalloween = selectionForField "isHalloween" [] graphqlDefaultResponseScalarDecoder

months :: forall r . SelectionSet Scope__ContributionCalendarMonth r -> SelectionSet Scope__ContributionCalendar (Array r)
months = selectionForCompositeField "months" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalContributions :: SelectionSet Scope__ContributionCalendar Int
totalContributions = selectionForField "totalContributions" [] graphqlDefaultResponseScalarDecoder

weeks :: forall r . SelectionSet Scope__ContributionCalendarWeek r -> SelectionSet Scope__ContributionCalendar (Array r)
weeks = selectionForCompositeField "weeks" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
