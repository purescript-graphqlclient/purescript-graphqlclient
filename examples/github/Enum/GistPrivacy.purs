module Examples.Github.Enum.GistPrivacy where

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

-- | original name - GistPrivacy
data GistPrivacy = Public | Secret | All

derive instance genericGistPrivacy :: Generic GistPrivacy _

instance showGistPrivacy :: Show GistPrivacy where
  show = genericShow

derive instance eqGistPrivacy :: Eq GistPrivacy

derive instance ordGistPrivacy :: Ord GistPrivacy

fromToMap :: Array (Tuple String GistPrivacy)
fromToMap = [ Tuple "PUBLIC" Public, Tuple "SECRET" Secret, Tuple "ALL" All ]

instance gistPrivacyGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                           GistPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "GistPrivacy" fromToMap

instance gistPrivacyToGraphQLArgumentValue :: ToGraphQLArgumentValue GistPrivacy where
  toGraphQLArgumentValue =
    case _ of
      Public -> ArgumentValueEnum "PUBLIC"
      Secret -> ArgumentValueEnum "SECRET"
      All -> ArgumentValueEnum "ALL"
