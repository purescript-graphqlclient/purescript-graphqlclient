module Examples.Github.Enum.SecurityAdvisoryOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SecurityAdvisoryOrderField
data SecurityAdvisoryOrderField
  = PublishedAt
  | UpdatedAt

fromToMap :: Array (Tuple String SecurityAdvisoryOrderField)
fromToMap = [Tuple "PUBLISHED_AT" PublishedAt, Tuple "UPDATED_AT" UpdatedAt]

instance securityAdvisoryOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SecurityAdvisoryOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SecurityAdvisoryOrderField" fromToMap

instance securityAdvisoryOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue SecurityAdvisoryOrderField where
  toGraphqlArgumentValue =
    case _ of
      PublishedAt -> ArgumentValueString "PUBLISHED_AT"
      UpdatedAt -> ArgumentValueString "UPDATED_AT"
