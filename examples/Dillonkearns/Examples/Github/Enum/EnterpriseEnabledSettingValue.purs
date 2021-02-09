module Dillonkearns.Examples.Github.Enum.EnterpriseEnabledSettingValue where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseEnabledSettingValue
data EnterpriseEnabledSettingValue = Enabled | NoPolicy

derive instance genericEnterpriseEnabledSettingValue
  ::
  Generic EnterpriseEnabledSettingValue _

instance showEnterpriseEnabledSettingValue
  :: Show EnterpriseEnabledSettingValue where
  show = genericShow

derive instance eqEnterpriseEnabledSettingValue
  ::
  Eq EnterpriseEnabledSettingValue

derive instance ordEnterpriseEnabledSettingValue
  ::
  Ord EnterpriseEnabledSettingValue

fromToMap :: Array (Tuple String EnterpriseEnabledSettingValue)
fromToMap = [ Tuple "ENABLED" Enabled, Tuple "NO_POLICY" NoPolicy ]

instance enterpriseEnabledSettingValueGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder EnterpriseEnabledSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseEnabledSettingValue"
                                        fromToMap

instance enterpriseEnabledSettingValueToGraphQLArgumentValue
  :: ToGraphQLArgumentValue EnterpriseEnabledSettingValue where
  toGraphQLArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      NoPolicy -> ArgumentValueEnum "NO_POLICY"
