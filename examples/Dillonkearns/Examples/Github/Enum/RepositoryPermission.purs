module Dillonkearns.Examples.Github.Enum.RepositoryPermission where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepositoryPermission
data RepositoryPermission = Admin | Maintain | Write | Triage | Read

derive instance genericRepositoryPermission :: Generic RepositoryPermission _

instance showRepositoryPermission :: Show RepositoryPermission where
  show = genericShow

derive instance eqRepositoryPermission :: Eq RepositoryPermission

derive instance ordRepositoryPermission :: Ord RepositoryPermission

fromToMap :: Array (Tuple String RepositoryPermission)
fromToMap = [ Tuple "ADMIN" Admin
            , Tuple "MAINTAIN" Maintain
            , Tuple "WRITE" Write
            , Tuple "TRIAGE" Triage
            , Tuple "READ" Read
            ]

instance repositoryPermissionGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RepositoryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryPermission"
                                        fromToMap

instance repositoryPermissionToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RepositoryPermission where
  toGraphQLArgumentValue =
    case _ of
      Admin -> ArgumentValueEnum "ADMIN"
      Maintain -> ArgumentValueEnum "MAINTAIN"
      Write -> ArgumentValueEnum "WRITE"
      Triage -> ArgumentValueEnum "TRIAGE"
      Read -> ArgumentValueEnum "READ"
