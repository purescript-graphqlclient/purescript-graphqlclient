module Examples.Github.Enum.ProjectCardState where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      ContentOnly -> ArgumentValueEnum "CONTENT_ONLY"
      NoteOnly -> ArgumentValueEnum "NOTE_ONLY"
      Redacted -> ArgumentValueEnum "REDACTED"
