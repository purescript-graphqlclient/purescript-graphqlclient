module Dillonkearns.Examples.Github.Object.CreatedCommitContributionEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__CreatedCommitContributionEdge, Scope__CreatedCommitContribution)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__CreatedCommitContributionEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__CreatedCommitContribution r
  -> SelectionSet Scope__CreatedCommitContributionEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
