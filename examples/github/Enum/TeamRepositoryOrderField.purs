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
      CreatedAt -> ArgumentValueString "CREATED_AT"
      UpdatedAt -> ArgumentValueString "UPDATED_AT"
      PushedAt -> ArgumentValueString "PUSHED_AT"
      Name -> ArgumentValueString "NAME"
      Permission -> ArgumentValueString "PERMISSION"
      Stargazers -> ArgumentValueString "STARGAZERS"
