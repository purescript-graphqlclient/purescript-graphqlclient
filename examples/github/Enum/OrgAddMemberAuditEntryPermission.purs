module Examples.Github.Enum.OrgAddMemberAuditEntryPermission where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrgAddMemberAuditEntryPermission
data OrgAddMemberAuditEntryPermission
  = Read
  | Admin

fromToMap :: Array (Tuple String OrgAddMemberAuditEntryPermission)
fromToMap = [Tuple "READ" Read, Tuple "ADMIN" Admin]

instance orgAddMemberAuditEntryPermissionGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrgAddMemberAuditEntryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrgAddMemberAuditEntryPermission" fromToMap

instance orgAddMemberAuditEntryPermissionToGraphqlArgumentValue :: ToGraphqlArgumentValue OrgAddMemberAuditEntryPermission where
  toGraphqlArgumentValue =
    case _ of
      Read -> ArgumentValueString "READ"
      Admin -> ArgumentValueString "ADMIN"
