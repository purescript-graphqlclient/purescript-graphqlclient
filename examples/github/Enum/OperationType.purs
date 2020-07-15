module Examples.Github.Enum.OperationType where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OperationType
data OperationType
  = Access
  | Authentication
  | Create
  | Modify
  | Remove
  | Restore
  | Transfer

fromToMap :: Array (Tuple String OperationType)
fromToMap = [Tuple "ACCESS" Access, Tuple "AUTHENTICATION" Authentication, Tuple "CREATE" Create, Tuple "MODIFY" Modify, Tuple "REMOVE" Remove, Tuple "RESTORE" Restore, Tuple "TRANSFER" Transfer]

instance operationTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OperationType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OperationType" fromToMap

instance operationTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue OperationType where
  toGraphqlArgumentValue =
    case _ of
      Access -> ArgumentValueString "ACCESS"
      Authentication -> ArgumentValueString "AUTHENTICATION"
      Create -> ArgumentValueString "CREATE"
      Modify -> ArgumentValueString "MODIFY"
      Remove -> ArgumentValueString "REMOVE"
      Restore -> ArgumentValueString "RESTORE"
      Transfer -> ArgumentValueString "TRANSFER"
