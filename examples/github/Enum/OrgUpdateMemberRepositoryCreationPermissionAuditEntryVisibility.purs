module Examples.Github.Enum.OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
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

instance orgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                                               OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility"
                                        fromToMap

instance orgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                                                  OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      All -> ArgumentValueEnum "ALL"
      Public -> ArgumentValueEnum "PUBLIC"
      None -> ArgumentValueEnum "NONE"
      Private -> ArgumentValueEnum "PRIVATE"
      Internal -> ArgumentValueEnum "INTERNAL"
      PublicInternal -> ArgumentValueEnum "PUBLIC_INTERNAL"
      PrivateInternal -> ArgumentValueEnum "PRIVATE_INTERNAL"
      PublicPrivate -> ArgumentValueEnum "PUBLIC_PRIVATE"
