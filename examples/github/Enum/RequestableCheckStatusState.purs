module Examples.Github.Enum.RequestableCheckStatusState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RequestableCheckStatusState
data RequestableCheckStatusState = Queued | InProgress | Completed

derive instance eqRequestableCheckStatusState :: Eq RequestableCheckStatusState

derive instance ordRequestableCheckStatusState :: Ord RequestableCheckStatusState

fromToMap :: Array (Tuple String RequestableCheckStatusState)
fromToMap = [ Tuple "QUEUED" Queued
            , Tuple "IN_PROGRESS" InProgress
            , Tuple "COMPLETED" Completed
            ]

instance requestableCheckStatusStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                           RequestableCheckStatusState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RequestableCheckStatusState"
                                        fromToMap

instance requestableCheckStatusStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                              RequestableCheckStatusState where
  toGraphQLArgumentValue =
    case _ of
      Queued -> ArgumentValueEnum "QUEUED"
      InProgress -> ArgumentValueEnum "IN_PROGRESS"
      Completed -> ArgumentValueEnum "COMPLETED"
