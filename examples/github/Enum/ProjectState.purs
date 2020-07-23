module Examples.Github.Enum.ProjectState where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
