module Dillonkearns.Examples.Github.Enum.RepositoryVisibility where

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

-- | original name - RepositoryVisibility
data RepositoryVisibility = Private | Public | Internal

derive instance genericRepositoryVisibility :: Generic RepositoryVisibility _

instance showRepositoryVisibility :: Show RepositoryVisibility where
  show = genericShow

derive instance eqRepositoryVisibility :: Eq RepositoryVisibility

derive instance ordRepositoryVisibility :: Ord RepositoryVisibility

fromToMap :: Array (Tuple String RepositoryVisibility)
fromToMap = [ Tuple "PRIVATE" Private
            , Tuple "PUBLIC" Public
            , Tuple "INTERNAL" Internal
            ]

instance repositoryVisibilityGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RepositoryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepositoryVisibility"
                                        fromToMap

instance repositoryVisibilityToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RepositoryVisibility where
  toGraphQLArgumentValue =
    case _ of
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
      Internal -> ArgumentValueEnum "INTERNAL"
