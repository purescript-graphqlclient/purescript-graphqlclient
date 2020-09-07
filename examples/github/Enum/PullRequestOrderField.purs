module Examples.Github.Enum.PullRequestOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PullRequestOrderField
data PullRequestOrderField = CreatedAt | UpdatedAt

derive instance eqPullRequestOrderField :: Eq PullRequestOrderField

derive instance ordPullRequestOrderField :: Ord PullRequestOrderField

fromToMap :: Array (Tuple String PullRequestOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt, Tuple "UPDATED_AT" UpdatedAt ]

instance pullRequestOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                     PullRequestOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PullRequestOrderField"
                                        fromToMap

instance pullRequestOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                        PullRequestOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
