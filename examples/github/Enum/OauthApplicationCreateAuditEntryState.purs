module Examples.Github.Enum.OauthApplicationCreateAuditEntryState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OauthApplicationCreateAuditEntryState
data OauthApplicationCreateAuditEntryState
  = Active
  | Suspended
  | PendingDeletion

fromToMap :: Array (Tuple String OauthApplicationCreateAuditEntryState)
fromToMap = [Tuple "ACTIVE" Active, Tuple "SUSPENDED" Suspended, Tuple "PENDING_DELETION" PendingDeletion]

instance oauthApplicationCreateAuditEntryStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OauthApplicationCreateAuditEntryState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OauthApplicationCreateAuditEntryState" fromToMap

instance oauthApplicationCreateAuditEntryStateToGraphqlArgumentValue :: ToGraphqlArgumentValue OauthApplicationCreateAuditEntryState where
  toGraphqlArgumentValue =
    case _ of
      Active -> ArgumentValueString "ACTIVE"
      Suspended -> ArgumentValueString "SUSPENDED"
      PendingDeletion -> ArgumentValueString "PENDING_DELETION"
