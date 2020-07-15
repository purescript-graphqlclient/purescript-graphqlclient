module Examples.Github.Enum.ProjectTemplate where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - ProjectTemplate
data ProjectTemplate
  = BasicKanban
  | AutomatedKanbanV2
  | AutomatedReviewsKanban
  | BugTriage

fromToMap :: Array (Tuple String ProjectTemplate)
fromToMap = [Tuple "BASIC_KANBAN" BasicKanban, Tuple "AUTOMATED_KANBAN_V2" AutomatedKanbanV2, Tuple "AUTOMATED_REVIEWS_KANBAN" AutomatedReviewsKanban, Tuple "BUG_TRIAGE" BugTriage]

instance projectTemplateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ProjectTemplate where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectTemplate" fromToMap

instance projectTemplateToGraphqlArgumentValue :: ToGraphqlArgumentValue ProjectTemplate where
  toGraphqlArgumentValue =
    case _ of
      BasicKanban -> ArgumentValueString "BASIC_KANBAN"
      AutomatedKanbanV2 -> ArgumentValueString "AUTOMATED_KANBAN_V2"
      AutomatedReviewsKanban -> ArgumentValueString "AUTOMATED_REVIEWS_KANBAN"
      BugTriage -> ArgumentValueString "BUG_TRIAGE"
