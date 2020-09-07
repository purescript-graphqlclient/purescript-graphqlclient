module Examples.Github.Enum.StatusState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - StatusState
data StatusState = Expected | Error | Failure | Pending | Success

derive instance eqStatusState :: Eq StatusState

derive instance ordStatusState :: Ord StatusState

fromToMap :: Array (Tuple String StatusState)
fromToMap = [ Tuple "EXPECTED" Expected
            , Tuple "ERROR" Error
            , Tuple "FAILURE" Failure
            , Tuple "PENDING" Pending
            , Tuple "SUCCESS" Success
            ]

instance statusStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                           StatusState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "StatusState" fromToMap

instance statusStateToGraphQLArgumentValue :: ToGraphQLArgumentValue StatusState where
  toGraphQLArgumentValue =
    case _ of
      Expected -> ArgumentValueEnum "EXPECTED"
      Error -> ArgumentValueEnum "ERROR"
      Failure -> ArgumentValueEnum "FAILURE"
      Pending -> ArgumentValueEnum "PENDING"
      Success -> ArgumentValueEnum "SUCCESS"
