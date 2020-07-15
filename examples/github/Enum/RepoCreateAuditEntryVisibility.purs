module Examples.Github.Enum.RepoCreateAuditEntryVisibility where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepoCreateAuditEntryVisibility
data RepoCreateAuditEntryVisibility
  = Internal
  | Private
  | Public

fromToMap :: Array (Tuple String RepoCreateAuditEntryVisibility)
fromToMap = [Tuple "INTERNAL" Internal, Tuple "PRIVATE" Private, Tuple "PUBLIC" Public]

instance repoCreateAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepoCreateAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepoCreateAuditEntryVisibility" fromToMap

instance repoCreateAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue RepoCreateAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      Internal -> ArgumentValueString "INTERNAL"
      Private -> ArgumentValueString "PRIVATE"
      Public -> ArgumentValueString "PUBLIC"
