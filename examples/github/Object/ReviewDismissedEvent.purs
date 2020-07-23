module Examples.Github.Object.ReviewDismissedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__ReviewDismissedEvent
  , Scope__PullRequest
  , Scope__PullRequestCommit
  , Scope__PullRequestReview
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  , Uri
  )
import Examples.Github.Enum.PullRequestReviewState
  ( PullRequestReviewState
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__ReviewDismissedEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ReviewDismissedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__ReviewDismissedEvent (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

dismissalMessage :: SelectionSet Scope__ReviewDismissedEvent (Maybe String)
dismissalMessage = selectionForField "dismissalMessage" [] graphqlDefaultResponseScalarDecoder

dismissalMessageHTML :: SelectionSet Scope__ReviewDismissedEvent (Maybe String)
dismissalMessageHTML = selectionForField "dismissalMessageHTML" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ReviewDismissedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

previousReviewState :: SelectionSet Scope__ReviewDismissedEvent PullRequestReviewState
previousReviewState = selectionForField "previousReviewState" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__ReviewDismissedEvent r
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pullRequestCommit :: forall r . SelectionSet Scope__PullRequestCommit r -> SelectionSet Scope__ReviewDismissedEvent (Maybe r)
pullRequestCommit = selectionForCompositeField "pullRequestCommit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__ReviewDismissedEvent Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

review :: forall r . SelectionSet Scope__PullRequestReview r -> SelectionSet Scope__ReviewDismissedEvent (Maybe r)
review = selectionForCompositeField "review" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

url :: SelectionSet Scope__ReviewDismissedEvent Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
