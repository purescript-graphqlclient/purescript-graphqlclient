module Examples.Github.Enum.RepositoryLockReason where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepositoryLockReason
data RepositoryLockReason
  = Moving
  | Billing
  | Rename
  | Migrating

fromToMap :: Array (Tuple String RepositoryLockReason)
fromToMap = [Tuple "MOVING" Moving, Tuple "BILLING" Billing, Tuple "RENAME" Rename, Tuple "MIGRATING" Migrating]

instance repositoryLockReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepositoryLockReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepositoryLockReason" fromToMap

instance repositoryLockReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue RepositoryLockReason where
  toGraphqlArgumentValue =
    case _ of
      Moving -> ArgumentValueString "MOVING"
      Billing -> ArgumentValueString "BILLING"
      Rename -> ArgumentValueString "RENAME"
      Migrating -> ArgumentValueString "MIGRATING"
