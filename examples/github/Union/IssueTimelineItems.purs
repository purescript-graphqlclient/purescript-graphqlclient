module Examples.Github.Union.IssueTimelineItems where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  ( Scope__AddedToProjectEvent
  , Scope__AssignedEvent
  , Scope__ClosedEvent
  , Scope__CommentDeletedEvent
  , Scope__ConnectedEvent
  , Scope__ConvertedNoteToIssueEvent
  , Scope__CrossReferencedEvent
  , Scope__DemilestonedEvent
  , Scope__DisconnectedEvent
  , Scope__IssueComment
  , Scope__LabeledEvent
  , Scope__LockedEvent
  , Scope__MarkedAsDuplicateEvent
  , Scope__MentionedEvent
  , Scope__MilestonedEvent
  , Scope__MovedColumnsInProjectEvent
  , Scope__PinnedEvent
  , Scope__ReferencedEvent
  , Scope__RemovedFromProjectEvent
  , Scope__RenamedTitleEvent
  , Scope__ReopenedEvent
  , Scope__SubscribedEvent
  , Scope__TransferredEvent
  , Scope__UnassignedEvent
  , Scope__UnlabeledEvent
  , Scope__UnlockedEvent
  , Scope__UnmarkedAsDuplicateEvent
  , Scope__UnpinnedEvent
  , Scope__UnsubscribedEvent
  , Scope__UserBlockedEvent
  , Scope__IssueTimelineItems
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onAddedToProjectEvent :: SelectionSet Scope__AddedToProjectEvent decodesTo
    , onAssignedEvent :: SelectionSet Scope__AssignedEvent decodesTo
    , onClosedEvent :: SelectionSet Scope__ClosedEvent decodesTo
    , onCommentDeletedEvent :: SelectionSet Scope__CommentDeletedEvent decodesTo
    , onConnectedEvent :: SelectionSet Scope__ConnectedEvent decodesTo
    , onConvertedNoteToIssueEvent
      :: SelectionSet
         Scope__ConvertedNoteToIssueEvent
         decodesTo
    , onCrossReferencedEvent
      :: SelectionSet
         Scope__CrossReferencedEvent
         decodesTo
    , onDemilestonedEvent :: SelectionSet Scope__DemilestonedEvent decodesTo
    , onDisconnectedEvent :: SelectionSet Scope__DisconnectedEvent decodesTo
    , onIssueComment :: SelectionSet Scope__IssueComment decodesTo
    , onLabeledEvent :: SelectionSet Scope__LabeledEvent decodesTo
    , onLockedEvent :: SelectionSet Scope__LockedEvent decodesTo
    , onMarkedAsDuplicateEvent
      :: SelectionSet
         Scope__MarkedAsDuplicateEvent
         decodesTo
    , onMentionedEvent :: SelectionSet Scope__MentionedEvent decodesTo
    , onMilestonedEvent :: SelectionSet Scope__MilestonedEvent decodesTo
    , onMovedColumnsInProjectEvent
      :: SelectionSet
         Scope__MovedColumnsInProjectEvent
         decodesTo
    , onPinnedEvent :: SelectionSet Scope__PinnedEvent decodesTo
    , onReferencedEvent :: SelectionSet Scope__ReferencedEvent decodesTo
    , onRemovedFromProjectEvent
      :: SelectionSet
         Scope__RemovedFromProjectEvent
         decodesTo
    , onRenamedTitleEvent :: SelectionSet Scope__RenamedTitleEvent decodesTo
    , onReopenedEvent :: SelectionSet Scope__ReopenedEvent decodesTo
    , onSubscribedEvent :: SelectionSet Scope__SubscribedEvent decodesTo
    , onTransferredEvent :: SelectionSet Scope__TransferredEvent decodesTo
    , onUnassignedEvent :: SelectionSet Scope__UnassignedEvent decodesTo
    , onUnlabeledEvent :: SelectionSet Scope__UnlabeledEvent decodesTo
    , onUnlockedEvent :: SelectionSet Scope__UnlockedEvent decodesTo
    , onUnmarkedAsDuplicateEvent
      :: SelectionSet
         Scope__UnmarkedAsDuplicateEvent
         decodesTo
    , onUnpinnedEvent :: SelectionSet Scope__UnpinnedEvent decodesTo
    , onUnsubscribedEvent :: SelectionSet Scope__UnsubscribedEvent decodesTo
    , onUserBlockedEvent :: SelectionSet Scope__UserBlockedEvent decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__IssueTimelineItems decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "AddedToProjectEvent"
                         selections.onAddedToProjectEvent
                       , buildFragment
                         "AssignedEvent"
                         selections.onAssignedEvent
                       , buildFragment "ClosedEvent" selections.onClosedEvent
                       , buildFragment
                         "CommentDeletedEvent"
                         selections.onCommentDeletedEvent
                       , buildFragment
                         "ConnectedEvent"
                         selections.onConnectedEvent
                       , buildFragment
                         "ConvertedNoteToIssueEvent"
                         selections.onConvertedNoteToIssueEvent
                       , buildFragment
                         "CrossReferencedEvent"
                         selections.onCrossReferencedEvent
                       , buildFragment
                         "DemilestonedEvent"
                         selections.onDemilestonedEvent
                       , buildFragment
                         "DisconnectedEvent"
                         selections.onDisconnectedEvent
                       , buildFragment "IssueComment" selections.onIssueComment
                       , buildFragment "LabeledEvent" selections.onLabeledEvent
                       , buildFragment "LockedEvent" selections.onLockedEvent
                       , buildFragment
                         "MarkedAsDuplicateEvent"
                         selections.onMarkedAsDuplicateEvent
                       , buildFragment
                         "MentionedEvent"
                         selections.onMentionedEvent
                       , buildFragment
                         "MilestonedEvent"
                         selections.onMilestonedEvent
                       , buildFragment
                         "MovedColumnsInProjectEvent"
                         selections.onMovedColumnsInProjectEvent
                       , buildFragment "PinnedEvent" selections.onPinnedEvent
                       , buildFragment
                         "ReferencedEvent"
                         selections.onReferencedEvent
                       , buildFragment
                         "RemovedFromProjectEvent"
                         selections.onRemovedFromProjectEvent
                       , buildFragment
                         "RenamedTitleEvent"
                         selections.onRenamedTitleEvent
                       , buildFragment
                         "ReopenedEvent"
                         selections.onReopenedEvent
                       , buildFragment
                         "SubscribedEvent"
                         selections.onSubscribedEvent
                       , buildFragment
                         "TransferredEvent"
                         selections.onTransferredEvent
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
                         "UnmarkedAsDuplicateEvent"
                         selections.onUnmarkedAsDuplicateEvent
                       , buildFragment
                         "UnpinnedEvent"
                         selections.onUnpinnedEvent
                       , buildFragment
                         "UnsubscribedEvent"
                         selections.onUnsubscribedEvent
                       , buildFragment
                         "UserBlockedEvent"
                         selections.onUserBlockedEvent
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onAddedToProjectEvent: pure
                                          Nothing
                 , onAssignedEvent: pure
                                    Nothing
                 , onClosedEvent: pure
                                  Nothing
                 , onCommentDeletedEvent: pure
                                          Nothing
                 , onConnectedEvent: pure
                                     Nothing
                 , onConvertedNoteToIssueEvent: pure
                                                Nothing
                 , onCrossReferencedEvent: pure
                                           Nothing
                 , onDemilestonedEvent: pure
                                        Nothing
                 , onDisconnectedEvent: pure
                                        Nothing
                 , onIssueComment: pure
                                   Nothing
                 , onLabeledEvent: pure
                                   Nothing
                 , onLockedEvent: pure
                                  Nothing
                 , onMarkedAsDuplicateEvent: pure
                                             Nothing
                 , onMentionedEvent: pure
                                     Nothing
                 , onMilestonedEvent: pure
                                      Nothing
                 , onMovedColumnsInProjectEvent: pure
                                                 Nothing
                 , onPinnedEvent: pure
                                  Nothing
                 , onReferencedEvent: pure
                                      Nothing
                 , onRemovedFromProjectEvent: pure
                                              Nothing
                 , onRenamedTitleEvent: pure
                                        Nothing
                 , onReopenedEvent: pure
                                    Nothing
                 , onSubscribedEvent: pure
                                      Nothing
                 , onTransferredEvent: pure
                                       Nothing
                 , onUnassignedEvent: pure
                                      Nothing
                 , onUnlabeledEvent: pure
                                     Nothing
                 , onUnlockedEvent: pure
                                    Nothing
                 , onUnmarkedAsDuplicateEvent: pure
                                               Nothing
                 , onUnpinnedEvent: pure
                                    Nothing
                 , onUnsubscribedEvent: pure
                                        Nothing
                 , onUserBlockedEvent: pure
                                       Nothing
                 }
