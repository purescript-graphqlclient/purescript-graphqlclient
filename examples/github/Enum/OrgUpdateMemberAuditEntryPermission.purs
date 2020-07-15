module Examples.Github.Enum.OrgUpdateMemberAuditEntryPermission where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrgUpdateMemberAuditEntryPermission
data OrgUpdateMemberAuditEntryPermission
  = Read
  | Admin

fromToMap :: Array (Tuple String OrgUpdateMemberAuditEntryPermission)
fromToMap = [Tuple "READ" Read, Tuple "ADMIN" Admin]

instance orgUpdateMemberAuditEntryPermissionGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrgUpdateMemberAuditEntryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrgUpdateMemberAuditEntryPermission" fromToMap

instance orgUpdateMemberAuditEntryPermissionToGraphqlArgumentValue :: ToGraphqlArgumentValue OrgUpdateMemberAuditEntryPermission where
  toGraphqlArgumentValue =
    case _ of
      Read -> ArgumentValueString "READ"
      Admin -> ArgumentValueString "ADMIN"
