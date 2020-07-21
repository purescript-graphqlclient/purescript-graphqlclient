module Examples.Github.Enum.TeamOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

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
