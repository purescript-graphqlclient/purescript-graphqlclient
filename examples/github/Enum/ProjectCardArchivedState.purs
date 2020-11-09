module Examples.Github.Enum.ProjectCardArchivedState where

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

-- | original name - ProjectCardArchivedState
data ProjectCardArchivedState = Archived | NotArchived

derive instance genericProjectCardArchivedState :: Generic ProjectCardArchivedState _

instance showProjectCardArchivedState :: Show ProjectCardArchivedState where
  show = genericShow

derive instance eqProjectCardArchivedState :: Eq ProjectCardArchivedState

derive instance ordProjectCardArchivedState :: Ord ProjectCardArchivedState

fromToMap :: Array (Tuple String ProjectCardArchivedState)
fromToMap = [ Tuple "ARCHIVED" Archived, Tuple "NOT_ARCHIVED" NotArchived ]

instance projectCardArchivedStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                        ProjectCardArchivedState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ProjectCardArchivedState"
                                        fromToMap

instance projectCardArchivedStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                           ProjectCardArchivedState where
  toGraphQLArgumentValue =
    case _ of
      Archived -> ArgumentValueEnum "ARCHIVED"
      NotArchived -> ArgumentValueEnum "NOT_ARCHIVED"
