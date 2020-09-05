module Examples.Github.Enum.OrgAddMemberAuditEntryPermission where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgAddMemberAuditEntryPermission
data OrgAddMemberAuditEntryPermission = Read | Admin

derive instance eqOrgAddMemberAuditEntryPermission :: Eq OrgAddMemberAuditEntryPermission

derive instance ordOrgAddMemberAuditEntryPermission :: Ord OrgAddMemberAuditEntryPermission

fromToMap :: Array (Tuple String OrgAddMemberAuditEntryPermission)
fromToMap = [ Tuple "READ" Read, Tuple "ADMIN" Admin ]

instance orgAddMemberAuditEntryPermissionGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                OrgAddMemberAuditEntryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgAddMemberAuditEntryPermission"
                                        fromToMap

instance orgAddMemberAuditEntryPermissionToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                   OrgAddMemberAuditEntryPermission where
  toGraphqlArgumentValue =
    case _ of
      Read -> ArgumentValueEnum "READ"
      Admin -> ArgumentValueEnum "ADMIN"
