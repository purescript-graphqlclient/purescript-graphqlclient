module Examples.Github.Enum.EnterpriseServerUserAccountsUploadSyncState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseServerUserAccountsUploadSyncState
data EnterpriseServerUserAccountsUploadSyncState = Pending | Success | Failure

derive instance eqEnterpriseServerUserAccountsUploadSyncState :: Eq EnterpriseServerUserAccountsUploadSyncState

derive instance ordEnterpriseServerUserAccountsUploadSyncState :: Ord EnterpriseServerUserAccountsUploadSyncState

fromToMap :: Array (Tuple String EnterpriseServerUserAccountsUploadSyncState)
fromToMap = [ Tuple
              "PENDING"
              Pending
            , Tuple "SUCCESS" Success
            , Tuple "FAILURE" Failure
            ]

instance enterpriseServerUserAccountsUploadSyncStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                           EnterpriseServerUserAccountsUploadSyncState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseServerUserAccountsUploadSyncState"
                                        fromToMap

instance enterpriseServerUserAccountsUploadSyncStateToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                              EnterpriseServerUserAccountsUploadSyncState where
  toGraphqlArgumentValue =
    case _ of
      Pending -> ArgumentValueEnum "PENDING"
      Success -> ArgumentValueEnum "SUCCESS"
      Failure -> ArgumentValueEnum "FAILURE"
