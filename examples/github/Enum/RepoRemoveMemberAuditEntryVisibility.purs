module Examples.Github.Enum.RepoRemoveMemberAuditEntryVisibility where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepoRemoveMemberAuditEntryVisibility
data RepoRemoveMemberAuditEntryVisibility
  = Internal
  | Private
  | Public

fromToMap :: Array (Tuple String RepoRemoveMemberAuditEntryVisibility)
fromToMap = [Tuple "INTERNAL" Internal, Tuple "PRIVATE" Private, Tuple "PUBLIC" Public]

instance repoRemoveMemberAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepoRemoveMemberAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepoRemoveMemberAuditEntryVisibility" fromToMap

instance repoRemoveMemberAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue RepoRemoveMemberAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      Internal -> ArgumentValueString "INTERNAL"
      Private -> ArgumentValueString "PRIVATE"
      Public -> ArgumentValueString "PUBLIC"
