module Examples.Github.Enum.ProjectCardArchivedState where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ProjectCardArchivedState
data ProjectCardArchivedState = Archived | NotArchived

derive instance eqProjectCardArchivedState :: Eq ProjectCardArchivedState

derive instance ordProjectCardArchivedState :: Ord ProjectCardArchivedState

fromToMap :: Array (Tuple String ProjectCardArchivedState)
fromToMap = [ Tuple "ARCHIVED" Archived, Tuple "NOT_ARCHIVED" NotArchived ]

instance projectCardArchivedStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                        ProjectCardArchivedState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ProjectCardArchivedState"
                                        fromToMap

instance projectCardArchivedStateToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                           ProjectCardArchivedState where
  toGraphqlArgumentValue =
    case _ of
      Archived -> ArgumentValueEnum "ARCHIVED"
      NotArchived -> ArgumentValueEnum "NOT_ARCHIVED"
