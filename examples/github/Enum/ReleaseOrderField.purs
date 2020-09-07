module Examples.Github.Enum.ReleaseOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ReleaseOrderField
data ReleaseOrderField = CreatedAt | Name

derive instance eqReleaseOrderField :: Eq ReleaseOrderField

derive instance ordReleaseOrderField :: Ord ReleaseOrderField

fromToMap :: Array (Tuple String ReleaseOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt, Tuple "NAME" Name ]

instance releaseOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                 ReleaseOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ReleaseOrderField"
                                        fromToMap

instance releaseOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                    ReleaseOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      Name -> ArgumentValueEnum "NAME"
