module Dillonkearns.Examples.Github.Enum.TeamRepositoryOrderField where

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

-- | original name - TeamRepositoryOrderField
data TeamRepositoryOrderField
  = CreatedAt
  | UpdatedAt
  | PushedAt
  | Name
  | Permission
  | Stargazers

derive instance genericTeamRepositoryOrderField
  ::
  Generic TeamRepositoryOrderField _

instance showTeamRepositoryOrderField :: Show TeamRepositoryOrderField where
  show = genericShow

derive instance eqTeamRepositoryOrderField :: Eq TeamRepositoryOrderField

derive instance ordTeamRepositoryOrderField :: Ord TeamRepositoryOrderField

fromToMap :: Array (Tuple String TeamRepositoryOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt
            , Tuple "UPDATED_AT" UpdatedAt
            , Tuple "PUSHED_AT" PushedAt
            , Tuple "NAME" Name
            , Tuple "PERMISSION" Permission
            , Tuple "STARGAZERS" Stargazers
            ]

instance teamRepositoryOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder TeamRepositoryOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "TeamRepositoryOrderField"
                                        fromToMap

instance teamRepositoryOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue TeamRepositoryOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      PushedAt -> ArgumentValueEnum "PUSHED_AT"
      Name -> ArgumentValueEnum "NAME"
      Permission -> ArgumentValueEnum "PERMISSION"
      Stargazers -> ArgumentValueEnum "STARGAZERS"
