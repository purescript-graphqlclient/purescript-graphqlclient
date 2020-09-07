module Examples.Github.Enum.IssueTimelineItemsItemType where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - IssueTimelineItemsItemType
data IssueTimelineItemsItemType
  = IssueComment
  | CrossReferencedEvent
  | AddedToProjectEvent
  | AssignedEvent
  | ClosedEvent
  | CommentDeletedEvent
  | ConnectedEvent
  | ConvertedNoteToIssueEvent
  | DemilestonedEvent
  | DisconnectedEvent
  | LabeledEvent
  | LockedEvent
  | MarkedAsDuplicateEvent
  | MentionedEvent
  | MilestonedEvent
  | MovedColumnsInProjectEvent
  | PinnedEvent
  | ReferencedEvent
  | RemovedFromProjectEvent
  | RenamedTitleEvent
  | ReopenedEvent
  | SubscribedEvent
  | TransferredEvent
  | UnassignedEvent
  | UnlabeledEvent
  | UnlockedEvent
  | UserBlockedEvent
  | UnmarkedAsDuplicateEvent
  | UnpinnedEvent
  | UnsubscribedEvent

derive instance eqIssueTimelineItemsItemType :: Eq IssueTimelineItemsItemType

derive instance ordIssueTimelineItemsItemType :: Ord IssueTimelineItemsItemType

fromToMap :: Array (Tuple String IssueTimelineItemsItemType)
fromToMap = [ Tuple "ISSUE_COMMENT" IssueComment
            , Tuple "CROSS_REFERENCED_EVENT" CrossReferencedEvent
            , Tuple "ADDED_TO_PROJECT_EVENT" AddedToProjectEvent
            , Tuple "ASSIGNED_EVENT" AssignedEvent
            , Tuple "CLOSED_EVENT" ClosedEvent
            , Tuple "COMMENT_DELETED_EVENT" CommentDeletedEvent
            , Tuple "CONNECTED_EVENT" ConnectedEvent
            , Tuple "CONVERTED_NOTE_TO_ISSUE_EVENT" ConvertedNoteToIssueEvent
            , Tuple "DEMILESTONED_EVENT" DemilestonedEvent
            , Tuple "DISCONNECTED_EVENT" DisconnectedEvent
            , Tuple "LABELED_EVENT" LabeledEvent
            , Tuple "LOCKED_EVENT" LockedEvent
            , Tuple "MARKED_AS_DUPLICATE_EVENT" MarkedAsDuplicateEvent
            , Tuple "MENTIONED_EVENT" MentionedEvent
            , Tuple "MILESTONED_EVENT" MilestonedEvent
            , Tuple "MOVED_COLUMNS_IN_PROJECT_EVENT" MovedColumnsInProjectEvent
            , Tuple "PINNED_EVENT" PinnedEvent
            , Tuple "REFERENCED_EVENT" ReferencedEvent
            , Tuple "REMOVED_FROM_PROJECT_EVENT" RemovedFromProjectEvent
            , Tuple "RENAMED_TITLE_EVENT" RenamedTitleEvent
            , Tuple "REOPENED_EVENT" ReopenedEvent
            , Tuple "SUBSCRIBED_EVENT" SubscribedEvent
            , Tuple "TRANSFERRED_EVENT" TransferredEvent
            , Tuple "UNASSIGNED_EVENT" UnassignedEvent
            , Tuple "UNLABELED_EVENT" UnlabeledEvent
            , Tuple "UNLOCKED_EVENT" UnlockedEvent
            , Tuple "USER_BLOCKED_EVENT" UserBlockedEvent
            , Tuple "UNMARKED_AS_DUPLICATE_EVENT" UnmarkedAsDuplicateEvent
            , Tuple "UNPINNED_EVENT" UnpinnedEvent
            , Tuple "UNSUBSCRIBED_EVENT" UnsubscribedEvent
            ]

instance issueTimelineItemsItemTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                          IssueTimelineItemsItemType where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "IssueTimelineItemsItemType"
                                        fromToMap

instance issueTimelineItemsItemTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                             IssueTimelineItemsItemType where
  toGraphqlArgumentValue =
    case _ of
      IssueComment -> ArgumentValueEnum "ISSUE_COMMENT"
      CrossReferencedEvent -> ArgumentValueEnum "CROSS_REFERENCED_EVENT"
      AddedToProjectEvent -> ArgumentValueEnum "ADDED_TO_PROJECT_EVENT"
      AssignedEvent -> ArgumentValueEnum "ASSIGNED_EVENT"
      ClosedEvent -> ArgumentValueEnum "CLOSED_EVENT"
      CommentDeletedEvent -> ArgumentValueEnum "COMMENT_DELETED_EVENT"
      ConnectedEvent -> ArgumentValueEnum "CONNECTED_EVENT"
      ConvertedNoteToIssueEvent -> ArgumentValueEnum
                                   "CONVERTED_NOTE_TO_ISSUE_EVENT"
      DemilestonedEvent -> ArgumentValueEnum "DEMILESTONED_EVENT"
      DisconnectedEvent -> ArgumentValueEnum "DISCONNECTED_EVENT"
      LabeledEvent -> ArgumentValueEnum "LABELED_EVENT"
      LockedEvent -> ArgumentValueEnum "LOCKED_EVENT"
      MarkedAsDuplicateEvent -> ArgumentValueEnum "MARKED_AS_DUPLICATE_EVENT"
      MentionedEvent -> ArgumentValueEnum "MENTIONED_EVENT"
      MilestonedEvent -> ArgumentValueEnum "MILESTONED_EVENT"
      MovedColumnsInProjectEvent -> ArgumentValueEnum
                                    "MOVED_COLUMNS_IN_PROJECT_EVENT"
      PinnedEvent -> ArgumentValueEnum "PINNED_EVENT"
      ReferencedEvent -> ArgumentValueEnum "REFERENCED_EVENT"
      RemovedFromProjectEvent -> ArgumentValueEnum "REMOVED_FROM_PROJECT_EVENT"
      RenamedTitleEvent -> ArgumentValueEnum "RENAMED_TITLE_EVENT"
      ReopenedEvent -> ArgumentValueEnum "REOPENED_EVENT"
      SubscribedEvent -> ArgumentValueEnum "SUBSCRIBED_EVENT"
      TransferredEvent -> ArgumentValueEnum "TRANSFERRED_EVENT"
      UnassignedEvent -> ArgumentValueEnum "UNASSIGNED_EVENT"
      UnlabeledEvent -> ArgumentValueEnum "UNLABELED_EVENT"
      UnlockedEvent -> ArgumentValueEnum "UNLOCKED_EVENT"
      UserBlockedEvent -> ArgumentValueEnum "USER_BLOCKED_EVENT"
      UnmarkedAsDuplicateEvent -> ArgumentValueEnum
                                  "UNMARKED_AS_DUPLICATE_EVENT"
      UnpinnedEvent -> ArgumentValueEnum "UNPINNED_EVENT"
      UnsubscribedEvent -> ArgumentValueEnum "UNSUBSCRIBED_EVENT"
