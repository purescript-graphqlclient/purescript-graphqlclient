module Dillonkearns.Examples.Github.Enum.RequestableCheckStatusState where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RequestableCheckStatusState
data RequestableCheckStatusState = Queued | InProgress | Completed | Waiting

derive instance genericRequestableCheckStatusState
  ::
  Generic RequestableCheckStatusState _

instance showRequestableCheckStatusState
  :: Show RequestableCheckStatusState where
  show = genericShow

derive instance eqRequestableCheckStatusState :: Eq RequestableCheckStatusState

derive instance ordRequestableCheckStatusState
  ::
  Ord RequestableCheckStatusState

fromToMap :: Array (Tuple String RequestableCheckStatusState)
fromToMap = [ Tuple "QUEUED" Queued
            , Tuple "IN_PROGRESS" InProgress
            , Tuple "COMPLETED" Completed
            , Tuple "WAITING" Waiting
            ]

instance requestableCheckStatusStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RequestableCheckStatusState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RequestableCheckStatusState"
                                        fromToMap

instance requestableCheckStatusStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RequestableCheckStatusState where
  toGraphQLArgumentValue =
    case _ of
      Queued -> ArgumentValueEnum "QUEUED"
      InProgress -> ArgumentValueEnum "IN_PROGRESS"
      Completed -> ArgumentValueEnum "COMPLETED"
      Waiting -> ArgumentValueEnum "WAITING"
