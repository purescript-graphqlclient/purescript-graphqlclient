module Examples.Github.Enum.GistOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
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

derive instance genericGistOrderField :: Generic GistOrderField _

instance showGistOrderField :: Show GistOrderField where
  show = genericShow

derive instance eqGistOrderField :: Eq GistOrderField

derive instance ordGistOrderField :: Ord GistOrderField

fromToMap :: Array (Tuple String GistOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt
            , Tuple "UPDATED_AT" UpdatedAt
            , Tuple "PUSHED_AT" PushedAt
            ]

instance gistOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder GistOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "GistOrderField" fromToMap

instance gistOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue GistOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      PushedAt -> ArgumentValueEnum "PUSHED_AT"
