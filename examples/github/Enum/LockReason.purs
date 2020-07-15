module Examples.Github.Enum.LockReason where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - LockReason
data LockReason
  = OffTopic
  | TooHeated
  | Resolved
  | Spam

fromToMap :: Array (Tuple String LockReason)
fromToMap = [Tuple "OFF_TOPIC" OffTopic, Tuple "TOO_HEATED" TooHeated, Tuple "RESOLVED" Resolved, Tuple "SPAM" Spam]

instance lockReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder LockReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder "LockReason" fromToMap

instance lockReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue LockReason where
  toGraphqlArgumentValue =
    case _ of
      OffTopic -> ArgumentValueString "OFF_TOPIC"
      TooHeated -> ArgumentValueString "TOO_HEATED"
      Resolved -> ArgumentValueString "RESOLVED"
      Spam -> ArgumentValueString "SPAM"
