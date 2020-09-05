module Examples.Github.Enum.OrgUpdateDefaultRepositoryPermissionAuditEntryPermission where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgUpdateDefaultRepositoryPermissionAuditEntryPermission
data OrgUpdateDefaultRepositoryPermissionAuditEntryPermission
  = Read | Write | Admin | None

derive instance eqOrgUpdateDefaultRepositoryPermissionAuditEntryPermission :: Eq OrgUpdateDefaultRepositoryPermissionAuditEntryPermission

derive instance ordOrgUpdateDefaultRepositoryPermissionAuditEntryPermission :: Ord OrgUpdateDefaultRepositoryPermissionAuditEntryPermission

fromToMap :: Array
             (Tuple
              String
              OrgUpdateDefaultRepositoryPermissionAuditEntryPermission)
fromToMap = [ Tuple
              "READ"
              Read
            , Tuple "WRITE" Write
            , Tuple "ADMIN" Admin
            , Tuple "NONE" None
            ]

instance orgUpdateDefaultRepositoryPermissionAuditEntryPermissionGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                                        OrgUpdateDefaultRepositoryPermissionAuditEntryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgUpdateDefaultRepositoryPermissionAuditEntryPermission"
                                        fromToMap

instance orgUpdateDefaultRepositoryPermissionAuditEntryPermissionToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                                           OrgUpdateDefaultRepositoryPermissionAuditEntryPermission where
  toGraphqlArgumentValue =
    case _ of
      Read -> ArgumentValueEnum "READ"
      Write -> ArgumentValueEnum "WRITE"
      Admin -> ArgumentValueEnum "ADMIN"
      None -> ArgumentValueEnum "NONE"
