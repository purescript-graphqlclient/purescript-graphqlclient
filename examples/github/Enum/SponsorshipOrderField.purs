module Examples.Github.Enum.SponsorshipOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SponsorshipOrderField
data SponsorshipOrderField
  = CreatedAt

fromToMap :: Array (Tuple String SponsorshipOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt]

instance sponsorshipOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SponsorshipOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SponsorshipOrderField" fromToMap

instance sponsorshipOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue SponsorshipOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueString "CREATED_AT"
