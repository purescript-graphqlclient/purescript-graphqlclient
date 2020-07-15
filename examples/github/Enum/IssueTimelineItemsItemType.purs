module Examples.Github.Enum.IssueTimelineItemsItemType where

import Prelude
import GraphqlClient
import Data.Tuple

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

fromToMap :: Array (Tuple String IssueTimelineItemsItemType)
fromToMap = [Tuple "ISSUE_COMMENT" IssueComment, Tuple "CROSS_REFERENCED_EVENT" CrossReferencedEvent, Tuple "ADDED_TO_PROJECT_EVENT" AddedToProjectEvent, Tuple "ASSIGNED_EVENT" AssignedEvent, Tuple "CLOSED_EVENT" ClosedEvent, Tuple "COMMENT_DELETED_EVENT" CommentDeletedEvent, Tuple "CONNECTED_EVENT" ConnectedEvent, Tuple "CONVERTED_NOTE_TO_ISSUE_EVENT" ConvertedNoteToIssueEvent, Tuple "DEMILESTONED_EVENT" DemilestonedEvent, Tuple "DISCONNECTED_EVENT" DisconnectedEvent, Tuple "LABELED_EVENT" LabeledEvent, Tuple "LOCKED_EVENT" LockedEvent, Tuple "MARKED_AS_DUPLICATE_EVENT" MarkedAsDuplicateEvent, Tuple "MENTIONED_EVENT" MentionedEvent, Tuple "MILESTONED_EVENT" MilestonedEvent, Tuple "MOVED_COLUMNS_IN_PROJECT_EVENT" MovedColumnsInProjectEvent, Tuple "PINNED_EVENT" PinnedEvent, Tuple "REFERENCED_EVENT" ReferencedEvent, Tuple "REMOVED_FROM_PROJECT_EVENT" RemovedFromProjectEvent, Tuple "RENAMED_TITLE_EVENT" RenamedTitleEvent, Tuple "REOPENED_EVENT" ReopenedEvent, Tuple "SUBSCRIBED_EVENT" SubscribedEvent, Tuple "TRANSFERRED_EVENT" TransferredEvent, Tuple "UNASSIGNED_EVENT" UnassignedEvent, Tuple "UNLABELED_EVENT" UnlabeledEvent, Tuple "UNLOCKED_EVENT" UnlockedEvent, Tuple "USER_BLOCKED_EVENT" UserBlockedEvent, Tuple "UNMARKED_AS_DUPLICATE_EVENT" UnmarkedAsDuplicateEvent, Tuple "UNPINNED_EVENT" UnpinnedEvent, Tuple "UNSUBSCRIBED_EVENT" UnsubscribedEvent]

instance issueTimelineItemsItemTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder IssueTimelineItemsItemType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "IssueTimelineItemsItemType" fromToMap

instance issueTimelineItemsItemTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue IssueTimelineItemsItemType where
  toGraphqlArgumentValue =
    case _ of
      IssueComment -> ArgumentValueString "ISSUE_COMMENT"
      CrossReferencedEvent -> ArgumentValueString "CROSS_REFERENCED_EVENT"
      AddedToProjectEvent -> ArgumentValueString "ADDED_TO_PROJECT_EVENT"
      AssignedEvent -> ArgumentValueString "ASSIGNED_EVENT"
      ClosedEvent -> ArgumentValueString "CLOSED_EVENT"
      CommentDeletedEvent -> ArgumentValueString "COMMENT_DELETED_EVENT"
      ConnectedEvent -> ArgumentValueString "CONNECTED_EVENT"
      ConvertedNoteToIssueEvent -> ArgumentValueString "CONVERTED_NOTE_TO_ISSUE_EVENT"
      DemilestonedEvent -> ArgumentValueString "DEMILESTONED_EVENT"
      DisconnectedEvent -> ArgumentValueString "DISCONNECTED_EVENT"
      LabeledEvent -> ArgumentValueString "LABELED_EVENT"
      LockedEvent -> ArgumentValueString "LOCKED_EVENT"
      MarkedAsDuplicateEvent -> ArgumentValueString "MARKED_AS_DUPLICATE_EVENT"
      MentionedEvent -> ArgumentValueString "MENTIONED_EVENT"
      MilestonedEvent -> ArgumentValueString "MILESTONED_EVENT"
      MovedColumnsInProjectEvent -> ArgumentValueString "MOVED_COLUMNS_IN_PROJECT_EVENT"
      PinnedEvent -> ArgumentValueString "PINNED_EVENT"
      ReferencedEvent -> ArgumentValueString "REFERENCED_EVENT"
      RemovedFromProjectEvent -> ArgumentValueString "REMOVED_FROM_PROJECT_EVENT"
      RenamedTitleEvent -> ArgumentValueString "RENAMED_TITLE_EVENT"
      ReopenedEvent -> ArgumentValueString "REOPENED_EVENT"
      SubscribedEvent -> ArgumentValueString "SUBSCRIBED_EVENT"
      TransferredEvent -> ArgumentValueString "TRANSFERRED_EVENT"
      UnassignedEvent -> ArgumentValueString "UNASSIGNED_EVENT"
      UnlabeledEvent -> ArgumentValueString "UNLABELED_EVENT"
      UnlockedEvent -> ArgumentValueString "UNLOCKED_EVENT"
      UserBlockedEvent -> ArgumentValueString "USER_BLOCKED_EVENT"
      UnmarkedAsDuplicateEvent -> ArgumentValueString "UNMARKED_AS_DUPLICATE_EVENT"
      UnpinnedEvent -> ArgumentValueString "UNPINNED_EVENT"
      UnsubscribedEvent -> ArgumentValueString "UNSUBSCRIBED_EVENT"
