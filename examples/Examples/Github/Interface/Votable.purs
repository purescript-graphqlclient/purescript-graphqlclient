module Examples.Github.Interface.Votable where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  (Scope__Votable, Scope__Discussion, Scope__DiscussionComment)
import Data.Maybe (Maybe(..))
import Prelude (pure)

upvoteCount :: SelectionSet Scope__Votable Int
upvoteCount = selectionForField
              "upvoteCount"
              []
              graphqlDefaultResponseScalarDecoder

viewerCanUpvote :: SelectionSet Scope__Votable Boolean
viewerCanUpvote = selectionForField
                  "viewerCanUpvote"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerHasUpvoted :: SelectionSet Scope__Votable Boolean
viewerHasUpvoted = selectionForField
                   "viewerHasUpvoted"
                   []
                   graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onDiscussion :: SelectionSet Scope__Discussion decodesTo
    , onDiscussionComment :: SelectionSet Scope__DiscussionComment decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__Votable decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Discussion" selections.onDiscussion
                       , buildFragment
                         "DiscussionComment"
                         selections.onDiscussionComment
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onDiscussion: pure
                                 Nothing
                 , onDiscussionComment: pure
                                        Nothing
                 }
