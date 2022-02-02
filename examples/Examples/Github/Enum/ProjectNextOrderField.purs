module Examples.Github.Enum.ProjectNextOrderField where

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

-- | original name - ProjectNextOrderField
data ProjectNextOrderField = Title | Number | UpdatedAt | CreatedAt

derive instance genericProjectNextOrderField :: Generic ProjectNextOrderField _

instance showProjectNextOrderField :: Show ProjectNextOrderField where
  show = genericShow

derive instance eqProjectNextOrderField :: Eq ProjectNextOrderField

derive instance ordProjectNextOrderField :: Ord ProjectNextOrderField

fromToMap :: Array (Tuple String ProjectNextOrderField)
fromToMap = [ Tuple "TITLE" Title
            , Tuple "NUMBER" Number
            , Tuple "UPDATED_AT" UpdatedAt
            , Tuple "CREATED_AT" CreatedAt
            ]

instance projectNextOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder ProjectNextOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ProjectNextOrderField"
                                        fromToMap

instance projectNextOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue ProjectNextOrderField where
  toGraphQLArgumentValue =
    case _ of
      Title -> ArgumentValueEnum "TITLE"
      Number -> ArgumentValueEnum "NUMBER"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
