module Examples.Github.Enum.SponsorsGoalKind where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SponsorsGoalKind
data SponsorsGoalKind = TotalSponsorsCount | MonthlySponsorshipAmount

derive instance genericSponsorsGoalKind :: Generic SponsorsGoalKind _

instance showSponsorsGoalKind :: Show SponsorsGoalKind where
  show = genericShow

derive instance eqSponsorsGoalKind :: Eq SponsorsGoalKind

derive instance ordSponsorsGoalKind :: Ord SponsorsGoalKind

fromToMap :: Array (Tuple String SponsorsGoalKind)
fromToMap = [ Tuple "TOTAL_SPONSORS_COUNT" TotalSponsorsCount
            , Tuple "MONTHLY_SPONSORSHIP_AMOUNT" MonthlySponsorshipAmount
            ]

instance sponsorsGoalKindGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SponsorsGoalKind where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SponsorsGoalKind" fromToMap

instance sponsorsGoalKindToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SponsorsGoalKind where
  toGraphQLArgumentValue =
    case _ of
      TotalSponsorsCount -> ArgumentValueEnum "TOTAL_SPONSORS_COUNT"
      MonthlySponsorshipAmount -> ArgumentValueEnum "MONTHLY_SPONSORSHIP_AMOUNT"
