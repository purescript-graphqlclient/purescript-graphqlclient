module Examples.Github.Enum.ReleaseOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ReleaseOrderField
data ReleaseOrderField = CreatedAt | Name

derive instance eqReleaseOrderField :: Eq ReleaseOrderField

derive instance ordReleaseOrderField :: Ord ReleaseOrderField

fromToMap :: Array (Tuple String ReleaseOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt, Tuple "NAME" Name ]

instance releaseOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                 ReleaseOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ReleaseOrderField"
                                        fromToMap

instance releaseOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                    ReleaseOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      Name -> ArgumentValueEnum "NAME"
