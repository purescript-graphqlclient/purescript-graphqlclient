module Examples.Github.Enum.IpAllowListEntryOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - IpAllowListEntryOrderField
data IpAllowListEntryOrderField
  = CreatedAt
  | AllowListValue

fromToMap :: Array (Tuple String IpAllowListEntryOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt, Tuple "ALLOW_LIST_VALUE" AllowListValue]

instance ipAllowListEntryOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder IpAllowListEntryOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "IpAllowListEntryOrderField" fromToMap

instance ipAllowListEntryOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue IpAllowListEntryOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueString "CREATED_AT"
      AllowListValue -> ArgumentValueString "ALLOW_LIST_VALUE"
