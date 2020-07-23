module Examples.Github.Enum.SponsorshipOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
