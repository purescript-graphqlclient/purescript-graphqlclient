module Examples.Github.Enum.ProjectOrderField where

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

-- | original name - ProjectOrderField
data ProjectOrderField = CreatedAt | UpdatedAt | Name

derive instance genericProjectOrderField :: Generic ProjectOrderField _

instance showProjectOrderField :: Show ProjectOrderField where
  show = genericShow

derive instance eqProjectOrderField :: Eq ProjectOrderField

derive instance ordProjectOrderField :: Ord ProjectOrderField

fromToMap :: Array (Tuple String ProjectOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt
            , Tuple "UPDATED_AT" UpdatedAt
            , Tuple "NAME" Name
            ]

instance projectOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                 ProjectOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ProjectOrderField"
                                        fromToMap

instance projectOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                    ProjectOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      Name -> ArgumentValueEnum "NAME"
