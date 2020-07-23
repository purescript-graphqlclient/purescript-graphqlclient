module Examples.Github.Enum.StarOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - StarOrderField
data StarOrderField
  = StarredAt

fromToMap :: Array (Tuple String StarOrderField)
fromToMap = [Tuple "STARRED_AT" StarredAt]

instance starOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder StarOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "StarOrderField" fromToMap

instance starOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue StarOrderField where
  toGraphqlArgumentValue =
    case _ of
      StarredAt -> ArgumentValueEnum "STARRED_AT"
