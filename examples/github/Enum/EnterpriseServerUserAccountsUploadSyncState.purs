module Examples.Github.Enum.EnterpriseServerUserAccountsUploadSyncState where

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

-- | original name - EnterpriseServerUserAccountsUploadSyncState
data EnterpriseServerUserAccountsUploadSyncState = Pending | Success | Failure

derive instance genericEnterpriseServerUserAccountsUploadSyncState
  ::
  Generic EnterpriseServerUserAccountsUploadSyncState _

instance showEnterpriseServerUserAccountsUploadSyncState
  :: Show EnterpriseServerUserAccountsUploadSyncState where
  show = genericShow

derive instance eqEnterpriseServerUserAccountsUploadSyncState
  ::
  Eq EnterpriseServerUserAccountsUploadSyncState

derive instance ordEnterpriseServerUserAccountsUploadSyncState
  ::
  Ord EnterpriseServerUserAccountsUploadSyncState

fromToMap :: Array (Tuple String EnterpriseServerUserAccountsUploadSyncState)
fromToMap = [ Tuple "PENDING" Pending
            , Tuple "SUCCESS" Success
            , Tuple "FAILURE" Failure
            ]

instance enterpriseServerUserAccountsUploadSyncStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder
     EnterpriseServerUserAccountsUploadSyncState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseServerUserAccountsUploadSyncState"
                                        fromToMap

instance enterpriseServerUserAccountsUploadSyncStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue EnterpriseServerUserAccountsUploadSyncState where
  toGraphQLArgumentValue =
    case _ of
      Pending -> ArgumentValueEnum "PENDING"
      Success -> ArgumentValueEnum "SUCCESS"
      Failure -> ArgumentValueEnum "FAILURE"
