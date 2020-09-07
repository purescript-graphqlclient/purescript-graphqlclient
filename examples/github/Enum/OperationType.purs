module Examples.Github.Enum.OperationType where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OperationType
data OperationType
  = Access | Authentication | Create | Modify | Remove | Restore | Transfer

derive instance eqOperationType :: Eq OperationType

derive instance ordOperationType :: Ord OperationType

fromToMap :: Array (Tuple String OperationType)
fromToMap = [ Tuple "ACCESS" Access
            , Tuple "AUTHENTICATION" Authentication
            , Tuple "CREATE" Create
            , Tuple "MODIFY" Modify
            , Tuple "REMOVE" Remove
            , Tuple "RESTORE" Restore
            , Tuple "TRANSFER" Transfer
            ]

instance operationTypeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                             OperationType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OperationType" fromToMap

instance operationTypeToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                OperationType where
  toGraphQLArgumentValue =
    case _ of
      Access -> ArgumentValueEnum "ACCESS"
      Authentication -> ArgumentValueEnum "AUTHENTICATION"
      Create -> ArgumentValueEnum "CREATE"
      Modify -> ArgumentValueEnum "MODIFY"
      Remove -> ArgumentValueEnum "REMOVE"
      Restore -> ArgumentValueEnum "RESTORE"
      Transfer -> ArgumentValueEnum "TRANSFER"
