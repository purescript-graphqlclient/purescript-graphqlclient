module Examples.Github.Enum.RepositoryInteractionLimitOrigin where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepositoryInteractionLimitOrigin
data RepositoryInteractionLimitOrigin = Repository | Organization | User

derive instance genericRepositoryInteractionLimitOrigin :: Generic RepositoryInteractionLimitOrigin _

instance showRepositoryInteractionLimitOrigin :: Show
                                                 RepositoryInteractionLimitOrigin where
  show = genericShow

derive instance eqRepositoryInteractionLimitOrigin :: Eq RepositoryInteractionLimitOrigin

derive instance ordRepositoryInteractionLimitOrigin :: Ord RepositoryInteractionLimitOrigin

fromToMap :: Array (Tuple String RepositoryInteractionLimitOrigin)
fromToMap = [ Tuple "REPOSITORY" Repository
            , Tuple "ORGANIZATION" Organization
            , Tuple "USER" User
            ]

instance repositoryInteractionLimitOriginGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                RepositoryInteractionLimitOrigin where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryInteractionLimitOrigin"
                                        fromToMap

instance repositoryInteractionLimitOriginToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                   RepositoryInteractionLimitOrigin where
  toGraphQLArgumentValue =
    case _ of
      Repository -> ArgumentValueEnum "REPOSITORY"
      Organization -> ArgumentValueEnum "ORGANIZATION"
      User -> ArgumentValueEnum "USER"
