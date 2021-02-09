module Dillonkearns.Examples.Github.Enum.CheckRunType where

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

-- | original name - CheckRunType
data CheckRunType = All | Latest

derive instance genericCheckRunType :: Generic CheckRunType _

instance showCheckRunType :: Show CheckRunType where
  show = genericShow

derive instance eqCheckRunType :: Eq CheckRunType

derive instance ordCheckRunType :: Ord CheckRunType

fromToMap :: Array (Tuple String CheckRunType)
fromToMap = [ Tuple "ALL" All, Tuple "LATEST" Latest ]

instance checkRunTypeGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder CheckRunType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "CheckRunType" fromToMap

instance checkRunTypeToGraphQLArgumentValue
  :: ToGraphQLArgumentValue CheckRunType where
  toGraphQLArgumentValue =
    case _ of
      All -> ArgumentValueEnum "ALL"
      Latest -> ArgumentValueEnum "LATEST"
