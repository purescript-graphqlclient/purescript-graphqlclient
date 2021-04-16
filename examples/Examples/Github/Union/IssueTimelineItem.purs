module Examples.Github.Union.IssueTimelineItem where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  ( Scope__AssignedEvent
  , Scope__ClosedEvent
  , Scope__Commit
  , Scope__CrossReferencedEvent
  , Scope__DemilestonedEvent
  , Scope__IssueComment
  , Scope__LabeledEvent
  , Scope__LockedEvent
  , Scope__MilestonedEvent
  , Scope__ReferencedEvent
  , Scope__RenamedTitleEvent
  , Scope__ReopenedEvent
  , Scope__SubscribedEvent
  , Scope__TransferredEvent
  , Scope__UnassignedEvent
  , Scope__UnlabeledEvent
  , Scope__UnlockedEvent
  , Scope__UnsubscribedEvent
  , Scope__UserBlockedEvent
  , Scope__IssueTimelineItem
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onAssignedEvent :: SelectionSet Scope__AssignedEvent decodesTo
    , onClosedEvent :: SelectionSet Scope__ClosedEvent decodesTo
    , onCommit :: SelectionSet Scope__Commit decodesTo
    , onCrossReferencedEvent
      :: SelectionSet
         Scope__CrossReferencedEvent
         decodesTo
    , onDemilestonedEvent :: SelectionSet Scope__DemilestonedEvent decodesTo
    , onIssueComment :: SelectionSet Scope__IssueComment decodesTo
    , onLabeledEvent :: SelectionSet Scope__LabeledEvent decodesTo
    , onLockedEvent :: SelectionSet Scope__LockedEvent decodesTo
    , onMilestonedEvent :: SelectionSet Scope__MilestonedEvent decodesTo
    , onReferencedEvent :: SelectionSet Scope__ReferencedEvent decodesTo
    , onRenamedTitleEvent :: SelectionSet Scope__RenamedTitleEvent decodesTo
    , onReopenedEvent :: SelectionSet Scope__ReopenedEvent decodesTo
    , onSubscribedEvent :: SelectionSet Scope__SubscribedEvent decodesTo
    , onTransferredEvent :: SelectionSet Scope__TransferredEvent decodesTo
    , onUnassignedEvent :: SelectionSet Scope__UnassignedEvent decodesTo
    , onUnlabeledEvent :: SelectionSet Scope__UnlabeledEvent decodesTo
    , onUnlockedEvent :: SelectionSet Scope__UnlockedEvent decodesTo
    , onUnsubscribedEvent :: SelectionSet Scope__UnsubscribedEvent decodesTo
    , onUserBlockedEvent :: SelectionSet Scope__UserBlockedEvent decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__IssueTimelineItem decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "AssignedEvent"
                         selections.onAssignedEvent
                       , buildFragment "ClosedEvent" selections.onClosedEvent
                       , buildFragment "Commit" selections.onCommit
                       , buildFragment
                         "CrossReferencedEvent"
                         selections.onCrossReferencedEvent
                       , buildFragment
                         "DemilestonedEvent"
                         selections.onDemilestonedEvent
                       , buildFragment "IssueComment" selections.onIssueComment
                       , buildFragment "LabeledEvent" selections.onLabeledEvent
                       , buildFragment "LockedEvent" selections.onLockedEvent
                       , buildFragment
                         "MilestonedEvent"
                         selections.onMilestonedEvent
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
                         "UnsubscribedEvent"
                         selections.onUnsubscribedEvent
                       , buildFragment
                         "UserBlockedEvent"
                         selections.onUserBlockedEvent
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onAssignedEvent: pure
                                    Nothing
                 , onClosedEvent: pure
                                  Nothing
                 , onCommit: pure
                             Nothing
                 , onCrossReferencedEvent: pure
                                           Nothing
                 , onDemilestonedEvent: pure
                                        Nothing
                 , onIssueComment: pure
                                   Nothing
                 , onLabeledEvent: pure
                                   Nothing
                 , onLockedEvent: pure
                                  Nothing
                 , onMilestonedEvent: pure
                                      Nothing
                 , onReferencedEvent: pure
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
                 , onUnsubscribedEvent: pure
                                        Nothing
                 , onUserBlockedEvent: pure
                                       Nothing
                 }
