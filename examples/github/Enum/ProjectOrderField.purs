module Examples.Github.Enum.ProjectOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ProjectOrderField
data ProjectOrderField = CreatedAt | UpdatedAt | Name

derive instance eqProjectOrderField :: Eq ProjectOrderField

derive instance ordProjectOrderField :: Ord ProjectOrderField

fromToMap :: Array (Tuple String ProjectOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt
            , Tuple "UPDATED_AT" UpdatedAt
            , Tuple "NAME" Name
            ]

instance projectOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                 ProjectOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ProjectOrderField"
                                        fromToMap

instance projectOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                    ProjectOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      Name -> ArgumentValueEnum "NAME"
