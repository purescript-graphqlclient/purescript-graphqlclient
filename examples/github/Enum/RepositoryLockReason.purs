module Examples.Github.Enum.RepositoryLockReason where

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

-- | original name - RepositoryLockReason
data RepositoryLockReason
  = Moving
  | Billing
  | Rename
  | Migrating

derive instance eqRepositoryLockReason :: Eq RepositoryLockReason

derive instance ordRepositoryLockReason :: Ord RepositoryLockReason

fromToMap :: Array (Tuple String RepositoryLockReason)
fromToMap = [Tuple "MOVING" Moving, Tuple "BILLING" Billing, Tuple "RENAME" Rename, Tuple "MIGRATING" Migrating]

instance repositoryLockReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepositoryLockReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepositoryLockReason" fromToMap

instance repositoryLockReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue RepositoryLockReason where
  toGraphqlArgumentValue =
    case _ of
      Moving -> ArgumentValueEnum "MOVING"
      Billing -> ArgumentValueEnum "BILLING"
      Rename -> ArgumentValueEnum "RENAME"
      Migrating -> ArgumentValueEnum "MIGRATING"
