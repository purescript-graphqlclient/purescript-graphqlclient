module Examples.Github.Enum.LockReason where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - LockReason
data LockReason
  = OffTopic
  | TooHeated
  | Resolved
  | Spam

derive instance eqLockReason :: Eq LockReason

derive instance ordLockReason :: Ord LockReason

fromToMap :: Array (Tuple String LockReason)
fromToMap = [Tuple "OFF_TOPIC" OffTopic, Tuple "TOO_HEATED" TooHeated, Tuple "RESOLVED" Resolved, Tuple "SPAM" Spam]

instance lockReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder LockReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder "LockReason" fromToMap

instance lockReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue LockReason where
  toGraphqlArgumentValue =
    case _ of
      OffTopic -> ArgumentValueEnum "OFF_TOPIC"
      TooHeated -> ArgumentValueEnum "TOO_HEATED"
      Resolved -> ArgumentValueEnum "RESOLVED"
      Spam -> ArgumentValueEnum "SPAM"
