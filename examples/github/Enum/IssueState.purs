module Examples.Github.Enum.IssueState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - IssueState
data IssueState = Open | Closed

derive instance eqIssueState :: Eq IssueState

derive instance ordIssueState :: Ord IssueState

fromToMap :: Array (Tuple String IssueState)
fromToMap = [ Tuple "OPEN" Open, Tuple "CLOSED" Closed ]

instance issueStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                          IssueState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "IssueState" fromToMap

instance issueStateToGraphqlArgumentValue :: ToGraphqlArgumentValue IssueState where
  toGraphqlArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
