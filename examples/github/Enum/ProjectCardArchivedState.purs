module Examples.Github.Enum.ProjectCardArchivedState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - ProjectCardArchivedState
data ProjectCardArchivedState
  = Archived
  | NotArchived

fromToMap :: Array (Tuple String ProjectCardArchivedState)
fromToMap = [Tuple "ARCHIVED" Archived, Tuple "NOT_ARCHIVED" NotArchived]

instance projectCardArchivedStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ProjectCardArchivedState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectCardArchivedState" fromToMap

instance projectCardArchivedStateToGraphqlArgumentValue :: ToGraphqlArgumentValue ProjectCardArchivedState where
  toGraphqlArgumentValue =
    case _ of
      Archived -> ArgumentValueString "ARCHIVED"
      NotArchived -> ArgumentValueString "NOT_ARCHIVED"
