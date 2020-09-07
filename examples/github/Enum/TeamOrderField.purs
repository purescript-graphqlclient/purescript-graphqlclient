module Examples.Github.Enum.TeamOrderField where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - TeamOrderField
data TeamOrderField = Name

derive instance eqTeamOrderField :: Eq TeamOrderField

derive instance ordTeamOrderField :: Ord TeamOrderField

fromToMap :: Array (Tuple String TeamOrderField)
fromToMap = [ Tuple "NAME" Name ]

instance teamOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                              TeamOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamOrderField" fromToMap

instance teamOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                 TeamOrderField where
  toGraphqlArgumentValue =
    case _ of
      Name -> ArgumentValueEnum "NAME"
