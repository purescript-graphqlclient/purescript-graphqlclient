module Examples.Github.Enum.SubscriptionState where

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

derive instance eqSubscriptionState :: Eq SubscriptionState

derive instance ordSubscriptionState :: Ord SubscriptionState

fromToMap :: Array (Tuple String SubscriptionState)
fromToMap = [ Tuple "UNSUBSCRIBED" Unsubscribed
            , Tuple "SUBSCRIBED" Subscribed
            , Tuple "IGNORED" Ignored
            ]

instance subscriptionStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                 SubscriptionState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SubscriptionState"
                                        fromToMap

instance subscriptionStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                    SubscriptionState where
  toGraphQLArgumentValue =
    case _ of
      Unsubscribed -> ArgumentValueEnum "UNSUBSCRIBED"
      Subscribed -> ArgumentValueEnum "SUBSCRIBED"
      Ignored -> ArgumentValueEnum "IGNORED"
