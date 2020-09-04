module Examples.Github.Enum.ReactionContent where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ReactionContent
data ReactionContent
  = ThumbsUp
  | ThumbsDown
  | Laugh
  | Hooray
  | Confused
  | Heart
  | Rocket
  | Eyes

derive instance eqReactionContent :: Eq ReactionContent

derive instance ordReactionContent :: Ord ReactionContent

fromToMap :: Array (Tuple String ReactionContent)
fromToMap = [Tuple "THUMBS_UP" ThumbsUp, Tuple "THUMBS_DOWN" ThumbsDown, Tuple "LAUGH" Laugh, Tuple "HOORAY" Hooray, Tuple "CONFUSED" Confused, Tuple "HEART" Heart, Tuple "ROCKET" Rocket, Tuple "EYES" Eyes]

instance reactionContentGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ReactionContent where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ReactionContent" fromToMap

instance reactionContentToGraphqlArgumentValue :: ToGraphqlArgumentValue ReactionContent where
  toGraphqlArgumentValue =
    case _ of
      ThumbsUp -> ArgumentValueEnum "THUMBS_UP"
      ThumbsDown -> ArgumentValueEnum "THUMBS_DOWN"
      Laugh -> ArgumentValueEnum "LAUGH"
      Hooray -> ArgumentValueEnum "HOORAY"
      Confused -> ArgumentValueEnum "CONFUSED"
      Heart -> ArgumentValueEnum "HEART"
      Rocket -> ArgumentValueEnum "ROCKET"
      Eyes -> ArgumentValueEnum "EYES"
