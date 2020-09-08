module Examples.Github.Enum.IssueOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - IssueOrderField
data IssueOrderField = CreatedAt | UpdatedAt | Comments

derive instance eqIssueOrderField :: Eq IssueOrderField

derive instance ordIssueOrderField :: Ord IssueOrderField

fromToMap :: Array (Tuple String IssueOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt
            , Tuple "UPDATED_AT" UpdatedAt
            , Tuple "COMMENTS" Comments
            ]

instance issueOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                               IssueOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "IssueOrderField" fromToMap

instance issueOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                  IssueOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      Comments -> ArgumentValueEnum "COMMENTS"
