module Examples.Github.Enum.GistOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - GistOrderField
data GistOrderField = CreatedAt | UpdatedAt | PushedAt

derive instance eqGistOrderField :: Eq GistOrderField

derive instance ordGistOrderField :: Ord GistOrderField

fromToMap :: Array (Tuple String GistOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt
            , Tuple "UPDATED_AT" UpdatedAt
            , Tuple "PUSHED_AT" PushedAt
            ]

instance gistOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                              GistOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "GistOrderField" fromToMap

instance gistOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                 GistOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      PushedAt -> ArgumentValueEnum "PUSHED_AT"
