module Examples.Github.Enum.RepositoryAffiliation where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepositoryAffiliation
data RepositoryAffiliation
  = Owner
  | Collaborator
  | OrganizationMember

fromToMap :: Array (Tuple String RepositoryAffiliation)
fromToMap = [Tuple "OWNER" Owner, Tuple "COLLABORATOR" Collaborator, Tuple "ORGANIZATION_MEMBER" OrganizationMember]

instance repositoryAffiliationGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepositoryAffiliation where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepositoryAffiliation" fromToMap

instance repositoryAffiliationToGraphqlArgumentValue :: ToGraphqlArgumentValue RepositoryAffiliation where
  toGraphqlArgumentValue =
    case _ of
      Owner -> ArgumentValueString "OWNER"
      Collaborator -> ArgumentValueString "COLLABORATOR"
      OrganizationMember -> ArgumentValueString "ORGANIZATION_MEMBER"
