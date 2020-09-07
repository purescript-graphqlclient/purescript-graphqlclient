module Examples.Github.Enum.TeamPrivacy where

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

derive instance eqTeamPrivacy :: Eq TeamPrivacy

derive instance ordTeamPrivacy :: Ord TeamPrivacy

fromToMap :: Array (Tuple String TeamPrivacy)
fromToMap = [ Tuple "SECRET" Secret, Tuple "VISIBLE" Visible ]

instance teamPrivacyGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                           TeamPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamPrivacy" fromToMap

instance teamPrivacyToGraphQLArgumentValue :: ToGraphQLArgumentValue TeamPrivacy where
  toGraphQLArgumentValue =
    case _ of
      Secret -> ArgumentValueEnum "SECRET"
      Visible -> ArgumentValueEnum "VISIBLE"
