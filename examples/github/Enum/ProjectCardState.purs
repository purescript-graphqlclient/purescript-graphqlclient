module Examples.Github.Enum.ProjectCardState where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ProjectCardState
data ProjectCardState = ContentOnly | NoteOnly | Redacted

derive instance genericProjectCardState :: Generic ProjectCardState _

instance showProjectCardState :: Show ProjectCardState where
  show = genericShow

derive instance eqProjectCardState :: Eq ProjectCardState

derive instance ordProjectCardState :: Ord ProjectCardState

fromToMap :: Array (Tuple String ProjectCardState)
fromToMap = [ Tuple "CONTENT_ONLY" ContentOnly
            , Tuple "NOTE_ONLY" NoteOnly
            , Tuple "REDACTED" Redacted
            ]

instance projectCardStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                ProjectCardState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectCardState" fromToMap

instance projectCardStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                   ProjectCardState where
  toGraphQLArgumentValue =
    case _ of
      ContentOnly -> ArgumentValueEnum "CONTENT_ONLY"
      NoteOnly -> ArgumentValueEnum "NOTE_ONLY"
      Redacted -> ArgumentValueEnum "REDACTED"
