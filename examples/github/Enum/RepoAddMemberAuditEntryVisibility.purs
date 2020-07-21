module Examples.Github.Enum.RepoAddMemberAuditEntryVisibility where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepoAddMemberAuditEntryVisibility
data RepoAddMemberAuditEntryVisibility
  = Internal
  | Private
  | Public

fromToMap :: Array (Tuple String RepoAddMemberAuditEntryVisibility)
fromToMap = [Tuple "INTERNAL" Internal, Tuple "PRIVATE" Private, Tuple "PUBLIC" Public]

instance repoAddMemberAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepoAddMemberAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepoAddMemberAuditEntryVisibility" fromToMap

instance repoAddMemberAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue RepoAddMemberAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
