module Examples.Github.Enum.SponsorshipPrivacy where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SponsorshipPrivacy
data SponsorshipPrivacy
  = Public
  | Private

fromToMap :: Array (Tuple String SponsorshipPrivacy)
fromToMap = [Tuple "PUBLIC" Public, Tuple "PRIVATE" Private]

instance sponsorshipPrivacyGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SponsorshipPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SponsorshipPrivacy" fromToMap

instance sponsorshipPrivacyToGraphqlArgumentValue :: ToGraphqlArgumentValue SponsorshipPrivacy where
  toGraphqlArgumentValue =
    case _ of
      Public -> ArgumentValueString "PUBLIC"
      Private -> ArgumentValueString "PRIVATE"
