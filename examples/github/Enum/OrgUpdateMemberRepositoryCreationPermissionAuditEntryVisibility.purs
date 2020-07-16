module Examples.Github.Enum.OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility
data OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility
  = All
  | Public
  | None
  | Private
  | Internal
  | PublicInternal
  | PrivateInternal
  | PublicPrivate

fromToMap :: Array (Tuple String OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility)
fromToMap = [Tuple "ALL" All, Tuple "PUBLIC" Public, Tuple "NONE" None, Tuple "PRIVATE" Private, Tuple "INTERNAL" Internal, Tuple "PUBLIC_INTERNAL" PublicInternal, Tuple "PRIVATE_INTERNAL" PrivateInternal, Tuple "PUBLIC_PRIVATE" PublicPrivate]

instance orgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility" fromToMap

instance orgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      All -> ArgumentValueString "ALL"
      Public -> ArgumentValueString "PUBLIC"
      None -> ArgumentValueString "NONE"
      Private -> ArgumentValueString "PRIVATE"
      Internal -> ArgumentValueString "INTERNAL"
      PublicInternal -> ArgumentValueString "PUBLIC_INTERNAL"
      PrivateInternal -> ArgumentValueString "PRIVATE_INTERNAL"
      PublicPrivate -> ArgumentValueString "PUBLIC_PRIVATE"
