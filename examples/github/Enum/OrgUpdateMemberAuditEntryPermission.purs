module Examples.Github.Enum.OrgUpdateMemberAuditEntryPermission where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgUpdateMemberAuditEntryPermission
data OrgUpdateMemberAuditEntryPermission = Read | Admin

derive instance eqOrgUpdateMemberAuditEntryPermission :: Eq OrgUpdateMemberAuditEntryPermission

derive instance ordOrgUpdateMemberAuditEntryPermission :: Ord OrgUpdateMemberAuditEntryPermission

fromToMap :: Array (Tuple String OrgUpdateMemberAuditEntryPermission)
fromToMap = [ Tuple "READ" Read, Tuple "ADMIN" Admin ]

instance orgUpdateMemberAuditEntryPermissionGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                   OrgUpdateMemberAuditEntryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgUpdateMemberAuditEntryPermission"
                                        fromToMap

instance orgUpdateMemberAuditEntryPermissionToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                      OrgUpdateMemberAuditEntryPermission where
  toGraphQLArgumentValue =
    case _ of
      Read -> ArgumentValueEnum "READ"
      Admin -> ArgumentValueEnum "ADMIN"
