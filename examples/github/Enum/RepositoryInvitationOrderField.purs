module Examples.Github.Enum.RepositoryInvitationOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      InviteeLogin -> ArgumentValueEnum "INVITEE_LOGIN"
