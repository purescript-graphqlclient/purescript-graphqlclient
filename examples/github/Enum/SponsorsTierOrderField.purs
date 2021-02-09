module Examples.Github.Enum.SponsorsTierOrderField where

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

-- | original name - SponsorsTierOrderField
data SponsorsTierOrderField = CreatedAt | MonthlyPriceInCents

derive instance genericSponsorsTierOrderField
  ::
  Generic SponsorsTierOrderField _

instance showSponsorsTierOrderField :: Show SponsorsTierOrderField where
  show = genericShow

derive instance eqSponsorsTierOrderField :: Eq SponsorsTierOrderField

derive instance ordSponsorsTierOrderField :: Ord SponsorsTierOrderField

fromToMap :: Array (Tuple String SponsorsTierOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt
            , Tuple "MONTHLY_PRICE_IN_CENTS" MonthlyPriceInCents
            ]

instance sponsorsTierOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SponsorsTierOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorsTierOrderField"
                                        fromToMap

instance sponsorsTierOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SponsorsTierOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      MonthlyPriceInCents -> ArgumentValueEnum "MONTHLY_PRICE_IN_CENTS"
