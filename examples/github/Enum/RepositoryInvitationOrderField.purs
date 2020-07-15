module Examples.Github.Enum.RepositoryInvitationOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepositoryInvitationOrderField
data RepositoryInvitationOrderField
  = CreatedAt
  | InviteeLogin

fromToMap :: Array (Tuple String RepositoryInvitationOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt, Tuple "INVITEE_LOGIN" InviteeLogin]

instance repositoryInvitationOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepositoryInvitationOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepositoryInvitationOrderField" fromToMap

instance repositoryInvitationOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue RepositoryInvitationOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueString "CREATED_AT"
      InviteeLogin -> ArgumentValueString "INVITEE_LOGIN"
