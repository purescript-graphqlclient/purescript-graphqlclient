module Dillonkearns.Examples.Github.Enum.SponsorshipOrderField where

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

-- | original name - SponsorshipOrderField
data SponsorshipOrderField = CreatedAt

derive instance genericSponsorshipOrderField :: Generic SponsorshipOrderField _

instance showSponsorshipOrderField :: Show SponsorshipOrderField where
  show = genericShow

derive instance eqSponsorshipOrderField :: Eq SponsorshipOrderField

derive instance ordSponsorshipOrderField :: Ord SponsorshipOrderField

fromToMap :: Array (Tuple String SponsorshipOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance sponsorshipOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SponsorshipOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorshipOrderField"
                                        fromToMap

instance sponsorshipOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SponsorshipOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
