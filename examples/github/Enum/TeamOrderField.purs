module Examples.Github.Enum.TeamOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - TeamOrderField
data TeamOrderField
  = Name

fromToMap :: Array (Tuple String TeamOrderField)
fromToMap = [Tuple "NAME" Name]

instance teamOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder TeamOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamOrderField" fromToMap

instance teamOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue TeamOrderField where
  toGraphqlArgumentValue =
    case _ of
      Name -> ArgumentValueEnum "NAME"
