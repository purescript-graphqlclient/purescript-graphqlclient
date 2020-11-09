module Examples.Github.Enum.RepoArchivedAuditEntryVisibility where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepoArchivedAuditEntryVisibility
data RepoArchivedAuditEntryVisibility = Internal | Private | Public

derive instance genericRepoArchivedAuditEntryVisibility :: Generic RepoArchivedAuditEntryVisibility _

instance showRepoArchivedAuditEntryVisibility :: Show
                                                 RepoArchivedAuditEntryVisibility where
  show = genericShow

derive instance eqRepoArchivedAuditEntryVisibility :: Eq RepoArchivedAuditEntryVisibility

derive instance ordRepoArchivedAuditEntryVisibility :: Ord RepoArchivedAuditEntryVisibility

fromToMap :: Array (Tuple String RepoArchivedAuditEntryVisibility)
fromToMap = [ Tuple "INTERNAL" Internal
            , Tuple "PRIVATE" Private
            , Tuple "PUBLIC" Public
            ]

instance repoArchivedAuditEntryVisibilityGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                RepoArchivedAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepoArchivedAuditEntryVisibility"
                                        fromToMap

instance repoArchivedAuditEntryVisibilityToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                   RepoArchivedAuditEntryVisibility where
  toGraphQLArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
