module Examples.Github.Enum.StatusState where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - StatusState
data StatusState
  = Expected
  | Error
  | Failure
  | Pending
  | Success

fromToMap :: Array (Tuple String StatusState)
fromToMap = [Tuple "EXPECTED" Expected, Tuple "ERROR" Error, Tuple "FAILURE" Failure, Tuple "PENDING" Pending, Tuple "SUCCESS" Success]

instance statusStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder StatusState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "StatusState" fromToMap

instance statusStateToGraphqlArgumentValue :: ToGraphqlArgumentValue StatusState where
  toGraphqlArgumentValue =
    case _ of
      Expected -> ArgumentValueEnum "EXPECTED"
      Error -> ArgumentValueEnum "ERROR"
      Failure -> ArgumentValueEnum "FAILURE"
      Pending -> ArgumentValueEnum "PENDING"
      Success -> ArgumentValueEnum "SUCCESS"
