module Examples.Github.Enum.RepositoryAffiliation where

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

-- | original name - RepositoryAffiliation
data RepositoryAffiliation = Owner | Collaborator | OrganizationMember

derive instance genericRepositoryAffiliation :: Generic RepositoryAffiliation _

instance showRepositoryAffiliation :: Show RepositoryAffiliation where
  show = genericShow

derive instance eqRepositoryAffiliation :: Eq RepositoryAffiliation

derive instance ordRepositoryAffiliation :: Ord RepositoryAffiliation

fromToMap :: Array (Tuple String RepositoryAffiliation)
fromToMap = [ Tuple "OWNER" Owner
            , Tuple "COLLABORATOR" Collaborator
            , Tuple "ORGANIZATION_MEMBER" OrganizationMember
            ]

instance repositoryAffiliationGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                     RepositoryAffiliation where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryAffiliation"
                                        fromToMap

instance repositoryAffiliationToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                        RepositoryAffiliation where
  toGraphQLArgumentValue =
    case _ of
      Owner -> ArgumentValueEnum "OWNER"
      Collaborator -> ArgumentValueEnum "COLLABORATOR"
      OrganizationMember -> ArgumentValueEnum "ORGANIZATION_MEMBER"
