module Examples.Github.Enum.TeamMemberOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - TeamMemberOrderField
data TeamMemberOrderField
  = Login
  | CreatedAt

fromToMap :: Array (Tuple String TeamMemberOrderField)
fromToMap = [Tuple "LOGIN" Login, Tuple "CREATED_AT" CreatedAt]

instance teamMemberOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder TeamMemberOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamMemberOrderField" fromToMap

instance teamMemberOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue TeamMemberOrderField where
  toGraphqlArgumentValue =
    case _ of
      Login -> ArgumentValueEnum "LOGIN"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
