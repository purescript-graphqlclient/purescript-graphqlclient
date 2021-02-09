module Examples.Github.Enum.TeamPrivacy where

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

-- | original name - TeamPrivacy
data TeamPrivacy = Secret | Visible

derive instance genericTeamPrivacy :: Generic TeamPrivacy _

instance showTeamPrivacy :: Show TeamPrivacy where
  show = genericShow

derive instance eqTeamPrivacy :: Eq TeamPrivacy

derive instance ordTeamPrivacy :: Ord TeamPrivacy

fromToMap :: Array (Tuple String TeamPrivacy)
fromToMap = [ Tuple "SECRET" Secret, Tuple "VISIBLE" Visible ]

instance teamPrivacyGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder TeamPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamPrivacy" fromToMap

instance teamPrivacyToGraphQLArgumentValue
  :: ToGraphQLArgumentValue TeamPrivacy where
  toGraphQLArgumentValue =
    case _ of
      Secret -> ArgumentValueEnum "SECRET"
      Visible -> ArgumentValueEnum "VISIBLE"
