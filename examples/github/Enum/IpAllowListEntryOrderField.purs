module Examples.Github.Enum.IpAllowListEntryOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - IpAllowListEntryOrderField
data IpAllowListEntryOrderField = CreatedAt | AllowListValue

derive instance eqIpAllowListEntryOrderField :: Eq IpAllowListEntryOrderField

derive instance ordIpAllowListEntryOrderField :: Ord IpAllowListEntryOrderField

fromToMap :: Array (Tuple String IpAllowListEntryOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt
            , Tuple "ALLOW_LIST_VALUE" AllowListValue
            ]

instance ipAllowListEntryOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                          IpAllowListEntryOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "IpAllowListEntryOrderField"
                                        fromToMap

instance ipAllowListEntryOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                             IpAllowListEntryOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      AllowListValue -> ArgumentValueEnum "ALLOW_LIST_VALUE"
