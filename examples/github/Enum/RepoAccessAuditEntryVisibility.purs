module Examples.Github.Enum.RepoAccessAuditEntryVisibility where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepoAccessAuditEntryVisibility
data RepoAccessAuditEntryVisibility = Internal | Private | Public

derive instance eqRepoAccessAuditEntryVisibility :: Eq RepoAccessAuditEntryVisibility

derive instance ordRepoAccessAuditEntryVisibility :: Ord RepoAccessAuditEntryVisibility

fromToMap :: Array (Tuple String RepoAccessAuditEntryVisibility)
fromToMap = [ Tuple "INTERNAL" Internal
            , Tuple "PRIVATE" Private
            , Tuple "PUBLIC" Public
            ]

instance repoAccessAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                              RepoAccessAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepoAccessAuditEntryVisibility"
                                        fromToMap

instance repoAccessAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                 RepoAccessAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
