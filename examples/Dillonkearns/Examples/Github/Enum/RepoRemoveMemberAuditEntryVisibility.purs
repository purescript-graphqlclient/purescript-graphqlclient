module Dillonkearns.Examples.Github.Enum.RepoRemoveMemberAuditEntryVisibility where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepoRemoveMemberAuditEntryVisibility
data RepoRemoveMemberAuditEntryVisibility = Internal | Private | Public

derive instance genericRepoRemoveMemberAuditEntryVisibility
  ::
  Generic RepoRemoveMemberAuditEntryVisibility _

instance showRepoRemoveMemberAuditEntryVisibility
  :: Show RepoRemoveMemberAuditEntryVisibility where
  show = genericShow

derive instance eqRepoRemoveMemberAuditEntryVisibility
  ::
  Eq RepoRemoveMemberAuditEntryVisibility

derive instance ordRepoRemoveMemberAuditEntryVisibility
  ::
  Ord RepoRemoveMemberAuditEntryVisibility

fromToMap :: Array (Tuple String RepoRemoveMemberAuditEntryVisibility)
fromToMap = [ Tuple "INTERNAL" Internal
            , Tuple "PRIVATE" Private
            , Tuple "PUBLIC" Public
            ]

instance repoRemoveMemberAuditEntryVisibilityGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder
     RepoRemoveMemberAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepoRemoveMemberAuditEntryVisibility"
                                        fromToMap

instance repoRemoveMemberAuditEntryVisibilityToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RepoRemoveMemberAuditEntryVisibility where
  toGraphQLArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
