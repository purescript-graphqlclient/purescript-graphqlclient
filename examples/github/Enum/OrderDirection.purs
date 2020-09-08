module Examples.Github.Enum.OrderDirection where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrderDirection
data OrderDirection = Asc | Desc

derive instance eqOrderDirection :: Eq OrderDirection

derive instance ordOrderDirection :: Ord OrderDirection

fromToMap :: Array (Tuple String OrderDirection)
fromToMap = [ Tuple "ASC" Asc, Tuple "DESC" Desc ]

instance orderDirectionGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                              OrderDirection where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrderDirection" fromToMap

instance orderDirectionToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                 OrderDirection where
  toGraphQLArgumentValue =
    case _ of
      Asc -> ArgumentValueEnum "ASC"
      Desc -> ArgumentValueEnum "DESC"
