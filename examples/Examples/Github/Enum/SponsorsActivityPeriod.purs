module Examples.Github.Enum.SponsorsActivityPeriod where

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

-- | original name - SponsorsActivityPeriod
data SponsorsActivityPeriod = Day | Week | Month | All

derive instance genericSponsorsActivityPeriod
  ::
  Generic SponsorsActivityPeriod _

instance showSponsorsActivityPeriod :: Show SponsorsActivityPeriod where
  show = genericShow

derive instance eqSponsorsActivityPeriod :: Eq SponsorsActivityPeriod

derive instance ordSponsorsActivityPeriod :: Ord SponsorsActivityPeriod

fromToMap :: Array (Tuple String SponsorsActivityPeriod)
fromToMap = [ Tuple "DAY" Day
            , Tuple "WEEK" Week
            , Tuple "MONTH" Month
            , Tuple "ALL" All
            ]

instance sponsorsActivityPeriodGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SponsorsActivityPeriod where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorsActivityPeriod"
                                        fromToMap

instance sponsorsActivityPeriodToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SponsorsActivityPeriod where
  toGraphQLArgumentValue =
    case _ of
      Day -> ArgumentValueEnum "DAY"
      Week -> ArgumentValueEnum "WEEK"
      Month -> ArgumentValueEnum "MONTH"
      All -> ArgumentValueEnum "ALL"
