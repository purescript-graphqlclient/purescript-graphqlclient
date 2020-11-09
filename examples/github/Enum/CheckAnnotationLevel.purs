module Examples.Github.Enum.CheckAnnotationLevel where

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

-- | original name - CheckAnnotationLevel
data CheckAnnotationLevel = Failure | Notice | Warning

derive instance genericCheckAnnotationLevel :: Generic CheckAnnotationLevel _

instance showCheckAnnotationLevel :: Show CheckAnnotationLevel where
  show = genericShow

derive instance eqCheckAnnotationLevel :: Eq CheckAnnotationLevel

derive instance ordCheckAnnotationLevel :: Ord CheckAnnotationLevel

fromToMap :: Array (Tuple String CheckAnnotationLevel)
fromToMap = [ Tuple "FAILURE" Failure
            , Tuple "NOTICE" Notice
            , Tuple "WARNING" Warning
            ]

instance checkAnnotationLevelGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                    CheckAnnotationLevel where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "CheckAnnotationLevel"
                                        fromToMap

instance checkAnnotationLevelToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                       CheckAnnotationLevel where
  toGraphQLArgumentValue =
    case _ of
      Failure -> ArgumentValueEnum "FAILURE"
      Notice -> ArgumentValueEnum "NOTICE"
      Warning -> ArgumentValueEnum "WARNING"
