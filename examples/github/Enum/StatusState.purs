module Examples.Github.Enum.StatusState where

import Prelude
import GraphqlClient
import Data.Tuple

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
      Expected -> ArgumentValueString "EXPECTED"
      Error -> ArgumentValueString "ERROR"
      Failure -> ArgumentValueString "FAILURE"
      Pending -> ArgumentValueString "PENDING"
      Success -> ArgumentValueString "SUCCESS"
