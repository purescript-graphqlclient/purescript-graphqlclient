module Dillonkearns.Examples.Github.Enum.LockReason where

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

-- | original name - LockReason
data LockReason = OffTopic | TooHeated | Resolved | Spam

derive instance genericLockReason :: Generic LockReason _

instance showLockReason :: Show LockReason where
  show = genericShow

derive instance eqLockReason :: Eq LockReason

derive instance ordLockReason :: Ord LockReason

fromToMap :: Array (Tuple String LockReason)
fromToMap = [ Tuple "OFF_TOPIC" OffTopic
            , Tuple "TOO_HEATED" TooHeated
            , Tuple "RESOLVED" Resolved
            , Tuple "SPAM" Spam
            ]

instance lockReasonGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder LockReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder "LockReason" fromToMap

instance lockReasonToGraphQLArgumentValue
  :: ToGraphQLArgumentValue LockReason where
  toGraphQLArgumentValue =
    case _ of
      OffTopic -> ArgumentValueEnum "OFF_TOPIC"
      TooHeated -> ArgumentValueEnum "TOO_HEATED"
      Resolved -> ArgumentValueEnum "RESOLVED"
      Spam -> ArgumentValueEnum "SPAM"
