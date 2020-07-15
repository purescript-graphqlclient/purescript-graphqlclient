module Examples.Github.Enum.OrganizationInvitationType where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrganizationInvitationType
data OrganizationInvitationType
  = User
  | Email

fromToMap :: Array (Tuple String OrganizationInvitationType)
fromToMap = [Tuple "USER" User, Tuple "EMAIL" Email]

instance organizationInvitationTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrganizationInvitationType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrganizationInvitationType" fromToMap

instance organizationInvitationTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue OrganizationInvitationType where
  toGraphqlArgumentValue =
    case _ of
      User -> ArgumentValueString "USER"
      Email -> ArgumentValueString "EMAIL"
