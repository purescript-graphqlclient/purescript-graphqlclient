module Examples.Github.Object.PullRequestCommit where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Commit
  , Scope__PullRequestCommit
  , Scope__PullRequest
  )
import Examples.Github.Scalars
  ( Id
  , Uri
  )

commit :: forall r . SelectionSet Scope__Commit r -> SelectionSet Scope__PullRequestCommit r
commit = selectionForCompositeField "commit" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__PullRequestCommit Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest :: forall r . SelectionSet Scope__PullRequest r -> SelectionSet Scope__PullRequestCommit r
pullRequest = selectionForCompositeField "pullRequest" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__PullRequestCommit Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__PullRequestCommit Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
