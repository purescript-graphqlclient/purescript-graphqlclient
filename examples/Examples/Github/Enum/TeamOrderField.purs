module Examples.Github.Enum.TeamOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - TeamOrderField
data TeamOrderField = Name

derive instance genericTeamOrderField :: Generic TeamOrderField _

instance showTeamOrderField :: Show TeamOrderField where
  show = genericShow

derive instance eqTeamOrderField :: Eq TeamOrderField

derive instance ordTeamOrderField :: Ord TeamOrderField

fromToMap :: Array (Tuple String TeamOrderField)
fromToMap = [ Tuple "NAME" Name ]

instance teamOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder TeamOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamOrderField" fromToMap

instance teamOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue TeamOrderField where
  toGraphQLArgumentValue =
    case _ of
      Name -> ArgumentValueEnum "NAME"
