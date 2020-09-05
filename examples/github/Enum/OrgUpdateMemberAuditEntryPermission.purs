module Examples.Github.Enum.OrgUpdateMemberAuditEntryPermission where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgUpdateMemberAuditEntryPermission
data OrgUpdateMemberAuditEntryPermission = Read | Admin

derive instance eqOrgUpdateMemberAuditEntryPermission :: Eq OrgUpdateMemberAuditEntryPermission

derive instance ordOrgUpdateMemberAuditEntryPermission :: Ord OrgUpdateMemberAuditEntryPermission

fromToMap :: Array (Tuple String OrgUpdateMemberAuditEntryPermission)
fromToMap = [ Tuple "READ" Read, Tuple "ADMIN" Admin ]

instance orgUpdateMemberAuditEntryPermissionGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                   OrgUpdateMemberAuditEntryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgUpdateMemberAuditEntryPermission"
                                        fromToMap

instance orgUpdateMemberAuditEntryPermissionToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                      OrgUpdateMemberAuditEntryPermission where
  toGraphqlArgumentValue =
    case _ of
      Read -> ArgumentValueEnum "READ"
      Admin -> ArgumentValueEnum "ADMIN"
