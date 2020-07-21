module Examples.Github.Enum.RepoChangeMergeSettingAuditEntryMergeType where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepoChangeMergeSettingAuditEntryMergeType
data RepoChangeMergeSettingAuditEntryMergeType
  = Merge
  | Rebase
  | Squash

fromToMap :: Array (Tuple String RepoChangeMergeSettingAuditEntryMergeType)
fromToMap = [Tuple "MERGE" Merge, Tuple "REBASE" Rebase, Tuple "SQUASH" Squash]

instance repoChangeMergeSettingAuditEntryMergeTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepoChangeMergeSettingAuditEntryMergeType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepoChangeMergeSettingAuditEntryMergeType" fromToMap

instance repoChangeMergeSettingAuditEntryMergeTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue RepoChangeMergeSettingAuditEntryMergeType where
  toGraphqlArgumentValue =
    case _ of
      Merge -> ArgumentValueEnum "MERGE"
      Rebase -> ArgumentValueEnum "REBASE"
      Squash -> ArgumentValueEnum "SQUASH"
