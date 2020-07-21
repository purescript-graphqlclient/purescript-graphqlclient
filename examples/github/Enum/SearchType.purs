module Examples.Github.Enum.SearchType where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SearchType
data SearchType
  = Issue
  | Repository
  | User

fromToMap :: Array (Tuple String SearchType)
fromToMap = [Tuple "ISSUE" Issue, Tuple "REPOSITORY" Repository, Tuple "USER" User]

instance searchTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SearchType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SearchType" fromToMap

instance searchTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue SearchType where
  toGraphqlArgumentValue =
    case _ of
      Issue -> ArgumentValueEnum "ISSUE"
      Repository -> ArgumentValueEnum "REPOSITORY"
      User -> ArgumentValueEnum "USER"
