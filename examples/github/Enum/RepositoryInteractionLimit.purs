module Examples.Github.Enum.RepositoryInteractionLimit where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepositoryInteractionLimit
data RepositoryInteractionLimit
  = ExistingUsers
  | ContributorsOnly
  | CollaboratorsOnly
  | NoLimit

derive instance genericRepositoryInteractionLimit
  ::
  Generic RepositoryInteractionLimit _

instance showRepositoryInteractionLimit :: Show RepositoryInteractionLimit where
  show = genericShow

derive instance eqRepositoryInteractionLimit :: Eq RepositoryInteractionLimit

derive instance ordRepositoryInteractionLimit :: Ord RepositoryInteractionLimit

fromToMap :: Array (Tuple String RepositoryInteractionLimit)
fromToMap = [ Tuple "EXISTING_USERS" ExistingUsers
            , Tuple "CONTRIBUTORS_ONLY" ContributorsOnly
            , Tuple "COLLABORATORS_ONLY" CollaboratorsOnly
            , Tuple "NO_LIMIT" NoLimit
            ]

instance repositoryInteractionLimitGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RepositoryInteractionLimit where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryInteractionLimit"
                                        fromToMap

instance repositoryInteractionLimitToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RepositoryInteractionLimit where
  toGraphQLArgumentValue =
    case _ of
      ExistingUsers -> ArgumentValueEnum "EXISTING_USERS"
      ContributorsOnly -> ArgumentValueEnum "CONTRIBUTORS_ONLY"
      CollaboratorsOnly -> ArgumentValueEnum "COLLABORATORS_ONLY"
      NoLimit -> ArgumentValueEnum "NO_LIMIT"
