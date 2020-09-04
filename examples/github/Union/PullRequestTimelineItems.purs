module Examples.Github.Union.PullRequestTimelineItems where

import GraphqlClient
  ( SelectionSet
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__AddedToProjectEvent
  , Scope__AssignedEvent
  , Scope__AutomaticBaseChangeFailedEvent
  , Scope__AutomaticBaseChangeSucceededEvent
  , Scope__BaseRefChangedEvent
  , Scope__BaseRefForcePushedEvent
  , Scope__ClosedEvent
  , Scope__CommentDeletedEvent
  , Scope__ConnectedEvent
  , Scope__ConvertToDraftEvent
  , Scope__ConvertedNoteToIssueEvent
  , Scope__CrossReferencedEvent
  , Scope__DemilestonedEvent
  , Scope__DeployedEvent
  , Scope__DeploymentEnvironmentChangedEvent
  , Scope__DisconnectedEvent
  , Scope__HeadRefDeletedEvent
  , Scope__HeadRefForcePushedEvent
  , Scope__HeadRefRestoredEvent
  , Scope__IssueComment
  , Scope__LabeledEvent
  , Scope__LockedEvent
  , Scope__MarkedAsDuplicateEvent
  , Scope__MentionedEvent
  , Scope__MergedEvent
  , Scope__MilestonedEvent
  , Scope__MovedColumnsInProjectEvent
  , Scope__PinnedEvent
  , Scope__PullRequestCommit
  , Scope__PullRequestCommitCommentThread
  , Scope__PullRequestReview
  , Scope__PullRequestReviewThread
  , Scope__PullRequestRevisionMarker
  , Scope__ReadyForReviewEvent
  , Scope__ReferencedEvent
  , Scope__RemovedFromProjectEvent
  , Scope__RenamedTitleEvent
  , Scope__ReopenedEvent
  , Scope__ReviewDismissedEvent
  , Scope__ReviewRequestRemovedEvent
  , Scope__ReviewRequestedEvent
  , Scope__SubscribedEvent
  , Scope__TransferredEvent
  , Scope__UnassignedEvent
  , Scope__UnlabeledEvent
  , Scope__UnlockedEvent
  , Scope__UnmarkedAsDuplicateEvent
  , Scope__UnpinnedEvent
  , Scope__UnsubscribedEvent
  , Scope__UserBlockedEvent
  , Scope__PullRequestTimelineItems
  )
import Data.Maybe
  ( Maybe(..)
  )
import Prelude
  ( pure
  )

