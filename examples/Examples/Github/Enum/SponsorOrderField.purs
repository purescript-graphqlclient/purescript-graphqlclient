module Examples.Github.Enum.SponsorOrderField where

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

-- | original name - SponsorOrderField
data SponsorOrderField = Login | Relevance

derive instance genericSponsorOrderField :: Generic SponsorOrderField _

instance showSponsorOrderField :: Show SponsorOrderField where
  show = genericShow

derive instance eqSponsorOrderField :: Eq SponsorOrderField

derive instance ordSponsorOrderField :: Ord SponsorOrderField

fromToMap :: Array (Tuple String SponsorOrderField)
fromToMap = [ Tuple "LOGIN" Login, Tuple "RELEVANCE" Relevance ]

instance sponsorOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SponsorOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorOrderField"
                                        fromToMap

instance sponsorOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SponsorOrderField where
  toGraphQLArgumentValue =
    case _ of
      Login -> ArgumentValueEnum "LOGIN"
      Relevance -> ArgumentValueEnum "RELEVANCE"
