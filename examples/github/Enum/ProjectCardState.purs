module Examples.Github.Enum.ProjectCardState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - ProjectCardState
data ProjectCardState
  = ContentOnly
  | NoteOnly
  | Redacted

fromToMap :: Array (Tuple String ProjectCardState)
fromToMap = [Tuple "CONTENT_ONLY" ContentOnly, Tuple "NOTE_ONLY" NoteOnly, Tuple "REDACTED" Redacted]

instance projectCardStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ProjectCardState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectCardState" fromToMap

instance projectCardStateToGraphqlArgumentValue :: ToGraphqlArgumentValue ProjectCardState where
  toGraphqlArgumentValue =
    case _ of
      ContentOnly -> ArgumentValueString "CONTENT_ONLY"
      NoteOnly -> ArgumentValueString "NOTE_ONLY"
      Redacted -> ArgumentValueString "REDACTED"
