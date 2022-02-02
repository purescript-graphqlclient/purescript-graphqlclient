module Examples.Github.Enum.PinnedDiscussionGradient where

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

-- | original name - PinnedDiscussionGradient
data PinnedDiscussionGradient
  = RedOrange
  | BlueMint
  | BluePurple
  | PinkBlue
  | PurpleCoral

derive instance genericPinnedDiscussionGradient
  ::
  Generic PinnedDiscussionGradient _

instance showPinnedDiscussionGradient :: Show PinnedDiscussionGradient where
  show = genericShow

derive instance eqPinnedDiscussionGradient :: Eq PinnedDiscussionGradient

derive instance ordPinnedDiscussionGradient :: Ord PinnedDiscussionGradient

fromToMap :: Array (Tuple String PinnedDiscussionGradient)
fromToMap = [ Tuple "RED_ORANGE" RedOrange
            , Tuple "BLUE_MINT" BlueMint
            , Tuple "BLUE_PURPLE" BluePurple
            , Tuple "PINK_BLUE" PinkBlue
            , Tuple "PURPLE_CORAL" PurpleCoral
            ]

instance pinnedDiscussionGradientGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder PinnedDiscussionGradient where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "PinnedDiscussionGradient"
                                        fromToMap

instance pinnedDiscussionGradientToGraphQLArgumentValue
  :: ToGraphQLArgumentValue PinnedDiscussionGradient where
  toGraphQLArgumentValue =
    case _ of
      RedOrange -> ArgumentValueEnum "RED_ORANGE"
      BlueMint -> ArgumentValueEnum "BLUE_MINT"
      BluePurple -> ArgumentValueEnum "BLUE_PURPLE"
      PinkBlue -> ArgumentValueEnum "PINK_BLUE"
      PurpleCoral -> ArgumentValueEnum "PURPLE_CORAL"
