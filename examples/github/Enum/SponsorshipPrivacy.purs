module Examples.Github.Enum.SponsorshipPrivacy where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SponsorshipPrivacy
data SponsorshipPrivacy
  = Public
  | Private

derive instance eqSponsorshipPrivacy :: Eq SponsorshipPrivacy

derive instance ordSponsorshipPrivacy :: Ord SponsorshipPrivacy

fromToMap :: Array (Tuple String SponsorshipPrivacy)
fromToMap = [Tuple "PUBLIC" Public, Tuple "PRIVATE" Private]

instance sponsorshipPrivacyGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SponsorshipPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SponsorshipPrivacy" fromToMap

instance sponsorshipPrivacyToGraphqlArgumentValue :: ToGraphqlArgumentValue SponsorshipPrivacy where
  toGraphqlArgumentValue =
    case _ of
      Public -> ArgumentValueEnum "PUBLIC"
      Private -> ArgumentValueEnum "PRIVATE"
