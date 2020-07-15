module Examples.Github.Enum.ProjectState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - ProjectState
data ProjectState
  = Open
  | Closed

fromToMap :: Array (Tuple String ProjectState)
fromToMap = [Tuple "OPEN" Open, Tuple "CLOSED" Closed]

instance projectStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ProjectState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectState" fromToMap

instance projectStateToGraphqlArgumentValue :: ToGraphqlArgumentValue ProjectState where
  toGraphqlArgumentValue =
    case _ of
      Open -> ArgumentValueString "OPEN"
      Closed -> ArgumentValueString "CLOSED"
