module Examples.Github.Enum.RepositoryVisibility where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
