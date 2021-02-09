module Examples.Github.Enum.ReactionOrderField where

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

-- | original name - ReactionOrderField
data ReactionOrderField = CreatedAt

derive instance genericReactionOrderField :: Generic ReactionOrderField _

instance showReactionOrderField :: Show ReactionOrderField where
  show = genericShow

derive instance eqReactionOrderField :: Eq ReactionOrderField

derive instance ordReactionOrderField :: Ord ReactionOrderField

fromToMap :: Array (Tuple String ReactionOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance reactionOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder ReactionOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ReactionOrderField"
                                        fromToMap

instance reactionOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue ReactionOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
