module Examples.Github.Enum.SubscriptionState where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SubscriptionState
data SubscriptionState = Unsubscribed | Subscribed | Ignored

derive instance genericSubscriptionState :: Generic SubscriptionState _

instance showSubscriptionState :: Show SubscriptionState where
  show = genericShow

derive instance eqSubscriptionState :: Eq SubscriptionState

derive instance ordSubscriptionState :: Ord SubscriptionState

fromToMap :: Array (Tuple String SubscriptionState)
fromToMap = [ Tuple "UNSUBSCRIBED" Unsubscribed
            , Tuple "SUBSCRIBED" Subscribed
            , Tuple "IGNORED" Ignored
            ]

instance subscriptionStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SubscriptionState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SubscriptionState"
                                        fromToMap

instance subscriptionStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SubscriptionState where
  toGraphQLArgumentValue =
    case _ of
      Unsubscribed -> ArgumentValueEnum "UNSUBSCRIBED"
      Subscribed -> ArgumentValueEnum "SUBSCRIBED"
      Ignored -> ArgumentValueEnum "IGNORED"
