module Examples.Github.Interface.Contribution where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__Contribution
  , Scope__User
  , Scope__CreatedCommitContribution
  , Scope__CreatedIssueContribution
  , Scope__CreatedPullRequestContribution
  , Scope__CreatedPullRequestReviewContribution
  , Scope__CreatedRepositoryContribution
  , Scope__JoinedGitHubContribution
  , Scope__RestrictedContribution
  )
import Examples.Github.Scalars (DateTime, Uri)
import Data.Maybe (Maybe(..))
import Prelude (pure)

isRestricted :: SelectionSet Scope__Contribution Boolean
isRestricted = selectionForField
               "isRestricted"
               []
               graphqlDefaultResponseScalarDecoder

occurredAt :: SelectionSet Scope__Contribution DateTime
occurredAt = selectionForField
             "occurredAt"
             []
             graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__Contribution Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Contribution Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__Contribution r
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type Fragments decodesTo
  = { onCreatedCommitContribution
      :: SelectionSet
         Scope__CreatedCommitContribution
         decodesTo
    , onCreatedIssueContribution
      :: SelectionSet
         Scope__CreatedIssueContribution
         decodesTo
    , onCreatedPullRequestContribution
      :: SelectionSet
         Scope__CreatedPullRequestContribution
         decodesTo
    , onCreatedPullRequestReviewContribution
      :: SelectionSet
         Scope__CreatedPullRequestReviewContribution
         decodesTo
    , onCreatedRepositoryContribution
      :: SelectionSet
         Scope__CreatedRepositoryContribution
         decodesTo
    , onJoinedGitHubContribution
      :: SelectionSet
         Scope__JoinedGitHubContribution
         decodesTo
    , onRestrictedContribution
      :: SelectionSet
         Scope__RestrictedContribution
         decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__Contribution decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment
                         "CreatedCommitContribution"
                         selections.onCreatedCommitContribution
                       , buildFragment
                         "CreatedIssueContribution"
                         selections.onCreatedIssueContribution
                       , buildFragment
                         "CreatedPullRequestContribution"
                         selections.onCreatedPullRequestContribution
                       , buildFragment
                         "CreatedPullRequestReviewContribution"
                         selections.onCreatedPullRequestReviewContribution
                       , buildFragment
                         "CreatedRepositoryContribution"
                         selections.onCreatedRepositoryContribution
                       , buildFragment
                         "JoinedGitHubContribution"
                         selections.onJoinedGitHubContribution
                       , buildFragment
                         "RestrictedContribution"
                         selections.onRestrictedContribution
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onCreatedCommitContribution: pure
                                                Nothing
                 , onCreatedIssueContribution: pure
                                               Nothing
                 , onCreatedPullRequestContribution: pure
                                                     Nothing
                 , onCreatedPullRequestReviewContribution: pure
                                                           Nothing
                 , onCreatedRepositoryContribution: pure
                                                    Nothing
                 , onJoinedGitHubContribution: pure
                                               Nothing
                 , onRestrictedContribution: pure
                                             Nothing
                 }
