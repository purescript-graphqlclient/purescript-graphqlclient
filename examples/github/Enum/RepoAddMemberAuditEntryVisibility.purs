module Examples.Github.Enum.RepoAddMemberAuditEntryVisibility where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepoAddMemberAuditEntryVisibility
data RepoAddMemberAuditEntryVisibility = Internal | Private | Public

derive instance eqRepoAddMemberAuditEntryVisibility :: Eq RepoAddMemberAuditEntryVisibility

derive instance ordRepoAddMemberAuditEntryVisibility :: Ord RepoAddMemberAuditEntryVisibility

fromToMap :: Array (Tuple String RepoAddMemberAuditEntryVisibility)
fromToMap = [ Tuple "INTERNAL" Internal
            , Tuple "PRIVATE" Private
            , Tuple "PUBLIC" Public
            ]

instance repoAddMemberAuditEntryVisibilityGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                 RepoAddMemberAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepoAddMemberAuditEntryVisibility"
                                        fromToMap

instance repoAddMemberAuditEntryVisibilityToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                    RepoAddMemberAuditEntryVisibility where
  toGraphQLArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
