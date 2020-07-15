module Examples.Github.Enum.OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility
data OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility
  = All
  | Public

fromToMap :: Array (Tuple String OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility)
fromToMap = [Tuple "ALL" All, Tuple "PUBLIC" Public]

instance orgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility" fromToMap

instance orgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      All -> ArgumentValueString "ALL"
      Public -> ArgumentValueString "PUBLIC"
