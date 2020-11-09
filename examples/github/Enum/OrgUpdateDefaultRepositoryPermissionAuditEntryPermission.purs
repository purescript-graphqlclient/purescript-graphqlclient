module Examples.Github.Enum.OrgUpdateDefaultRepositoryPermissionAuditEntryPermission where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgUpdateDefaultRepositoryPermissionAuditEntryPermission
data OrgUpdateDefaultRepositoryPermissionAuditEntryPermission
  = Read | Write | Admin | None

derive instance genericOrgUpdateDefaultRepositoryPermissionAuditEntryPermission :: Generic OrgUpdateDefaultRepositoryPermissionAuditEntryPermission _

instance showOrgUpdateDefaultRepositoryPermissionAuditEntryPermission :: Show
                                                                         OrgUpdateDefaultRepositoryPermissionAuditEntryPermission where
  show = genericShow

derive instance eqOrgUpdateDefaultRepositoryPermissionAuditEntryPermission :: Eq OrgUpdateDefaultRepositoryPermissionAuditEntryPermission

derive instance ordOrgUpdateDefaultRepositoryPermissionAuditEntryPermission :: Ord OrgUpdateDefaultRepositoryPermissionAuditEntryPermission

fromToMap :: Array
             (Tuple
              String
              OrgUpdateDefaultRepositoryPermissionAuditEntryPermission)
fromToMap = [ Tuple "READ" Read
            , Tuple "WRITE" Write
            , Tuple "ADMIN" Admin
            , Tuple "NONE" None
            ]

instance orgUpdateDefaultRepositoryPermissionAuditEntryPermissionGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                                        OrgUpdateDefaultRepositoryPermissionAuditEntryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgUpdateDefaultRepositoryPermissionAuditEntryPermission"
                                        fromToMap

instance orgUpdateDefaultRepositoryPermissionAuditEntryPermissionToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                                           OrgUpdateDefaultRepositoryPermissionAuditEntryPermission where
  toGraphQLArgumentValue =
    case _ of
      Read -> ArgumentValueEnum "READ"
      Write -> ArgumentValueEnum "WRITE"
      Admin -> ArgumentValueEnum "ADMIN"
      None -> ArgumentValueEnum "NONE"
