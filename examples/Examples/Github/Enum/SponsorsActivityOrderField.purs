module Examples.Github.Enum.SponsorsActivityOrderField where

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

-- | original name - SponsorsActivityOrderField
data SponsorsActivityOrderField = Timestamp

derive instance genericSponsorsActivityOrderField
  ::
  Generic SponsorsActivityOrderField _

instance showSponsorsActivityOrderField :: Show SponsorsActivityOrderField where
  show = genericShow

derive instance eqSponsorsActivityOrderField :: Eq SponsorsActivityOrderField

derive instance ordSponsorsActivityOrderField :: Ord SponsorsActivityOrderField

fromToMap :: Array (Tuple String SponsorsActivityOrderField)
fromToMap = [ Tuple "TIMESTAMP" Timestamp ]

instance sponsorsActivityOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SponsorsActivityOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorsActivityOrderField"
                                        fromToMap

instance sponsorsActivityOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SponsorsActivityOrderField where
  toGraphQLArgumentValue =
    case _ of
      Timestamp -> ArgumentValueEnum "TIMESTAMP"
