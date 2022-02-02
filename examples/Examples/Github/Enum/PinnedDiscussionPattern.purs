module Examples.Github.Enum.PinnedDiscussionPattern where

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

-- | original name - PinnedDiscussionPattern
data PinnedDiscussionPattern
  = DotFill
  | Plus
  | Zap
  | ChevronUp
  | Dot
  | HeartFill

derive instance genericPinnedDiscussionPattern
  ::
  Generic PinnedDiscussionPattern _

instance showPinnedDiscussionPattern :: Show PinnedDiscussionPattern where
  show = genericShow

derive instance eqPinnedDiscussionPattern :: Eq PinnedDiscussionPattern

derive instance ordPinnedDiscussionPattern :: Ord PinnedDiscussionPattern

fromToMap :: Array (Tuple String PinnedDiscussionPattern)
fromToMap = [ Tuple "DOT_FILL" DotFill
            , Tuple "PLUS" Plus
            , Tuple "ZAP" Zap
            , Tuple "CHEVRON_UP" ChevronUp
            , Tuple "DOT" Dot
            , Tuple "HEART_FILL" HeartFill
            ]

instance pinnedDiscussionPatternGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder PinnedDiscussionPattern where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PinnedDiscussionPattern"
                                        fromToMap

instance pinnedDiscussionPatternToGraphQLArgumentValue
  :: ToGraphQLArgumentValue PinnedDiscussionPattern where
  toGraphQLArgumentValue =
    case _ of
      DotFill -> ArgumentValueEnum "DOT_FILL"
      Plus -> ArgumentValueEnum "PLUS"
      Zap -> ArgumentValueEnum "ZAP"
      ChevronUp -> ArgumentValueEnum "CHEVRON_UP"
      Dot -> ArgumentValueEnum "DOT"
      HeartFill -> ArgumentValueEnum "HEART_FILL"
