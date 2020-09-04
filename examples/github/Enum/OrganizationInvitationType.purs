module Examples.Github.Enum.OrganizationInvitationType where

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

-- | original name - OrganizationInvitationType
data OrganizationInvitationType
  = User
  | Email

derive instance eqOrganizationInvitationType :: Eq OrganizationInvitationType

derive instance ordOrganizationInvitationType :: Ord OrganizationInvitationType

fromToMap :: Array (Tuple String OrganizationInvitationType)
fromToMap = [Tuple "USER" User, Tuple "EMAIL" Email]

instance organizationInvitationTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrganizationInvitationType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrganizationInvitationType" fromToMap

instance organizationInvitationTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue OrganizationInvitationType where
  toGraphqlArgumentValue =
    case _ of
      User -> ArgumentValueEnum "USER"
      Email -> ArgumentValueEnum "EMAIL"
