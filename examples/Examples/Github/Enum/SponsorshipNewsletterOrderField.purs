module Examples.Github.Enum.SponsorshipNewsletterOrderField where

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

-- | original name - SponsorshipNewsletterOrderField
data SponsorshipNewsletterOrderField = CreatedAt

derive instance genericSponsorshipNewsletterOrderField
  ::
  Generic SponsorshipNewsletterOrderField _

instance showSponsorshipNewsletterOrderField
  :: Show SponsorshipNewsletterOrderField where
  show = genericShow

derive instance eqSponsorshipNewsletterOrderField
  ::
  Eq SponsorshipNewsletterOrderField

derive instance ordSponsorshipNewsletterOrderField
  ::
  Ord SponsorshipNewsletterOrderField

fromToMap :: Array (Tuple String SponsorshipNewsletterOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance sponsorshipNewsletterOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SponsorshipNewsletterOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorshipNewsletterOrderField"
                                        fromToMap

instance sponsorshipNewsletterOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SponsorshipNewsletterOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
