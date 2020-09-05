module Examples.Github.Enum.EnterpriseEnabledSettingValue where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseEnabledSettingValue
data EnterpriseEnabledSettingValue = Enabled | NoPolicy

derive instance eqEnterpriseEnabledSettingValue :: Eq EnterpriseEnabledSettingValue

derive instance ordEnterpriseEnabledSettingValue :: Ord EnterpriseEnabledSettingValue

fromToMap :: Array (Tuple String EnterpriseEnabledSettingValue)
fromToMap = [ Tuple "ENABLED" Enabled, Tuple "NO_POLICY" NoPolicy ]

instance enterpriseEnabledSettingValueGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                             EnterpriseEnabledSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseEnabledSettingValue"
                                        fromToMap

instance enterpriseEnabledSettingValueToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                EnterpriseEnabledSettingValue where
  toGraphqlArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      NoPolicy -> ArgumentValueEnum "NO_POLICY"
