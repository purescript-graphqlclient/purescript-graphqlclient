module Examples.Github.Enum.RepositoryInteractionLimitExpiry where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepositoryInteractionLimitExpiry
data RepositoryInteractionLimitExpiry
  = OneDay | ThreeDays | OneWeek | OneMonth | SixMonths

derive instance genericRepositoryInteractionLimitExpiry :: Generic RepositoryInteractionLimitExpiry _

instance showRepositoryInteractionLimitExpiry :: Show
                                                 RepositoryInteractionLimitExpiry where
  show = genericShow

derive instance eqRepositoryInteractionLimitExpiry :: Eq RepositoryInteractionLimitExpiry

derive instance ordRepositoryInteractionLimitExpiry :: Ord RepositoryInteractionLimitExpiry

fromToMap :: Array (Tuple String RepositoryInteractionLimitExpiry)
fromToMap = [ Tuple "ONE_DAY" OneDay
            , Tuple "THREE_DAYS" ThreeDays
            , Tuple "ONE_WEEK" OneWeek
            , Tuple "ONE_MONTH" OneMonth
            , Tuple "SIX_MONTHS" SixMonths
            ]

instance repositoryInteractionLimitExpiryGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                RepositoryInteractionLimitExpiry where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryInteractionLimitExpiry"
                                        fromToMap

instance repositoryInteractionLimitExpiryToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                   RepositoryInteractionLimitExpiry where
  toGraphQLArgumentValue =
    case _ of
      OneDay -> ArgumentValueEnum "ONE_DAY"
      ThreeDays -> ArgumentValueEnum "THREE_DAYS"
      OneWeek -> ArgumentValueEnum "ONE_WEEK"
      OneMonth -> ArgumentValueEnum "ONE_MONTH"
      SixMonths -> ArgumentValueEnum "SIX_MONTHS"
