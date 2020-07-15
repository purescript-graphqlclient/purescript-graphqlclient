module Examples.Github.Enum.OrderDirection where

import Prelude
import GraphqlClient
import Data.Tuple

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
      Asc -> ArgumentValueString "ASC"
      Desc -> ArgumentValueString "DESC"
