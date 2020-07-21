module Examples.Github.Enum.EnterpriseServerUserAccountsUploadSyncState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - EnterpriseServerUserAccountsUploadSyncState
data EnterpriseServerUserAccountsUploadSyncState
  = Pending
  | Success
  | Failure

fromToMap :: Array (Tuple String EnterpriseServerUserAccountsUploadSyncState)
fromToMap = [Tuple "PENDING" Pending, Tuple "SUCCESS" Success, Tuple "FAILURE" Failure]

instance enterpriseServerUserAccountsUploadSyncStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseServerUserAccountsUploadSyncState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseServerUserAccountsUploadSyncState" fromToMap

instance enterpriseServerUserAccountsUploadSyncStateToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseServerUserAccountsUploadSyncState where
  toGraphqlArgumentValue =
    case _ of
      Pending -> ArgumentValueEnum "PENDING"
      Success -> ArgumentValueEnum "SUCCESS"
      Failure -> ArgumentValueEnum "FAILURE"
