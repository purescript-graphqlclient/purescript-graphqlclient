module Examples.Github.Enum.RepositoryAffiliation where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepositoryAffiliation
data RepositoryAffiliation
  = Owner
  | Collaborator
  | OrganizationMember

derive instance eqRepositoryAffiliation :: Eq RepositoryAffiliation

derive instance ordRepositoryAffiliation :: Ord RepositoryAffiliation

fromToMap :: Array (Tuple String RepositoryAffiliation)
fromToMap = [Tuple "OWNER" Owner, Tuple "COLLABORATOR" Collaborator, Tuple "ORGANIZATION_MEMBER" OrganizationMember]

instance repositoryAffiliationGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepositoryAffiliation where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepositoryAffiliation" fromToMap

instance repositoryAffiliationToGraphqlArgumentValue :: ToGraphqlArgumentValue RepositoryAffiliation where
  toGraphqlArgumentValue =
    case _ of
      Owner -> ArgumentValueEnum "OWNER"
      Collaborator -> ArgumentValueEnum "COLLABORATOR"
      OrganizationMember -> ArgumentValueEnum "ORGANIZATION_MEMBER"
