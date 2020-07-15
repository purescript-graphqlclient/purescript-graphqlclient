module Examples.Github.Enum.DefaultRepositoryPermissionField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - DefaultRepositoryPermissionField
data DefaultRepositoryPermissionField
  = None
  | Read
  | Write
  | Admin

fromToMap :: Array (Tuple String DefaultRepositoryPermissionField)
fromToMap = [Tuple "NONE" None, Tuple "READ" Read, Tuple "WRITE" Write, Tuple "ADMIN" Admin]

instance defaultRepositoryPermissionFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder DefaultRepositoryPermissionField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "DefaultRepositoryPermissionField" fromToMap

instance defaultRepositoryPermissionFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue DefaultRepositoryPermissionField where
  toGraphqlArgumentValue =
    case _ of
      None -> ArgumentValueString "NONE"
      Read -> ArgumentValueString "READ"
      Write -> ArgumentValueString "WRITE"
      Admin -> ArgumentValueString "ADMIN"
