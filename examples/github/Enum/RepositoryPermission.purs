module Examples.Github.Enum.RepositoryPermission where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      Admin -> ArgumentValueEnum "ADMIN"
      Maintain -> ArgumentValueEnum "MAINTAIN"
      Write -> ArgumentValueEnum "WRITE"
      Triage -> ArgumentValueEnum "TRIAGE"
      Read -> ArgumentValueEnum "READ"
