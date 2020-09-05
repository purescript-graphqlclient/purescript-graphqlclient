module Examples.Github.Enum.ActionExecutionCapabilitySetting where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ActionExecutionCapabilitySetting
data ActionExecutionCapabilitySetting
  = Disabled | AllActions | LocalActionsOnly | NoPolicy

derive instance eqActionExecutionCapabilitySetting :: Eq ActionExecutionCapabilitySetting

derive instance ordActionExecutionCapabilitySetting :: Ord ActionExecutionCapabilitySetting

fromToMap :: Array (Tuple String ActionExecutionCapabilitySetting)
fromToMap = [ Tuple
              "DISABLED"
              Disabled
            , Tuple "ALL_ACTIONS" AllActions
            , Tuple "LOCAL_ACTIONS_ONLY" LocalActionsOnly
            , Tuple "NO_POLICY" NoPolicy
            ]

instance actionExecutionCapabilitySettingGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                ActionExecutionCapabilitySetting where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ActionExecutionCapabilitySetting"
                                        fromToMap

instance actionExecutionCapabilitySettingToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                   ActionExecutionCapabilitySetting where
  toGraphqlArgumentValue =
    case _ of
      Disabled -> ArgumentValueEnum "DISABLED"
      AllActions -> ArgumentValueEnum "ALL_ACTIONS"
      LocalActionsOnly -> ArgumentValueEnum "LOCAL_ACTIONS_ONLY"
      NoPolicy -> ArgumentValueEnum "NO_POLICY"
