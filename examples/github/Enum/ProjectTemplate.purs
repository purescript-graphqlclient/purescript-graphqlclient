module Examples.Github.Enum.ProjectTemplate where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ProjectTemplate
data ProjectTemplate
  = BasicKanban | AutomatedKanbanV2 | AutomatedReviewsKanban | BugTriage

derive instance eqProjectTemplate :: Eq ProjectTemplate

derive instance ordProjectTemplate :: Ord ProjectTemplate

fromToMap :: Array (Tuple String ProjectTemplate)
fromToMap = [ Tuple "BASIC_KANBAN" BasicKanban
            , Tuple "AUTOMATED_KANBAN_V2" AutomatedKanbanV2
            , Tuple "AUTOMATED_REVIEWS_KANBAN" AutomatedReviewsKanban
            , Tuple "BUG_TRIAGE" BugTriage
            ]

instance projectTemplateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                               ProjectTemplate where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectTemplate" fromToMap

instance projectTemplateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                  ProjectTemplate where
  toGraphQLArgumentValue =
    case _ of
      BasicKanban -> ArgumentValueEnum "BASIC_KANBAN"
      AutomatedKanbanV2 -> ArgumentValueEnum "AUTOMATED_KANBAN_V2"
      AutomatedReviewsKanban -> ArgumentValueEnum "AUTOMATED_REVIEWS_KANBAN"
      BugTriage -> ArgumentValueEnum "BUG_TRIAGE"
