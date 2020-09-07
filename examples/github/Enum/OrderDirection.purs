module Examples.Github.Enum.OrderDirection where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrderDirection
data OrderDirection = Asc | Desc

derive instance eqOrderDirection :: Eq OrderDirection

derive instance ordOrderDirection :: Ord OrderDirection

fromToMap :: Array (Tuple String OrderDirection)
fromToMap = [ Tuple "ASC" Asc, Tuple "DESC" Desc ]

instance orderDirectionGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                              OrderDirection where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrderDirection" fromToMap

instance orderDirectionToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                 OrderDirection where
  toGraphqlArgumentValue =
    case _ of
      Asc -> ArgumentValueEnum "ASC"
      Desc -> ArgumentValueEnum "DESC"
