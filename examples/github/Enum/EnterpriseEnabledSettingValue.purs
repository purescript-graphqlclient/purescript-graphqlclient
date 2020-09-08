module Examples.Github.Enum.EnterpriseEnabledSettingValue where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseEnabledSettingValue
data EnterpriseEnabledSettingValue = Enabled | NoPolicy

derive instance eqEnterpriseEnabledSettingValue :: Eq EnterpriseEnabledSettingValue

derive instance ordEnterpriseEnabledSettingValue :: Ord EnterpriseEnabledSettingValue

fromToMap :: Array (Tuple String EnterpriseEnabledSettingValue)
fromToMap = [ Tuple "ENABLED" Enabled, Tuple "NO_POLICY" NoPolicy ]

instance enterpriseEnabledSettingValueGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                             EnterpriseEnabledSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseEnabledSettingValue"
                                        fromToMap

instance enterpriseEnabledSettingValueToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                EnterpriseEnabledSettingValue where
  toGraphQLArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      NoPolicy -> ArgumentValueEnum "NO_POLICY"
