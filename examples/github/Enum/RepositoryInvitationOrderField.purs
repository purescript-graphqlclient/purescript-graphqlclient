module Examples.Github.Enum.RepositoryInvitationOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepositoryInvitationOrderField
data RepositoryInvitationOrderField = CreatedAt | InviteeLogin

derive instance eqRepositoryInvitationOrderField :: Eq RepositoryInvitationOrderField

derive instance ordRepositoryInvitationOrderField :: Ord RepositoryInvitationOrderField

fromToMap :: Array (Tuple String RepositoryInvitationOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt, Tuple "INVITEE_LOGIN" InviteeLogin ]

instance repositoryInvitationOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                              RepositoryInvitationOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryInvitationOrderField"
                                        fromToMap

instance repositoryInvitationOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                 RepositoryInvitationOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      InviteeLogin -> ArgumentValueEnum "INVITEE_LOGIN"
