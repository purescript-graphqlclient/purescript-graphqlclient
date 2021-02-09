module Dillonkearns.Examples.Github.Enum.OrgAddMemberAuditEntryPermission where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgAddMemberAuditEntryPermission
data OrgAddMemberAuditEntryPermission = Read | Admin

derive instance genericOrgAddMemberAuditEntryPermission
  ::
  Generic OrgAddMemberAuditEntryPermission _

instance showOrgAddMemberAuditEntryPermission
  :: Show OrgAddMemberAuditEntryPermission where
  show = genericShow

derive instance eqOrgAddMemberAuditEntryPermission
  ::
  Eq OrgAddMemberAuditEntryPermission

derive instance ordOrgAddMemberAuditEntryPermission
  ::
  Ord OrgAddMemberAuditEntryPermission

fromToMap :: Array (Tuple String OrgAddMemberAuditEntryPermission)
fromToMap = [ Tuple "READ" Read, Tuple "ADMIN" Admin ]

instance orgAddMemberAuditEntryPermissionGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder OrgAddMemberAuditEntryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgAddMemberAuditEntryPermission"
                                        fromToMap

instance orgAddMemberAuditEntryPermissionToGraphQLArgumentValue
  :: ToGraphQLArgumentValue OrgAddMemberAuditEntryPermission where
  toGraphQLArgumentValue =
    case _ of
      Read -> ArgumentValueEnum "READ"
      Admin -> ArgumentValueEnum "ADMIN"
