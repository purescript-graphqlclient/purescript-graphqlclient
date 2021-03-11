module Examples.Github.Enum.StarOrderField where

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

-- | original name - StarOrderField
data StarOrderField = StarredAt

derive instance genericStarOrderField :: Generic StarOrderField _

instance showStarOrderField :: Show StarOrderField where
  show = genericShow

derive instance eqStarOrderField :: Eq StarOrderField

derive instance ordStarOrderField :: Ord StarOrderField

fromToMap :: Array (Tuple String StarOrderField)
fromToMap = [ Tuple "STARRED_AT" StarredAt ]

instance starOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder StarOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "StarOrderField" fromToMap

instance starOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue StarOrderField where
  toGraphQLArgumentValue =
    case _ of
      StarredAt -> ArgumentValueEnum "STARRED_AT"
