module Examples.Github.Union.PullRequestTimelineItem where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  ( Scope__AssignedEvent
  , Scope__BaseRefForcePushedEvent
  , Scope__ClosedEvent
  , Scope__Commit
  , Scope__CommitCommentThread
  , Scope__CrossReferencedEvent
  , Scope__DemilestonedEvent
  , Scope__DeployedEvent
  , Scope__DeploymentEnvironmentChangedEvent
  , Scope__HeadRefDeletedEvent
  , Scope__HeadRefForcePushedEvent
  , Scope__HeadRefRestoredEvent
  , Scope__IssueComment
  , Scope__LabeledEvent
  , Scope__LockedEvent
  , Scope__MergedEvent
  , Scope__MilestonedEvent
  , Scope__PullRequestReview
  , Scope__PullRequestReviewComment
  , Scope__PullRequestReviewThread
  , Scope__ReferencedEvent
  , Scope__RenamedTitleEvent
  , Scope__ReopenedEvent
  , Scope__ReviewDismissedEvent
  , Scope__ReviewRequestRemovedEvent
  , Scope__ReviewRequestedEvent
  , Scope__SubscribedEvent
  , Scope__UnassignedEvent
  , Scope__UnlabeledEvent
  , Scope__UnlockedEvent
  , Scope__UnsubscribedEvent
  , Scope__UserBlockedEvent
  , Scope__PullRequestTimelineItem
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo = { onAssignedEvent :: SelectionSet
                                                Scope__AssignedEvent
                                                decodesTo
                           , onBaseRefForcePushedEvent :: SelectionSet
                                                          Scope__BaseRefForcePushedEvent
                                                          decodesTo
                           , onClosedEvent :: SelectionSet
                                              Scope__ClosedEvent
                                              decodesTo
                           , onCommit :: SelectionSet Scope__Commit decodesTo
                           , onCommitCommentThread :: SelectionSet
                                                      Scope__CommitCommentThread
                                                      decodesTo
                           , onCrossReferencedEvent :: SelectionSet
                                                       Scope__CrossReferencedEvent
                                                       decodesTo
                           , onDemilestonedEvent :: SelectionSet
                                                    Scope__DemilestonedEvent
                                                    decodesTo
                           , onDeployedEvent :: SelectionSet
                                                Scope__DeployedEvent
                                                decodesTo
                           , onDeploymentEnvironmentChangedEvent :: SelectionSet
                                                                    Scope__DeploymentEnvironmentChangedEvent
                                                                    decodesTo
                           , onHeadRefDeletedEvent :: SelectionSet
                                                      Scope__HeadRefDeletedEvent
                                                      decodesTo
                           , onHeadRefForcePushedEvent :: SelectionSet
                                                          Scope__HeadRefForcePushedEvent
                                                          decodesTo
                           , onHeadRefRestoredEvent :: SelectionSet
                                                       Scope__HeadRefRestoredEvent
                                                       decodesTo
                           , onIssueComment :: SelectionSet
                                               Scope__IssueComment
                                               decodesTo
                           , onLabeledEvent :: SelectionSet
                                               Scope__LabeledEvent
                                               decodesTo
                           , onLockedEvent :: SelectionSet
                                              Scope__LockedEvent
                                              decodesTo
                           , onMergedEvent :: SelectionSet
                                              Scope__MergedEvent
                                              decodesTo
                           , onMilestonedEvent :: SelectionSet
                                                  Scope__MilestonedEvent
                                                  decodesTo
                           , onPullRequestReview :: SelectionSet
                                                    Scope__PullRequestReview
                                                    decodesTo
                           , onPullRequestReviewComment :: SelectionSet
                                                           Scope__PullRequestReviewComment
                                                           decodesTo
                           , onPullRequestReviewThread :: SelectionSet
                                                          Scope__PullRequestReviewThread
                                                          decodesTo
                           , onReferencedEvent :: SelectionSet
                                                  Scope__ReferencedEvent
                                                  decodesTo
                           , onRenamedTitleEvent :: SelectionSet
                                                    Scope__RenamedTitleEvent
                                                    decodesTo
                           , onReopenedEvent :: SelectionSet
                                                Scope__ReopenedEvent
                                                decodesTo
                           , onReviewDismissedEvent :: SelectionSet
                                                       Scope__ReviewDismissedEvent
                                                       decodesTo
                           , onReviewRequestRemovedEvent :: SelectionSet
                                                            Scope__ReviewRequestRemovedEvent
                                                            decodesTo
                           , onReviewRequestedEvent :: SelectionSet
                                                       Scope__ReviewRequestedEvent
                                                       decodesTo
                           , onSubscribedEvent :: SelectionSet
                                                  Scope__SubscribedEvent
                                                  decodesTo
                           , onUnassignedEvent :: SelectionSet
                                                  Scope__UnassignedEvent
                                                  decodesTo
                           , onUnlabeledEvent :: SelectionSet
                                                 Scope__UnlabeledEvent
                                                 decodesTo
                           , onUnlockedEvent :: SelectionSet
                                                Scope__UnlockedEvent
                                                decodesTo
                           , onUnsubscribedEvent :: SelectionSet
                                                    Scope__UnsubscribedEvent
                                                    decodesTo
                           , onUserBlockedEvent :: SelectionSet
                                                   Scope__UserBlockedEvent
                                                   decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__PullRequestTimelineItem
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "AssignedEvent"
                         selections.onAssignedEvent
                       , buildFragment
                         "BaseRefForcePushedEvent"
                         selections.onBaseRefForcePushedEvent
                       , buildFragment "ClosedEvent" selections.onClosedEvent
                       , buildFragment "Commit" selections.onCommit
                       , buildFragment
                         "CommitCommentThread"
                         selections.onCommitCommentThread
                       , buildFragment
                         "CrossReferencedEvent"
                         selections.onCrossReferencedEvent
                       , buildFragment
                         "DemilestonedEvent"
                         selections.onDemilestonedEvent
                       , buildFragment
                         "DeployedEvent"
                         selections.onDeployedEvent
                       , buildFragment
                         "DeploymentEnvironmentChangedEvent"
                         selections.onDeploymentEnvironmentChangedEvent
                       , buildFragment
                         "HeadRefDeletedEvent"
                         selections.onHeadRefDeletedEvent
                       , buildFragment
                         "HeadRefForcePushedEvent"
                         selections.onHeadRefForcePushedEvent
                       , buildFragment
                         "HeadRefRestoredEvent"
                         selections.onHeadRefRestoredEvent
                       , buildFragment "IssueComment" selections.onIssueComment
                       , buildFragment "LabeledEvent" selections.onLabeledEvent
                       , buildFragment "LockedEvent" selections.onLockedEvent
                       , buildFragment "MergedEvent" selections.onMergedEvent
                       , buildFragment
                         "MilestonedEvent"
                         selections.onMilestonedEvent
                       , buildFragment
                         "PullRequestReview"
                         selections.onPullRequestReview
                       , buildFragment
                         "PullRequestReviewComment"
                         selections.onPullRequestReviewComment
                       , buildFragment
                         "PullRequestReviewThread"
                         selections.onPullRequestReviewThread
                       , buildFragment
                         "ReferencedEvent"
                         selections.onReferencedEvent
                       , buildFragment
                         "RenamedTitleEvent"
                         selections.onRenamedTitleEvent
                       , buildFragment
                         "ReopenedEvent"
                         selections.onReopenedEvent
                       , buildFragment
                         "ReviewDismissedEvent"
                         selections.onReviewDismissedEvent
                       , buildFragment
                         "ReviewRequestRemovedEvent"
                         selections.onReviewRequestRemovedEvent
                       , buildFragment
                         "ReviewRequestedEvent"
                         selections.onReviewRequestedEvent
                       , buildFragment
                         "SubscribedEvent"
                         selections.onSubscribedEvent
                       , buildFragment
                         "UnassignedEvent"
                         selections.onUnassignedEvent
                       , buildFragment
                         "UnlabeledEvent"
                         selections.onUnlabeledEvent
                       , buildFragment
                         "UnlockedEvent"
                         selections.onUnlockedEvent
                       , buildFragment
                         "UnsubscribedEvent"
                         selections.onUnsubscribedEvent
                       , buildFragment
                         "UserBlockedEvent"
                         selections.onUserBlockedEvent
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onAssignedEvent: pure
                                    Nothing
                 , onBaseRefForcePushedEvent: pure
                                              Nothing
                 , onClosedEvent: pure
                                  Nothing
                 , onCommit: pure
                             Nothing
                 , onCommitCommentThread: pure
                                          Nothing
                 , onCrossReferencedEvent: pure
                                           Nothing
                 , onDemilestonedEvent: pure
                                        Nothing
                 , onDeployedEvent: pure
                                    Nothing
                 , onDeploymentEnvironmentChangedEvent: pure
                                                        Nothing
                 , onHeadRefDeletedEvent: pure
                                          Nothing
                 , onHeadRefForcePushedEvent: pure
                                              Nothing
                 , onHeadRefRestoredEvent: pure
                                           Nothing
                 , onIssueComment: pure
                                   Nothing
                 , onLabeledEvent: pure
                                   Nothing
                 , onLockedEvent: pure
                                  Nothing
                 , onMergedEvent: pure
                                  Nothing
                 , onMilestonedEvent: pure
                                      Nothing
                 , onPullRequestReview: pure
                                        Nothing
                 , onPullRequestReviewComment: pure
                                               Nothing
                 , onPullRequestReviewThread: pure
                                              Nothing
                 , onReferencedEvent: pure
                                      Nothing
                 , onRenamedTitleEvent: pure
                                        Nothing
                 , onReopenedEvent: pure
                                    Nothing
                 , onReviewDismissedEvent: pure
                                           Nothing
                 , onReviewRequestRemovedEvent: pure
                                                Nothing
                 , onReviewRequestedEvent: pure
                                           Nothing
                 , onSubscribedEvent: pure
                                      Nothing
                 , onUnassignedEvent: pure
                                      Nothing
                 , onUnlabeledEvent: pure
                                     Nothing
                 , onUnlockedEvent: pure
                                    Nothing
                 , onUnsubscribedEvent: pure
                                        Nothing
                 , onUserBlockedEvent: pure
                                       Nothing
                 }
