module Examples.Github.Enum.SponsorsTierOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SponsorsTierOrderField
data SponsorsTierOrderField
  = CreatedAt
  | MonthlyPriceInCents

fromToMap :: Array (Tuple String SponsorsTierOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt, Tuple "MONTHLY_PRICE_IN_CENTS" MonthlyPriceInCents]

instance sponsorsTierOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SponsorsTierOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SponsorsTierOrderField" fromToMap

instance sponsorsTierOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue SponsorsTierOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueString "CREATED_AT"
      MonthlyPriceInCents -> ArgumentValueString "MONTHLY_PRICE_IN_CENTS"
