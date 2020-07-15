module Examples.Github.Enum.RepositoryOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepositoryOrderField
data RepositoryOrderField
  = CreatedAt
  | UpdatedAt
  | PushedAt
  | Name
  | Stargazers

fromToMap :: Array (Tuple String RepositoryOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt, Tuple "UPDATED_AT" UpdatedAt, Tuple "PUSHED_AT" PushedAt, Tuple "NAME" Name, Tuple "STARGAZERS" Stargazers]

instance repositoryOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepositoryOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepositoryOrderField" fromToMap

instance repositoryOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue RepositoryOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueString "CREATED_AT"
      UpdatedAt -> ArgumentValueString "UPDATED_AT"
      PushedAt -> ArgumentValueString "PUSHED_AT"
      Name -> ArgumentValueString "NAME"
      Stargazers -> ArgumentValueString "STARGAZERS"
