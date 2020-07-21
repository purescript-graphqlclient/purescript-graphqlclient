module Examples.Github.Enum.RepositoryVisibility where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepositoryVisibility
data RepositoryVisibility
  = Private
  | Public
  | Internal

fromToMap :: Array (Tuple String RepositoryVisibility)
fromToMap = [Tuple "PRIVATE" Private, Tuple "PUBLIC" Public, Tuple "INTERNAL" Internal]

instance repositoryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepositoryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepositoryVisibility" fromToMap

instance repositoryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue RepositoryVisibility where
  toGraphqlArgumentValue =
    case _ of
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
      Internal -> ArgumentValueEnum "INTERNAL"
