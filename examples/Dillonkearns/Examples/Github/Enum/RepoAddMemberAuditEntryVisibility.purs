module Dillonkearns.Examples.Github.Enum.RepoAddMemberAuditEntryVisibility where

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

-- | original name - RepoAddMemberAuditEntryVisibility
data RepoAddMemberAuditEntryVisibility = Internal | Private | Public

derive instance genericRepoAddMemberAuditEntryVisibility
  ::
  Generic RepoAddMemberAuditEntryVisibility _

instance showRepoAddMemberAuditEntryVisibility
  :: Show RepoAddMemberAuditEntryVisibility where
  show = genericShow

derive instance eqRepoAddMemberAuditEntryVisibility
  ::
  Eq RepoAddMemberAuditEntryVisibility

derive instance ordRepoAddMemberAuditEntryVisibility
  ::
  Ord RepoAddMemberAuditEntryVisibility

fromToMap :: Array (Tuple String RepoAddMemberAuditEntryVisibility)
fromToMap = [ Tuple "INTERNAL" Internal
            , Tuple "PRIVATE" Private
            , Tuple "PUBLIC" Public
            ]

instance repoAddMemberAuditEntryVisibilityGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RepoAddMemberAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepoAddMemberAuditEntryVisibility"
                                        fromToMap

instance repoAddMemberAuditEntryVisibilityToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RepoAddMemberAuditEntryVisibility where
  toGraphQLArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
