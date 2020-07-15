module Examples.Github.Enum.ActionExecutionCapabilitySetting where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - ActionExecutionCapabilitySetting
data ActionExecutionCapabilitySetting
  = Disabled
  | AllActions
  | LocalActionsOnly
  | NoPolicy

fromToMap :: Array (Tuple String ActionExecutionCapabilitySetting)
fromToMap = [Tuple "DISABLED" Disabled, Tuple "ALL_ACTIONS" AllActions, Tuple "LOCAL_ACTIONS_ONLY" LocalActionsOnly, Tuple "NO_POLICY" NoPolicy]

instance actionExecutionCapabilitySettingGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ActionExecutionCapabilitySetting where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ActionExecutionCapabilitySetting" fromToMap

instance actionExecutionCapabilitySettingToGraphqlArgumentValue :: ToGraphqlArgumentValue ActionExecutionCapabilitySetting where
  toGraphqlArgumentValue =
    case _ of
      Disabled -> ArgumentValueString "DISABLED"
      AllActions -> ArgumentValueString "ALL_ACTIONS"
      LocalActionsOnly -> ArgumentValueString "LOCAL_ACTIONS_ONLY"
      NoPolicy -> ArgumentValueString "NO_POLICY"
