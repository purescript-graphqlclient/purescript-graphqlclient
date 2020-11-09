module Examples.Github.Enum.RepoCreateAuditEntryVisibility where

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

-- | original name - RepoCreateAuditEntryVisibility
data RepoCreateAuditEntryVisibility = Internal | Private | Public

derive instance genericRepoCreateAuditEntryVisibility :: Generic RepoCreateAuditEntryVisibility _

instance showRepoCreateAuditEntryVisibility :: Show
                                               RepoCreateAuditEntryVisibility where
  show = genericShow

derive instance eqRepoCreateAuditEntryVisibility :: Eq RepoCreateAuditEntryVisibility

derive instance ordRepoCreateAuditEntryVisibility :: Ord RepoCreateAuditEntryVisibility

fromToMap :: Array (Tuple String RepoCreateAuditEntryVisibility)
fromToMap = [ Tuple "INTERNAL" Internal
            , Tuple "PRIVATE" Private
            , Tuple "PUBLIC" Public
            ]

instance repoCreateAuditEntryVisibilityGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                              RepoCreateAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepoCreateAuditEntryVisibility"
                                        fromToMap

instance repoCreateAuditEntryVisibilityToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                 RepoCreateAuditEntryVisibility where
  toGraphQLArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
