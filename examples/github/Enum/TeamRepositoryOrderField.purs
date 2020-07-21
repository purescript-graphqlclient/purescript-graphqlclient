module Examples.Github.Enum.TeamRepositoryOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - TeamRepositoryOrderField
data TeamRepositoryOrderField
  = CreatedAt
  | UpdatedAt
  | PushedAt
  | Name
  | Permission
  | Stargazers

fromToMap :: Array (Tuple String TeamRepositoryOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt, Tuple "UPDATED_AT" UpdatedAt, Tuple "PUSHED_AT" PushedAt, Tuple "NAME" Name, Tuple "PERMISSION" Permission, Tuple "STARGAZERS" Stargazers]

instance teamRepositoryOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder TeamRepositoryOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamRepositoryOrderField" fromToMap

instance teamRepositoryOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue TeamRepositoryOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      PushedAt -> ArgumentValueEnum "PUSHED_AT"
      Name -> ArgumentValueEnum "NAME"
      Permission -> ArgumentValueEnum "PERMISSION"
      Stargazers -> ArgumentValueEnum "STARGAZERS"
