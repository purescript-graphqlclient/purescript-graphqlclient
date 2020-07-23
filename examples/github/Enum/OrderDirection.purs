module Examples.Github.Enum.OrderDirection where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrderDirection
data OrderDirection
  = Asc
  | Desc

fromToMap :: Array (Tuple String OrderDirection)
fromToMap = [Tuple "ASC" Asc, Tuple "DESC" Desc]

instance orderDirectionGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrderDirection where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrderDirection" fromToMap

instance orderDirectionToGraphqlArgumentValue :: ToGraphqlArgumentValue OrderDirection where
  toGraphqlArgumentValue =
    case _ of
      Asc -> ArgumentValueEnum "ASC"
      Desc -> ArgumentValueEnum "DESC"
