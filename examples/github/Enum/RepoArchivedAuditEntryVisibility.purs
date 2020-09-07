module Examples.Github.Enum.RepoArchivedAuditEntryVisibility where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepoArchivedAuditEntryVisibility
data RepoArchivedAuditEntryVisibility = Internal | Private | Public

derive instance eqRepoArchivedAuditEntryVisibility :: Eq RepoArchivedAuditEntryVisibility

derive instance ordRepoArchivedAuditEntryVisibility :: Ord RepoArchivedAuditEntryVisibility

fromToMap :: Array (Tuple String RepoArchivedAuditEntryVisibility)
fromToMap = [ Tuple "INTERNAL" Internal
            , Tuple "PRIVATE" Private
            , Tuple "PUBLIC" Public
            ]

instance repoArchivedAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                RepoArchivedAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepoArchivedAuditEntryVisibility"
                                        fromToMap

instance repoArchivedAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                   RepoArchivedAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