type Fragments decodesTo = { onAddedToProjectEvent :: SelectionSet Scope__AddedToProjectEvent decodesTo
                           , onAssignedEvent :: SelectionSet Scope__AssignedEvent decodesTo
                           , onAutomaticBaseChangeFailedEvent :: SelectionSet Scope__AutomaticBaseChangeFailedEvent decodesTo
                           , onAutomaticBaseChangeSucceededEvent :: SelectionSet Scope__AutomaticBaseChangeSucceededEvent decodesTo
                           , onBaseRefChangedEvent :: SelectionSet Scope__BaseRefChangedEvent decodesTo
                           , onBaseRefForcePushedEvent :: SelectionSet Scope__BaseRefForcePushedEvent decodesTo
                           , onClosedEvent :: SelectionSet Scope__ClosedEvent decodesTo
                           , onCommentDeletedEvent :: SelectionSet Scope__CommentDeletedEvent decodesTo
                           , onConnectedEvent :: SelectionSet Scope__ConnectedEvent decodesTo
                           , onConvertToDraftEvent :: SelectionSet Scope__ConvertToDraftEvent decodesTo
                           , onConvertedNoteToIssueEvent :: SelectionSet Scope__ConvertedNoteToIssueEvent decodesTo
                           , onCrossReferencedEvent :: SelectionSet Scope__CrossReferencedEvent decodesTo
                           , onDemilestonedEvent :: SelectionSet Scope__DemilestonedEvent decodesTo
                           , onDeployedEvent :: SelectionSet Scope__DeployedEvent decodesTo
                           , onDeploymentEnvironmentChangedEvent :: SelectionSet Scope__DeploymentEnvironmentChangedEvent decodesTo
                           , onDisconnectedEvent :: SelectionSet Scope__DisconnectedEvent decodesTo
                           , onHeadRefDeletedEvent :: SelectionSet Scope__HeadRefDeletedEvent decodesTo
                           , onHeadRefForcePushedEvent :: SelectionSet Scope__HeadRefForcePushedEvent decodesTo
                           , onHeadRefRestoredEvent :: SelectionSet Scope__HeadRefRestoredEvent decodesTo
                           , onIssueComment :: SelectionSet Scope__IssueComment decodesTo
                           , onLabeledEvent :: SelectionSet Scope__LabeledEvent decodesTo
                           , onLockedEvent :: SelectionSet Scope__LockedEvent decodesTo
                           , onMarkedAsDuplicateEvent :: SelectionSet Scope__MarkedAsDuplicateEvent decodesTo
                           , onMentionedEvent :: SelectionSet Scope__MentionedEvent decodesTo
                           , onMergedEvent :: SelectionSet Scope__MergedEvent decodesTo
                           , onMilestonedEvent :: SelectionSet Scope__MilestonedEvent decodesTo
                           , onMovedColumnsInProjectEvent :: SelectionSet Scope__MovedColumnsInProjectEvent decodesTo
                           , onPinnedEvent :: SelectionSet Scope__PinnedEvent decodesTo
                           , onPullRequestCommit :: SelectionSet Scope__PullRequestCommit decodesTo
                           , onPullRequestCommitCommentThread :: SelectionSet Scope__PullRequestCommitCommentThread decodesTo
                           , onPullRequestReview :: SelectionSet Scope__PullRequestReview decodesTo
                           , onPullRequestReviewThread :: SelectionSet Scope__PullRequestReviewThread decodesTo
                           , onPullRequestRevisionMarker :: SelectionSet Scope__PullRequestRevisionMarker decodesTo
                           , onReadyForReviewEvent :: SelectionSet Scope__ReadyForReviewEvent decodesTo
                           , onReferencedEvent :: SelectionSet Scope__ReferencedEvent decodesTo
                           , onRemovedFromProjectEvent :: SelectionSet Scope__RemovedFromProjectEvent decodesTo
                           , onRenamedTitleEvent :: SelectionSet Scope__RenamedTitleEvent decodesTo
                           , onReopenedEvent :: SelectionSet Scope__ReopenedEvent decodesTo
                           , onReviewDismissedEvent :: SelectionSet Scope__ReviewDismissedEvent decodesTo
                           , onReviewRequestRemovedEvent :: SelectionSet Scope__ReviewRequestRemovedEvent decodesTo
                           , onReviewRequestedEvent :: SelectionSet Scope__ReviewRequestedEvent decodesTo
                           , onSubscribedEvent :: SelectionSet Scope__SubscribedEvent decodesTo
                           , onTransferredEvent :: SelectionSet Scope__TransferredEvent decodesTo
                           , onUnassignedEvent :: SelectionSet Scope__UnassignedEvent decodesTo
                           , onUnlabeledEvent :: SelectionSet Scope__UnlabeledEvent decodesTo
                           , onUnlockedEvent :: SelectionSet Scope__UnlockedEvent decodesTo
                           , onUnmarkedAsDuplicateEvent :: SelectionSet Scope__UnmarkedAsDuplicateEvent decodesTo
                           , onUnpinnedEvent :: SelectionSet Scope__UnpinnedEvent decodesTo
                           , onUnsubscribedEvent :: SelectionSet Scope__UnsubscribedEvent decodesTo
                           , onUserBlockedEvent :: SelectionSet Scope__UserBlockedEvent decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__PullRequestTimelineItems decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "AddedToProjectEvent" selections.onAddedToProjectEvent, buildFragment "AssignedEvent" selections.onAssignedEvent, buildFragment "AutomaticBaseChangeFailedEvent" selections.onAutomaticBaseChangeFailedEvent, buildFragment "AutomaticBaseChangeSucceededEvent" selections.onAutomaticBaseChangeSucceededEvent, buildFragment "BaseRefChangedEvent" selections.onBaseRefChangedEvent, buildFragment "BaseRefForcePushedEvent" selections.onBaseRefForcePushedEvent, buildFragment "ClosedEvent" selections.onClosedEvent, buildFragment "CommentDeletedEvent" selections.onCommentDeletedEvent, buildFragment "ConnectedEvent" selections.onConnectedEvent, buildFragment "ConvertToDraftEvent" selections.onConvertToDraftEvent, buildFragment "ConvertedNoteToIssueEvent" selections.onConvertedNoteToIssueEvent, buildFragment "CrossReferencedEvent" selections.onCrossReferencedEvent, buildFragment "DemilestonedEvent" selections.onDemilestonedEvent, buildFragment "DeployedEvent" selections.onDeployedEvent, buildFragment "DeploymentEnvironmentChangedEvent" selections.onDeploymentEnvironmentChangedEvent, buildFragment "DisconnectedEvent" selections.onDisconnectedEvent, buildFragment "HeadRefDeletedEvent" selections.onHeadRefDeletedEvent, buildFragment "HeadRefForcePushedEvent" selections.onHeadRefForcePushedEvent, buildFragment "HeadRefRestoredEvent" selections.onHeadRefRestoredEvent, buildFragment "IssueComment" selections.onIssueComment, buildFragment "LabeledEvent" selections.onLabeledEvent, buildFragment "LockedEvent" selections.onLockedEvent, buildFragment "MarkedAsDuplicateEvent" selections.onMarkedAsDuplicateEvent, buildFragment "MentionedEvent" selections.onMentionedEvent, buildFragment "MergedEvent" selections.onMergedEvent, buildFragment "MilestonedEvent" selections.onMilestonedEvent, buildFragment "MovedColumnsInProjectEvent" selections.onMovedColumnsInProjectEvent, buildFragment "PinnedEvent" selections.onPinnedEvent, buildFragment "PullRequestCommit" selections.onPullRequestCommit, buildFragment "PullRequestCommitCommentThread" selections.onPullRequestCommitCommentThread, buildFragment "PullRequestReview" selections.onPullRequestReview, buildFragment "PullRequestReviewThread" selections.onPullRequestReviewThread, buildFragment "PullRequestRevisionMarker" selections.onPullRequestRevisionMarker, buildFragment "ReadyForReviewEvent" selections.onReadyForReviewEvent, buildFragment "ReferencedEvent" selections.onReferencedEvent, buildFragment "RemovedFromProjectEvent" selections.onRemovedFromProjectEvent, buildFragment "RenamedTitleEvent" selections.onRenamedTitleEvent, buildFragment "ReopenedEvent" selections.onReopenedEvent, buildFragment "ReviewDismissedEvent" selections.onReviewDismissedEvent, buildFragment "ReviewRequestRemovedEvent" selections.onReviewRequestRemovedEvent, buildFragment "ReviewRequestedEvent" selections.onReviewRequestedEvent, buildFragment "SubscribedEvent" selections.onSubscribedEvent, buildFragment "TransferredEvent" selections.onTransferredEvent, buildFragment "UnassignedEvent" selections.onUnassignedEvent, buildFragment "UnlabeledEvent" selections.onUnlabeledEvent, buildFragment "UnlockedEvent" selections.onUnlockedEvent, buildFragment "UnmarkedAsDuplicateEvent" selections.onUnmarkedAsDuplicateEvent, buildFragment "UnpinnedEvent" selections.onUnpinnedEvent, buildFragment "UnsubscribedEvent" selections.onUnsubscribedEvent, buildFragment "UserBlockedEvent" selections.onUserBlockedEvent]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onAddedToProjectEvent: pure Nothing, onAssignedEvent: pure Nothing, onAutomaticBaseChangeFailedEvent: pure Nothing, onAutomaticBaseChangeSucceededEvent: pure Nothing, onBaseRefChangedEvent: pure Nothing, onBaseRefForcePushedEvent: pure Nothing, onClosedEvent: pure Nothing, onCommentDeletedEvent: pure Nothing, onConnectedEvent: pure Nothing, onConvertToDraftEvent: pure Nothing, onConvertedNoteToIssueEvent: pure Nothing, onCrossReferencedEvent: pure Nothing, onDemilestonedEvent: pure Nothing, onDeployedEvent: pure Nothing, onDeploymentEnvironmentChangedEvent: pure Nothing, onDisconnectedEvent: pure Nothing, onHeadRefDeletedEvent: pure Nothing, onHeadRefForcePushedEvent: pure Nothing, onHeadRefRestoredEvent: pure Nothing, onIssueComment: pure Nothing, onLabeledEvent: pure Nothing, onLockedEvent: pure Nothing, onMarkedAsDuplicateEvent: pure Nothing, onMentionedEvent: pure Nothing, onMergedEvent: pure Nothing, onMilestonedEvent: pure Nothing, onMovedColumnsInProjectEvent: pure Nothing, onPinnedEvent: pure Nothing, onPullRequestCommit: pure Nothing, onPullRequestCommitCommentThread: pure Nothing, onPullRequestReview: pure Nothing, onPullRequestReviewThread: pure Nothing, onPullRequestRevisionMarker: pure Nothing, onReadyForReviewEvent: pure Nothing, onReferencedEvent: pure Nothing, onRemovedFromProjectEvent: pure Nothing, onRenamedTitleEvent: pure Nothing, onReopenedEvent: pure Nothing, onReviewDismissedEvent: pure Nothing, onReviewRequestRemovedEvent: pure Nothing, onReviewRequestedEvent: pure Nothing, onSubscribedEvent: pure Nothing, onTransferredEvent: pure Nothing, onUnassignedEvent: pure Nothing, onUnlabeledEvent: pure Nothing, onUnlockedEvent: pure Nothing, onUnmarkedAsDuplicateEvent: pure Nothing, onUnpinnedEvent: pure Nothing, onUnsubscribedEvent: pure Nothing, onUserBlockedEvent: pure Nothing }
