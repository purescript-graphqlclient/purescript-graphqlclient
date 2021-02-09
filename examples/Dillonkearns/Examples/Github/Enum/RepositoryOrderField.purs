module Dillonkearns.Examples.Github.Enum.RepositoryOrderField where

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

-- | original name - RepositoryOrderField
data RepositoryOrderField = CreatedAt | UpdatedAt | PushedAt | Name | Stargazers

derive instance genericRepositoryOrderField :: Generic RepositoryOrderField _

instance showRepositoryOrderField :: Show RepositoryOrderField where
  show = genericShow

derive instance eqRepositoryOrderField :: Eq RepositoryOrderField

derive instance ordRepositoryOrderField :: Ord RepositoryOrderField

fromToMap :: Array (Tuple String RepositoryOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt
            , Tuple "UPDATED_AT" UpdatedAt
            , Tuple "PUSHED_AT" PushedAt
            , Tuple "NAME" Name
            , Tuple "STARGAZERS" Stargazers
            ]

instance repositoryOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RepositoryOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryOrderField"
                                        fromToMap

instance repositoryOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RepositoryOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      PushedAt -> ArgumentValueEnum "PUSHED_AT"
      Name -> ArgumentValueEnum "NAME"
      Stargazers -> ArgumentValueEnum "STARGAZERS"
