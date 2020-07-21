module Examples.Github.Enum.OrganizationOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrganizationOrderField
data OrganizationOrderField
  = CreatedAt
  | Login

fromToMap :: Array (Tuple String OrganizationOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt, Tuple "LOGIN" Login]

instance organizationOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrganizationOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrganizationOrderField" fromToMap

instance organizationOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue OrganizationOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      Login -> ArgumentValueEnum "LOGIN"
