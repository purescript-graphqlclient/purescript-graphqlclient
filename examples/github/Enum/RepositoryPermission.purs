module Examples.Github.Enum.RepositoryPermission where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - RepositoryPermission
data RepositoryPermission
  = Admin
  | Maintain
  | Write
  | Triage
  | Read

fromToMap :: Array (Tuple String RepositoryPermission)
fromToMap = [Tuple "ADMIN" Admin, Tuple "MAINTAIN" Maintain, Tuple "WRITE" Write, Tuple "TRIAGE" Triage, Tuple "READ" Read]

instance repositoryPermissionGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepositoryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepositoryPermission" fromToMap

instance repositoryPermissionToGraphqlArgumentValue :: ToGraphqlArgumentValue RepositoryPermission where
  toGraphqlArgumentValue =
    case _ of
      Admin -> ArgumentValueString "ADMIN"
      Maintain -> ArgumentValueString "MAINTAIN"
      Write -> ArgumentValueString "WRITE"
      Triage -> ArgumentValueString "TRIAGE"
      Read -> ArgumentValueString "READ"
