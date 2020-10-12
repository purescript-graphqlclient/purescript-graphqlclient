module Examples.Github.Enum.CheckStatusState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - CheckStatusState
data CheckStatusState = Queued | InProgress | Completed | Requested

derive instance eqCheckStatusState :: Eq CheckStatusState

derive instance ordCheckStatusState :: Ord CheckStatusState

fromToMap :: Array (Tuple String CheckStatusState)
fromToMap = [ Tuple "QUEUED" Queued
            , Tuple "IN_PROGRESS" InProgress
            , Tuple "COMPLETED" Completed
            , Tuple "REQUESTED" Requested
            ]

instance checkStatusStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                CheckStatusState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "CheckStatusState" fromToMap

instance checkStatusStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                   CheckStatusState where
  toGraphQLArgumentValue =
    case _ of
      Queued -> ArgumentValueEnum "QUEUED"
      InProgress -> ArgumentValueEnum "IN_PROGRESS"
      Completed -> ArgumentValueEnum "COMPLETED"
      Requested -> ArgumentValueEnum "REQUESTED"
