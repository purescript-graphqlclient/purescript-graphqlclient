module Dillonkearns.Examples.Github.Enum.NotificationRestrictionSettingValue where

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

-- | original name - NotificationRestrictionSettingValue
data NotificationRestrictionSettingValue = Enabled | Disabled

derive instance genericNotificationRestrictionSettingValue
  ::
  Generic NotificationRestrictionSettingValue _

instance showNotificationRestrictionSettingValue
  :: Show NotificationRestrictionSettingValue where
  show = genericShow

derive instance eqNotificationRestrictionSettingValue
  ::
  Eq NotificationRestrictionSettingValue

derive instance ordNotificationRestrictionSettingValue
  ::
  Ord NotificationRestrictionSettingValue

fromToMap :: Array (Tuple String NotificationRestrictionSettingValue)
fromToMap = [ Tuple "ENABLED" Enabled, Tuple "DISABLED" Disabled ]

instance notificationRestrictionSettingValueGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder
     NotificationRestrictionSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "NotificationRestrictionSettingValue"
                                        fromToMap

instance notificationRestrictionSettingValueToGraphQLArgumentValue
  :: ToGraphQLArgumentValue NotificationRestrictionSettingValue where
  toGraphQLArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      Disabled -> ArgumentValueEnum "DISABLED"
