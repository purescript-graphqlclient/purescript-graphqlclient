module Examples.Github.Enum.OrganizationInvitationType where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrganizationInvitationType
data OrganizationInvitationType = User | Email

derive instance eqOrganizationInvitationType :: Eq OrganizationInvitationType

derive instance ordOrganizationInvitationType :: Ord OrganizationInvitationType

fromToMap :: Array (Tuple String OrganizationInvitationType)
fromToMap = [ Tuple "USER" User, Tuple "EMAIL" Email ]

instance organizationInvitationTypeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                          OrganizationInvitationType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrganizationInvitationType"
                                        fromToMap

instance organizationInvitationTypeToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                             OrganizationInvitationType where
  toGraphQLArgumentValue =
    case _ of
      User -> ArgumentValueEnum "USER"
      Email -> ArgumentValueEnum "EMAIL"
