module Examples.Github.Enum.SponsorshipOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SponsorshipOrderField
data SponsorshipOrderField = CreatedAt

derive instance eqSponsorshipOrderField :: Eq SponsorshipOrderField

derive instance ordSponsorshipOrderField :: Ord SponsorshipOrderField

fromToMap :: Array (Tuple String SponsorshipOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance sponsorshipOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                     SponsorshipOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorshipOrderField"
                                        fromToMap

instance sponsorshipOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                        SponsorshipOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
