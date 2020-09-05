module Examples.Github.Enum.OauthApplicationCreateAuditEntryState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OauthApplicationCreateAuditEntryState
data OauthApplicationCreateAuditEntryState
  = Active | Suspended | PendingDeletion

derive instance eqOauthApplicationCreateAuditEntryState :: Eq OauthApplicationCreateAuditEntryState

derive instance ordOauthApplicationCreateAuditEntryState :: Ord OauthApplicationCreateAuditEntryState

fromToMap :: Array (Tuple String OauthApplicationCreateAuditEntryState)
fromToMap = [ Tuple "ACTIVE" Active
            , Tuple "SUSPENDED" Suspended
            , Tuple "PENDING_DELETION" PendingDeletion
            ]

instance oauthApplicationCreateAuditEntryStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                     OauthApplicationCreateAuditEntryState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OauthApplicationCreateAuditEntryState"
                                        fromToMap

instance oauthApplicationCreateAuditEntryStateToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                        OauthApplicationCreateAuditEntryState where
  toGraphqlArgumentValue =
    case _ of
      Active -> ArgumentValueEnum "ACTIVE"
      Suspended -> ArgumentValueEnum "SUSPENDED"
      PendingDeletion -> ArgumentValueEnum "PENDING_DELETION"