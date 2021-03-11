module Examples.Github.Enum.ContributionLevel where

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

-- | original name - ContributionLevel
data ContributionLevel
  = None
  | FirstQuartile
  | SecondQuartile
  | ThirdQuartile
  | FourthQuartile

derive instance genericContributionLevel :: Generic ContributionLevel _

instance showContributionLevel :: Show ContributionLevel where
  show = genericShow

derive instance eqContributionLevel :: Eq ContributionLevel

derive instance ordContributionLevel :: Ord ContributionLevel

fromToMap :: Array (Tuple String ContributionLevel)
fromToMap = [ Tuple "NONE" None
            , Tuple "FIRST_QUARTILE" FirstQuartile
            , Tuple "SECOND_QUARTILE" SecondQuartile
            , Tuple "THIRD_QUARTILE" ThirdQuartile
            , Tuple "FOURTH_QUARTILE" FourthQuartile
            ]

instance contributionLevelGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder ContributionLevel where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ContributionLevel"
                                        fromToMap

instance contributionLevelToGraphQLArgumentValue
  :: ToGraphQLArgumentValue ContributionLevel where
  toGraphQLArgumentValue =
    case _ of
      None -> ArgumentValueEnum "NONE"
      FirstQuartile -> ArgumentValueEnum "FIRST_QUARTILE"
      SecondQuartile -> ArgumentValueEnum "SECOND_QUARTILE"
      ThirdQuartile -> ArgumentValueEnum "THIRD_QUARTILE"
      FourthQuartile -> ArgumentValueEnum "FOURTH_QUARTILE"
