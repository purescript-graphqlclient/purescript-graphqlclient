module Examples.Github.Enum.OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

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

derive instance eqOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility :: Eq OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility

derive instance ordOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility :: Ord OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility

fromToMap :: Array
             (Tuple
              String
              OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility)
fromToMap = [ Tuple "ALL" All
            , Tuple "PUBLIC" Public
            , Tuple "NONE" None
            , Tuple "PRIVATE" Private
            , Tuple "INTERNAL" Internal
            , Tuple "PUBLIC_INTERNAL" PublicInternal
            , Tuple "PRIVATE_INTERNAL" PrivateInternal
            , Tuple "PUBLIC_PRIVATE" PublicPrivate
            ]

instance orgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                                               OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility"
                                        fromToMap

instance orgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                                                  OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where
  toGraphQLArgumentValue =
    case _ of
      All -> ArgumentValueEnum "ALL"
      Public -> ArgumentValueEnum "PUBLIC"
      None -> ArgumentValueEnum "NONE"
      Private -> ArgumentValueEnum "PRIVATE"
      Internal -> ArgumentValueEnum "INTERNAL"
      PublicInternal -> ArgumentValueEnum "PUBLIC_INTERNAL"
      PrivateInternal -> ArgumentValueEnum "PRIVATE_INTERNAL"
      PublicPrivate -> ArgumentValueEnum "PUBLIC_PRIVATE"
