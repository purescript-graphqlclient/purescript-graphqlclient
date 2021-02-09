module Dillonkearns.Examples.Github.Enum.IssueCommentOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - IssueCommentOrderField
data IssueCommentOrderField = UpdatedAt

derive instance genericIssueCommentOrderField
  ::
  Generic IssueCommentOrderField _

instance showIssueCommentOrderField :: Show IssueCommentOrderField where
  show = genericShow

derive instance eqIssueCommentOrderField :: Eq IssueCommentOrderField

derive instance ordIssueCommentOrderField :: Ord IssueCommentOrderField

fromToMap :: Array (Tuple String IssueCommentOrderField)
fromToMap = [ Tuple "UPDATED_AT" UpdatedAt ]

instance issueCommentOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder IssueCommentOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "IssueCommentOrderField"
                                        fromToMap

instance issueCommentOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue IssueCommentOrderField where
  toGraphQLArgumentValue =
    case _ of
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
