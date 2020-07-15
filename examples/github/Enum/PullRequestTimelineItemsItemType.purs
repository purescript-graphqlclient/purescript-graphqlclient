module Examples.Github.Enum.PullRequestTimelineItemsItemType where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PullRequestTimelineItemsItemType
data PullRequestTimelineItemsItemType
  = PullRequestCommit
  | PullRequestCommitCommentThread
  | PullRequestReview
  | PullRequestReviewThread
  | PullRequestRevisionMarker
  | AutomaticBaseChangeFailedEvent
  | AutomaticBaseChangeSucceededEvent
  | BaseRefChangedEvent
  | BaseRefForcePushedEvent
  | DeployedEvent
  | DeploymentEnvironmentChangedEvent
  | HeadRefDeletedEvent
  | HeadRefForcePushedEvent
  | HeadRefRestoredEvent
  | MergedEvent
  | ReviewDismissedEvent
  | ReviewRequestedEvent
  | ReviewRequestRemovedEvent
  | ReadyForReviewEvent
  | ConvertToDraftEvent
  | IssueComment
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

fromToMap :: Array (Tuple String PullRequestTimelineItemsItemType)
fromToMap = [Tuple "PULL_REQUEST_COMMIT" PullRequestCommit, Tuple "PULL_REQUEST_COMMIT_COMMENT_THREAD" PullRequestCommitCommentThread, Tuple "PULL_REQUEST_REVIEW" PullRequestReview, Tuple "PULL_REQUEST_REVIEW_THREAD" PullRequestReviewThread, Tuple "PULL_REQUEST_REVISION_MARKER" PullRequestRevisionMarker, Tuple "AUTOMATIC_BASE_CHANGE_FAILED_EVENT" AutomaticBaseChangeFailedEvent, Tuple "AUTOMATIC_BASE_CHANGE_SUCCEEDED_EVENT" AutomaticBaseChangeSucceededEvent, Tuple "BASE_REF_CHANGED_EVENT" BaseRefChangedEvent, Tuple "BASE_REF_FORCE_PUSHED_EVENT" BaseRefForcePushedEvent, Tuple "DEPLOYED_EVENT" DeployedEvent, Tuple "DEPLOYMENT_ENVIRONMENT_CHANGED_EVENT" DeploymentEnvironmentChangedEvent, Tuple "HEAD_REF_DELETED_EVENT" HeadRefDeletedEvent, Tuple "HEAD_REF_FORCE_PUSHED_EVENT" HeadRefForcePushedEvent, Tuple "HEAD_REF_RESTORED_EVENT" HeadRefRestoredEvent, Tuple "MERGED_EVENT" MergedEvent, Tuple "REVIEW_DISMISSED_EVENT" ReviewDismissedEvent, Tuple "REVIEW_REQUESTED_EVENT" ReviewRequestedEvent, Tuple "REVIEW_REQUEST_REMOVED_EVENT" ReviewRequestRemovedEvent, Tuple "READY_FOR_REVIEW_EVENT" ReadyForReviewEvent, Tuple "CONVERT_TO_DRAFT_EVENT" ConvertToDraftEvent, Tuple "ISSUE_COMMENT" IssueComment, Tuple "CROSS_REFERENCED_EVENT" CrossReferencedEvent, Tuple "ADDED_TO_PROJECT_EVENT" AddedToProjectEvent, Tuple "ASSIGNED_EVENT" AssignedEvent, Tuple "CLOSED_EVENT" ClosedEvent, Tuple "COMMENT_DELETED_EVENT" CommentDeletedEvent, Tuple "CONNECTED_EVENT" ConnectedEvent, Tuple "CONVERTED_NOTE_TO_ISSUE_EVENT" ConvertedNoteToIssueEvent, Tuple "DEMILESTONED_EVENT" DemilestonedEvent, Tuple "DISCONNECTED_EVENT" DisconnectedEvent, Tuple "LABELED_EVENT" LabeledEvent, Tuple "LOCKED_EVENT" LockedEvent, Tuple "MARKED_AS_DUPLICATE_EVENT" MarkedAsDuplicateEvent, Tuple "MENTIONED_EVENT" MentionedEvent, Tuple "MILESTONED_EVENT" MilestonedEvent, Tuple "MOVED_COLUMNS_IN_PROJECT_EVENT" MovedColumnsInProjectEvent, Tuple "PINNED_EVENT" PinnedEvent, Tuple "REFERENCED_EVENT" ReferencedEvent, Tuple "REMOVED_FROM_PROJECT_EVENT" RemovedFromProjectEvent, Tuple "RENAMED_TITLE_EVENT" RenamedTitleEvent, Tuple "REOPENED_EVENT" ReopenedEvent, Tuple "SUBSCRIBED_EVENT" SubscribedEvent, Tuple "TRANSFERRED_EVENT" TransferredEvent, Tuple "UNASSIGNED_EVENT" UnassignedEvent, Tuple "UNLABELED_EVENT" UnlabeledEvent, Tuple "UNLOCKED_EVENT" UnlockedEvent, Tuple "USER_BLOCKED_EVENT" UserBlockedEvent, Tuple "UNMARKED_AS_DUPLICATE_EVENT" UnmarkedAsDuplicateEvent, Tuple "UNPINNED_EVENT" UnpinnedEvent, Tuple "UNSUBSCRIBED_EVENT" UnsubscribedEvent]

instance pullRequestTimelineItemsItemTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PullRequestTimelineItemsItemType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestTimelineItemsItemType" fromToMap

instance pullRequestTimelineItemsItemTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue PullRequestTimelineItemsItemType where
  toGraphqlArgumentValue =
    case _ of
      PullRequestCommit -> ArgumentValueString "PULL_REQUEST_COMMIT"
      PullRequestCommitCommentThread -> ArgumentValueString "PULL_REQUEST_COMMIT_COMMENT_THREAD"
      PullRequestReview -> ArgumentValueString "PULL_REQUEST_REVIEW"
      PullRequestReviewThread -> ArgumentValueString "PULL_REQUEST_REVIEW_THREAD"
      PullRequestRevisionMarker -> ArgumentValueString "PULL_REQUEST_REVISION_MARKER"
      AutomaticBaseChangeFailedEvent -> ArgumentValueString "AUTOMATIC_BASE_CHANGE_FAILED_EVENT"
      AutomaticBaseChangeSucceededEvent -> ArgumentValueString "AUTOMATIC_BASE_CHANGE_SUCCEEDED_EVENT"
      BaseRefChangedEvent -> ArgumentValueString "BASE_REF_CHANGED_EVENT"
      BaseRefForcePushedEvent -> ArgumentValueString "BASE_REF_FORCE_PUSHED_EVENT"
      DeployedEvent -> ArgumentValueString "DEPLOYED_EVENT"
      DeploymentEnvironmentChangedEvent -> ArgumentValueString "DEPLOYMENT_ENVIRONMENT_CHANGED_EVENT"
      HeadRefDeletedEvent -> ArgumentValueString "HEAD_REF_DELETED_EVENT"
      HeadRefForcePushedEvent -> ArgumentValueString "HEAD_REF_FORCE_PUSHED_EVENT"
      HeadRefRestoredEvent -> ArgumentValueString "HEAD_REF_RESTORED_EVENT"
      MergedEvent -> ArgumentValueString "MERGED_EVENT"
      ReviewDismissedEvent -> ArgumentValueString "REVIEW_DISMISSED_EVENT"
      ReviewRequestedEvent -> ArgumentValueString "REVIEW_REQUESTED_EVENT"
      ReviewRequestRemovedEvent -> ArgumentValueString "REVIEW_REQUEST_REMOVED_EVENT"
      ReadyForReviewEvent -> ArgumentValueString "READY_FOR_REVIEW_EVENT"
      ConvertToDraftEvent -> ArgumentValueString "CONVERT_TO_DRAFT_EVENT"
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
