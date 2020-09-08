module Examples.Github.Enum.EnterpriseEnabledDisabledSettingValue where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseEnabledDisabledSettingValue
data EnterpriseEnabledDisabledSettingValue = Enabled | Disabled | NoPolicy

derive instance eqEnterpriseEnabledDisabledSettingValue :: Eq EnterpriseEnabledDisabledSettingValue

derive instance ordEnterpriseEnabledDisabledSettingValue :: Ord EnterpriseEnabledDisabledSettingValue

fromToMap :: Array (Tuple String EnterpriseEnabledDisabledSettingValue)
fromToMap = [ Tuple "ENABLED" Enabled
            , Tuple "DISABLED" Disabled
            , Tuple "NO_POLICY" NoPolicy
            ]

instance enterpriseEnabledDisabledSettingValueGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                     EnterpriseEnabledDisabledSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseEnabledDisabledSettingValue"
                                        fromToMap

instance enterpriseEnabledDisabledSettingValueToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                        EnterpriseEnabledDisabledSettingValue where
  toGraphQLArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      Disabled -> ArgumentValueEnum "DISABLED"
      NoPolicy -> ArgumentValueEnum "NO_POLICY"
