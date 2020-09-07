module Examples.Github.Interface.TopicAuditEntryData where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Topic
  , Scope__TopicAuditEntryData
  , Scope__RepoAddTopicAuditEntry
  , Scope__RepoRemoveTopicAuditEntry
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

topic :: forall r . SelectionSet
                    Scope__Topic
                    r -> SelectionSet
                         Scope__TopicAuditEntryData
                         (Maybe
                          r)
topic = selectionForCompositeField
        "topic"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

topicName :: SelectionSet Scope__TopicAuditEntryData (Maybe String)
topicName = selectionForField "topicName" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onRepoAddTopicAuditEntry :: SelectionSet
                                                         Scope__RepoAddTopicAuditEntry
                                                         decodesTo
                           , onRepoRemoveTopicAuditEntry :: SelectionSet
                                                            Scope__RepoRemoveTopicAuditEntry
                                                            decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__TopicAuditEntryData
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "RepoAddTopicAuditEntry"
                         selections.onRepoAddTopicAuditEntry
                       , buildFragment
                         "RepoRemoveTopicAuditEntry"
                         selections.onRepoRemoveTopicAuditEntry
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onRepoAddTopicAuditEntry: pure
                                             Nothing
                 , onRepoRemoveTopicAuditEntry: pure
                                                Nothing
                 }
