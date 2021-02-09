module Dillonkearns.Examples.Github.Enum.SponsorshipPrivacy where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SponsorshipPrivacy
data SponsorshipPrivacy = Public | Private

derive instance genericSponsorshipPrivacy :: Generic SponsorshipPrivacy _

instance showSponsorshipPrivacy :: Show SponsorshipPrivacy where
  show = genericShow

derive instance eqSponsorshipPrivacy :: Eq SponsorshipPrivacy

derive instance ordSponsorshipPrivacy :: Ord SponsorshipPrivacy

fromToMap :: Array (Tuple String SponsorshipPrivacy)
fromToMap = [ Tuple "PUBLIC" Public, Tuple "PRIVATE" Private ]

instance sponsorshipPrivacyGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SponsorshipPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorshipPrivacy"
                                        fromToMap

instance sponsorshipPrivacyToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SponsorshipPrivacy where
  toGraphQLArgumentValue =
    case _ of
      Public -> ArgumentValueEnum "PUBLIC"
      Private -> ArgumentValueEnum "PRIVATE"
