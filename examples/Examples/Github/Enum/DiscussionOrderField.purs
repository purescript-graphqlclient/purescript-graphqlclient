module Examples.Github.Enum.DiscussionOrderField where

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

-- | original name - DiscussionOrderField
data DiscussionOrderField = CreatedAt | UpdatedAt

derive instance genericDiscussionOrderField :: Generic DiscussionOrderField _

instance showDiscussionOrderField :: Show DiscussionOrderField where
  show = genericShow

derive instance eqDiscussionOrderField :: Eq DiscussionOrderField

derive instance ordDiscussionOrderField :: Ord DiscussionOrderField

fromToMap :: Array (Tuple String DiscussionOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt, Tuple "UPDATED_AT" UpdatedAt ]

instance discussionOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder DiscussionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "DiscussionOrderField"
                                        fromToMap

instance discussionOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue DiscussionOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
