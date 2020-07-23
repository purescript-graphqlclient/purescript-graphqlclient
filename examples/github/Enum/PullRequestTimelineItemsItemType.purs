module Examples.Github.Enum.PullRequestTimelineItemsItemType where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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

derive instance eqPullRequestTimelineItemsItemType :: Eq PullRequestTimelineItemsItemType

derive instance ordPullRequestTimelineItemsItemType :: Ord PullRequestTimelineItemsItemType

fromToMap :: Array (Tuple String PullRequestTimelineItemsItemType)
fromToMap = [Tuple "PULL_REQUEST_COMMIT" PullRequestCommit, Tuple "PULL_REQUEST_COMMIT_COMMENT_THREAD" PullRequestCommitCommentThread, Tuple "PULL_REQUEST_REVIEW" PullRequestReview, Tuple "PULL_REQUEST_REVIEW_THREAD" PullRequestReviewThread, Tuple "PULL_REQUEST_REVISION_MARKER" PullRequestRevisionMarker, Tuple "AUTOMATIC_BASE_CHANGE_FAILED_EVENT" AutomaticBaseChangeFailedEvent, Tuple "AUTOMATIC_BASE_CHANGE_SUCCEEDED_EVENT" AutomaticBaseChangeSucceededEvent, Tuple "BASE_REF_CHANGED_EVENT" BaseRefChangedEvent, Tuple "BASE_REF_FORCE_PUSHED_EVENT" BaseRefForcePushedEvent, Tuple "DEPLOYED_EVENT" DeployedEvent, Tuple "DEPLOYMENT_ENVIRONMENT_CHANGED_EVENT" DeploymentEnvironmentChangedEvent, Tuple "HEAD_REF_DELETED_EVENT" HeadRefDeletedEvent, Tuple "HEAD_REF_FORCE_PUSHED_EVENT" HeadRefForcePushedEvent, Tuple "HEAD_REF_RESTORED_EVENT" HeadRefRestoredEvent, Tuple "MERGED_EVENT" MergedEvent, Tuple "REVIEW_DISMISSED_EVENT" ReviewDismissedEvent, Tuple "REVIEW_REQUESTED_EVENT" ReviewRequestedEvent, Tuple "REVIEW_REQUEST_REMOVED_EVENT" ReviewRequestRemovedEvent, Tuple "READY_FOR_REVIEW_EVENT" ReadyForReviewEvent, Tuple "CONVERT_TO_DRAFT_EVENT" ConvertToDraftEvent, Tuple "ISSUE_COMMENT" IssueComment, Tuple "CROSS_REFERENCED_EVENT" CrossReferencedEvent, Tuple "ADDED_TO_PROJECT_EVENT" AddedToProjectEvent, Tuple "ASSIGNED_EVENT" AssignedEvent, Tuple "CLOSED_EVENT" ClosedEvent, Tuple "COMMENT_DELETED_EVENT" CommentDeletedEvent, Tuple "CONNECTED_EVENT" ConnectedEvent, Tuple "CONVERTED_NOTE_TO_ISSUE_EVENT" ConvertedNoteToIssueEvent, Tuple "DEMILESTONED_EVENT" DemilestonedEvent, Tuple "DISCONNECTED_EVENT" DisconnectedEvent, Tuple "LABELED_EVENT" LabeledEvent, Tuple "LOCKED_EVENT" LockedEvent, Tuple "MARKED_AS_DUPLICATE_EVENT" MarkedAsDuplicateEvent, Tuple "MENTIONED_EVENT" MentionedEvent, Tuple "MILESTONED_EVENT" MilestonedEvent, Tuple "MOVED_COLUMNS_IN_PROJECT_EVENT" MovedColumnsInProjectEvent, Tuple "PINNED_EVENT" PinnedEvent, Tuple "REFERENCED_EVENT" ReferencedEvent, Tuple "REMOVED_FROM_PROJECT_EVENT" RemovedFromProjectEvent, Tuple "RENAMED_TITLE_EVENT" RenamedTitleEvent, Tuple "REOPENED_EVENT" ReopenedEvent, Tuple "SUBSCRIBED_EVENT" SubscribedEvent, Tuple "TRANSFERRED_EVENT" TransferredEvent, Tuple "UNASSIGNED_EVENT" UnassignedEvent, Tuple "UNLABELED_EVENT" UnlabeledEvent, Tuple "UNLOCKED_EVENT" UnlockedEvent, Tuple "USER_BLOCKED_EVENT" UserBlockedEvent, Tuple "UNMARKED_AS_DUPLICATE_EVENT" UnmarkedAsDuplicateEvent, Tuple "UNPINNED_EVENT" UnpinnedEvent, Tuple "UNSUBSCRIBED_EVENT" UnsubscribedEvent]

instance pullRequestTimelineItemsItemTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PullRequestTimelineItemsItemType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PullRequestTimelineItemsItemType" fromToMap

instance pullRequestTimelineItemsItemTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue PullRequestTimelineItemsItemType where
  toGraphqlArgumentValue =
    case _ of
      PullRequestCommit -> ArgumentValueEnum "PULL_REQUEST_COMMIT"
      PullRequestCommitCommentThread -> ArgumentValueEnum "PULL_REQUEST_COMMIT_COMMENT_THREAD"
      PullRequestReview -> ArgumentValueEnum "PULL_REQUEST_REVIEW"
      PullRequestReviewThread -> ArgumentValueEnum "PULL_REQUEST_REVIEW_THREAD"
      PullRequestRevisionMarker -> ArgumentValueEnum "PULL_REQUEST_REVISION_MARKER"
      AutomaticBaseChangeFailedEvent -> ArgumentValueEnum "AUTOMATIC_BASE_CHANGE_FAILED_EVENT"
      AutomaticBaseChangeSucceededEvent -> ArgumentValueEnum "AUTOMATIC_BASE_CHANGE_SUCCEEDED_EVENT"
      BaseRefChangedEvent -> ArgumentValueEnum "BASE_REF_CHANGED_EVENT"
      BaseRefForcePushedEvent -> ArgumentValueEnum "BASE_REF_FORCE_PUSHED_EVENT"
      DeployedEvent -> ArgumentValueEnum "DEPLOYED_EVENT"
      DeploymentEnvironmentChangedEvent -> ArgumentValueEnum "DEPLOYMENT_ENVIRONMENT_CHANGED_EVENT"
      HeadRefDeletedEvent -> ArgumentValueEnum "HEAD_REF_DELETED_EVENT"
      HeadRefForcePushedEvent -> ArgumentValueEnum "HEAD_REF_FORCE_PUSHED_EVENT"
      HeadRefRestoredEvent -> ArgumentValueEnum "HEAD_REF_RESTORED_EVENT"
      MergedEvent -> ArgumentValueEnum "MERGED_EVENT"
      ReviewDismissedEvent -> ArgumentValueEnum "REVIEW_DISMISSED_EVENT"
      ReviewRequestedEvent -> ArgumentValueEnum "REVIEW_REQUESTED_EVENT"
      ReviewRequestRemovedEvent -> ArgumentValueEnum "REVIEW_REQUEST_REMOVED_EVENT"
      ReadyForReviewEvent -> ArgumentValueEnum "READY_FOR_REVIEW_EVENT"
      ConvertToDraftEvent -> ArgumentValueEnum "CONVERT_TO_DRAFT_EVENT"
      IssueComment -> ArgumentValueEnum "ISSUE_COMMENT"
      CrossReferencedEvent -> ArgumentValueEnum "CROSS_REFERENCED_EVENT"
      AddedToProjectEvent -> ArgumentValueEnum "ADDED_TO_PROJECT_EVENT"
      AssignedEvent -> ArgumentValueEnum "ASSIGNED_EVENT"
      ClosedEvent -> ArgumentValueEnum "CLOSED_EVENT"
      CommentDeletedEvent -> ArgumentValueEnum "COMMENT_DELETED_EVENT"
      ConnectedEvent -> ArgumentValueEnum "CONNECTED_EVENT"
      ConvertedNoteToIssueEvent -> ArgumentValueEnum "CONVERTED_NOTE_TO_ISSUE_EVENT"
      DemilestonedEvent -> ArgumentValueEnum "DEMILESTONED_EVENT"
      DisconnectedEvent -> ArgumentValueEnum "DISCONNECTED_EVENT"
      LabeledEvent -> ArgumentValueEnum "LABELED_EVENT"
      LockedEvent -> ArgumentValueEnum "LOCKED_EVENT"
      MarkedAsDuplicateEvent -> ArgumentValueEnum "MARKED_AS_DUPLICATE_EVENT"
      MentionedEvent -> ArgumentValueEnum "MENTIONED_EVENT"
      MilestonedEvent -> ArgumentValueEnum "MILESTONED_EVENT"
      MovedColumnsInProjectEvent -> ArgumentValueEnum "MOVED_COLUMNS_IN_PROJECT_EVENT"
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
      UnmarkedAsDuplicateEvent -> ArgumentValueEnum "UNMARKED_AS_DUPLICATE_EVENT"
      UnpinnedEvent -> ArgumentValueEnum "UNPINNED_EVENT"
      UnsubscribedEvent -> ArgumentValueEnum "UNSUBSCRIBED_EVENT"
