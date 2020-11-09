module Examples.Github.Enum.RepositoryLockReason where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepositoryLockReason
data RepositoryLockReason = Moving | Billing | Rename | Migrating

derive instance genericRepositoryLockReason :: Generic RepositoryLockReason _

instance showRepositoryLockReason :: Show RepositoryLockReason where
  show = genericShow

derive instance eqRepositoryLockReason :: Eq RepositoryLockReason

derive instance ordRepositoryLockReason :: Ord RepositoryLockReason

fromToMap :: Array (Tuple String RepositoryLockReason)
fromToMap = [ Tuple "MOVING" Moving
            , Tuple "BILLING" Billing
            , Tuple "RENAME" Rename
            , Tuple "MIGRATING" Migrating
            ]

instance repositoryLockReasonGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                    RepositoryLockReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryLockReason"
                                        fromToMap

instance repositoryLockReasonToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                       RepositoryLockReason where
  toGraphQLArgumentValue =
    case _ of
      Moving -> ArgumentValueEnum "MOVING"
      Billing -> ArgumentValueEnum "BILLING"
      Rename -> ArgumentValueEnum "RENAME"
      Migrating -> ArgumentValueEnum "MIGRATING"
