module Dillonkearns.Examples.Github.Interface.Reactable where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphQLArguments
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__Reactable
  , Scope__ReactionGroup
  , Scope__ReactionConnection
  , Scope__CommitComment
  , Scope__Issue
  , Scope__IssueComment
  , Scope__PullRequest
  , Scope__PullRequestReview
  , Scope__PullRequestReviewComment
  , Scope__TeamDiscussion
  , Scope__TeamDiscussionComment
  )
import Data.Maybe (Maybe(..))
import Dillonkearns.Examples.Github.Scalars (Id)
import Dillonkearns.Examples.Github.Enum.ReactionContent (ReactionContent)
import Dillonkearns.Examples.Github.InputObject (ReactionOrder) as Dillonkearns.Examples.Github.InputObject
import Type.Row (type (+))
import Prelude (pure)

databaseId :: SelectionSet Scope__Reactable (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Reactable Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

reactionGroups
  :: forall r
   . SelectionSet Scope__ReactionGroup r
  -> SelectionSet Scope__Reactable (Maybe (Array r))
reactionGroups = selectionForCompositeField
                 "reactionGroups"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReactionsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , content :: Optional ReactionContent
    , orderBy :: Optional Dillonkearns.Examples.Github.InputObject.ReactionOrder
    | r
    )

type ReactionsInput = { | ReactionsInputRowOptional + () }

reactions
  :: forall r
   . ReactionsInput
  -> SelectionSet Scope__ReactionConnection r
  -> SelectionSet Scope__Reactable r
reactions input = selectionForCompositeField
                  "reactions"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanReact :: SelectionSet Scope__Reactable Boolean
viewerCanReact = selectionForField
                 "viewerCanReact"
                 []
                 graphqlDefaultResponseScalarDecoder

type Fragments decodesTo
  = { onCommitComment :: SelectionSet Scope__CommitComment decodesTo
    , onIssue :: SelectionSet Scope__Issue decodesTo
    , onIssueComment :: SelectionSet Scope__IssueComment decodesTo
    , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
    , onPullRequestReview :: SelectionSet Scope__PullRequestReview decodesTo
    , onPullRequestReviewComment
      :: SelectionSet
         Scope__PullRequestReviewComment
         decodesTo
    , onTeamDiscussion :: SelectionSet Scope__TeamDiscussion decodesTo
    , onTeamDiscussionComment
      :: SelectionSet
         Scope__TeamDiscussionComment
         decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__Reactable decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "CommitComment"
                         selections.onCommitComment
                       , buildFragment "Issue" selections.onIssue
                       , buildFragment "IssueComment" selections.onIssueComment
                       , buildFragment "PullRequest" selections.onPullRequest
                       , buildFragment
                         "PullRequestReview"
                         selections.onPullRequestReview
                       , buildFragment
                         "PullRequestReviewComment"
                         selections.onPullRequestReviewComment
                       , buildFragment
                         "TeamDiscussion"
                         selections.onTeamDiscussion
                       , buildFragment
                         "TeamDiscussionComment"
                         selections.onTeamDiscussionComment
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onCommitComment: pure
                                    Nothing
                 , onIssue: pure
                            Nothing
                 , onIssueComment: pure
                                   Nothing
                 , onPullRequest: pure
                                  Nothing
                 , onPullRequestReview: pure
                                        Nothing
                 , onPullRequestReviewComment: pure
                                               Nothing
                 , onTeamDiscussion: pure
                                     Nothing
                 , onTeamDiscussionComment: pure
                                            Nothing
                 }
