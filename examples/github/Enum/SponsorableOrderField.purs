module Examples.Github.Enum.SponsorableOrderField where

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

-- | original name - SponsorableOrderField
data SponsorableOrderField = Login

derive instance genericSponsorableOrderField :: Generic SponsorableOrderField _

instance showSponsorableOrderField :: Show SponsorableOrderField where
  show = genericShow

derive instance eqSponsorableOrderField :: Eq SponsorableOrderField

derive instance ordSponsorableOrderField :: Ord SponsorableOrderField

fromToMap :: Array (Tuple String SponsorableOrderField)
fromToMap = [ Tuple "LOGIN" Login ]

instance sponsorableOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SponsorableOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorableOrderField"
                                        fromToMap

instance sponsorableOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SponsorableOrderField where
  toGraphQLArgumentValue =
    case _ of
      Login -> ArgumentValueEnum "LOGIN"
