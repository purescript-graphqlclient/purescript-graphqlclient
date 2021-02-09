module Dillonkearns.Examples.Github.Object.PullRequestCommitEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__PullRequestCommitEdge, Scope__PullRequestCommit)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__PullRequestCommitEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__PullRequestCommit r
  -> SelectionSet Scope__PullRequestCommitEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
