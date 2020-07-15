module Examples.Github.Enum.ReactionContent where

import Prelude
import GraphqlClient
import Data.Tuple

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

fromToMap :: Array (Tuple String ReactionContent)
fromToMap = [Tuple "THUMBS_UP" ThumbsUp, Tuple "THUMBS_DOWN" ThumbsDown, Tuple "LAUGH" Laugh, Tuple "HOORAY" Hooray, Tuple "CONFUSED" Confused, Tuple "HEART" Heart, Tuple "ROCKET" Rocket, Tuple "EYES" Eyes]

instance reactionContentGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ReactionContent where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ReactionContent" fromToMap

instance reactionContentToGraphqlArgumentValue :: ToGraphqlArgumentValue ReactionContent where
  toGraphqlArgumentValue =
    case _ of
      ThumbsUp -> ArgumentValueString "THUMBS_UP"
      ThumbsDown -> ArgumentValueString "THUMBS_DOWN"
      Laugh -> ArgumentValueString "LAUGH"
      Hooray -> ArgumentValueString "HOORAY"
      Confused -> ArgumentValueString "CONFUSED"
      Heart -> ArgumentValueString "HEART"
      Rocket -> ArgumentValueString "ROCKET"
      Eyes -> ArgumentValueString "EYES"
