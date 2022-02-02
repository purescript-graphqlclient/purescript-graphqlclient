module Examples.Github.Enum.DismissReason where

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

-- | original name - DismissReason
data DismissReason
  = FixStarted
  | NoBandwidth
  | TolerableRisk
  | Inaccurate
  | NotUsed

derive instance genericDismissReason :: Generic DismissReason _

instance showDismissReason :: Show DismissReason where
  show = genericShow

derive instance eqDismissReason :: Eq DismissReason

derive instance ordDismissReason :: Ord DismissReason

fromToMap :: Array (Tuple String DismissReason)
fromToMap = [ Tuple "FIX_STARTED" FixStarted
            , Tuple "NO_BANDWIDTH" NoBandwidth
            , Tuple "TOLERABLE_RISK" TolerableRisk
            , Tuple "INACCURATE" Inaccurate
            , Tuple "NOT_USED" NotUsed
            ]

instance dismissReasonGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder DismissReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder "DismissReason" fromToMap

instance dismissReasonToGraphQLArgumentValue
  :: ToGraphQLArgumentValue DismissReason where
  toGraphQLArgumentValue =
    case _ of
      FixStarted -> ArgumentValueEnum "FIX_STARTED"
      NoBandwidth -> ArgumentValueEnum "NO_BANDWIDTH"
      TolerableRisk -> ArgumentValueEnum "TOLERABLE_RISK"
      Inaccurate -> ArgumentValueEnum "INACCURATE"
      NotUsed -> ArgumentValueEnum "NOT_USED"
