module Examples.Github.Enum.ProjectTemplate where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
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

instance projectTemplateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                               ProjectTemplate where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectTemplate" fromToMap

instance projectTemplateToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                  ProjectTemplate where
  toGraphqlArgumentValue =
    case _ of
      BasicKanban -> ArgumentValueEnum "BASIC_KANBAN"
      AutomatedKanbanV2 -> ArgumentValueEnum "AUTOMATED_KANBAN_V2"
      AutomatedReviewsKanban -> ArgumentValueEnum "AUTOMATED_REVIEWS_KANBAN"
      BugTriage -> ArgumentValueEnum "BUG_TRIAGE"
