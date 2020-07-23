module Examples.Github.Enum.OrganizationInvitationType where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      User -> ArgumentValueEnum "USER"
      Email -> ArgumentValueEnum "EMAIL"
