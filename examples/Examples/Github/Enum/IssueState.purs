module Examples.Github.Enum.IssueState where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - IssueState
data IssueState = Open | Closed

derive instance genericIssueState :: Generic IssueState _

instance showIssueState :: Show IssueState where
  show = genericShow

derive instance eqIssueState :: Eq IssueState

derive instance ordIssueState :: Ord IssueState

fromToMap :: Array (Tuple String IssueState)
fromToMap = [ Tuple "OPEN" Open, Tuple "CLOSED" Closed ]

instance issueStateGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder IssueState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "IssueState" fromToMap

instance issueStateToGraphQLArgumentValue
  :: ToGraphQLArgumentValue IssueState where
  toGraphQLArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
