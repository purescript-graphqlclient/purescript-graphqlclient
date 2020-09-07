module Examples.Github.Enum.RepoRemoveMemberAuditEntryVisibility where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepoRemoveMemberAuditEntryVisibility
data RepoRemoveMemberAuditEntryVisibility = Internal | Private | Public

derive instance eqRepoRemoveMemberAuditEntryVisibility :: Eq RepoRemoveMemberAuditEntryVisibility

derive instance ordRepoRemoveMemberAuditEntryVisibility :: Ord RepoRemoveMemberAuditEntryVisibility

fromToMap :: Array (Tuple String RepoRemoveMemberAuditEntryVisibility)
fromToMap = [ Tuple "INTERNAL" Internal
            , Tuple "PRIVATE" Private
            , Tuple "PUBLIC" Public
            ]

instance repoRemoveMemberAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                    RepoRemoveMemberAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepoRemoveMemberAuditEntryVisibility"
                                        fromToMap

instance repoRemoveMemberAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                       RepoRemoveMemberAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
