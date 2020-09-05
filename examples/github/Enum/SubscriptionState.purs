module Examples.Github.Enum.SubscriptionState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SubscriptionState
data SubscriptionState = Unsubscribed | Subscribed | Ignored

derive instance eqSubscriptionState :: Eq SubscriptionState

derive instance ordSubscriptionState :: Ord SubscriptionState

fromToMap :: Array (Tuple String SubscriptionState)
fromToMap = [ Tuple
              "UNSUBSCRIBED"
              Unsubscribed
            , Tuple "SUBSCRIBED" Subscribed
            , Tuple "IGNORED" Ignored
            ]

instance subscriptionStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                 SubscriptionState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SubscriptionState"
                                        fromToMap

instance subscriptionStateToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                    SubscriptionState where
  toGraphqlArgumentValue =
    case _ of
      Unsubscribed -> ArgumentValueEnum "UNSUBSCRIBED"
      Subscribed -> ArgumentValueEnum "SUBSCRIBED"
      Ignored -> ArgumentValueEnum "IGNORED"
