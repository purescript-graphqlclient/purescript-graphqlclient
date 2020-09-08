module Examples.Github.Enum.RepositoryPermission where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepositoryPermission
data RepositoryPermission = Admin | Maintain | Write | Triage | Read

derive instance eqRepositoryPermission :: Eq RepositoryPermission

derive instance ordRepositoryPermission :: Ord RepositoryPermission

fromToMap :: Array (Tuple String RepositoryPermission)
fromToMap = [ Tuple "ADMIN" Admin
            , Tuple "MAINTAIN" Maintain
            , Tuple "WRITE" Write
            , Tuple "TRIAGE" Triage
            , Tuple "READ" Read
            ]

instance repositoryPermissionGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                    RepositoryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryPermission"
                                        fromToMap

instance repositoryPermissionToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                       RepositoryPermission where
  toGraphQLArgumentValue =
    case _ of
      Admin -> ArgumentValueEnum "ADMIN"
      Maintain -> ArgumentValueEnum "MAINTAIN"
      Write -> ArgumentValueEnum "WRITE"
      Triage -> ArgumentValueEnum "TRIAGE"
      Read -> ArgumentValueEnum "READ"
