module Examples.Github.Enum.RepoChangeMergeSettingAuditEntryMergeType where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepoChangeMergeSettingAuditEntryMergeType
data RepoChangeMergeSettingAuditEntryMergeType = Merge | Rebase | Squash

derive instance eqRepoChangeMergeSettingAuditEntryMergeType :: Eq RepoChangeMergeSettingAuditEntryMergeType

derive instance ordRepoChangeMergeSettingAuditEntryMergeType :: Ord RepoChangeMergeSettingAuditEntryMergeType

fromToMap :: Array (Tuple String RepoChangeMergeSettingAuditEntryMergeType)
fromToMap = [ Tuple "MERGE" Merge
            , Tuple "REBASE" Rebase
            , Tuple "SQUASH" Squash
            ]

instance repoChangeMergeSettingAuditEntryMergeTypeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                         RepoChangeMergeSettingAuditEntryMergeType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepoChangeMergeSettingAuditEntryMergeType"
                                        fromToMap

instance repoChangeMergeSettingAuditEntryMergeTypeToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                            RepoChangeMergeSettingAuditEntryMergeType where
  toGraphQLArgumentValue =
    case _ of
      Merge -> ArgumentValueEnum "MERGE"
      Rebase -> ArgumentValueEnum "REBASE"
      Squash -> ArgumentValueEnum "SQUASH"
