module Examples.Github.Enum.IpAllowListEntryOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      AllowListValue -> ArgumentValueEnum "ALLOW_LIST_VALUE"
