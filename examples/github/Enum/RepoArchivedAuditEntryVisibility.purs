module Examples.Github.Enum.RepoArchivedAuditEntryVisibility where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepoArchivedAuditEntryVisibility
data RepoArchivedAuditEntryVisibility
  = Internal
  | Private
  | Public

fromToMap :: Array (Tuple String RepoArchivedAuditEntryVisibility)
fromToMap = [Tuple "INTERNAL" Internal, Tuple "PRIVATE" Private, Tuple "PUBLIC" Public]

instance repoArchivedAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepoArchivedAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepoArchivedAuditEntryVisibility" fromToMap

instance repoArchivedAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue RepoArchivedAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
