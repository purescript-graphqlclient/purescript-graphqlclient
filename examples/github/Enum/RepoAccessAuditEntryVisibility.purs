module Examples.Github.Enum.RepoAccessAuditEntryVisibility where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
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

instance repoAccessAuditEntryVisibilityGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                              RepoAccessAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepoAccessAuditEntryVisibility"
                                        fromToMap

instance repoAccessAuditEntryVisibilityToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                 RepoAccessAuditEntryVisibility where
  toGraphQLArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
