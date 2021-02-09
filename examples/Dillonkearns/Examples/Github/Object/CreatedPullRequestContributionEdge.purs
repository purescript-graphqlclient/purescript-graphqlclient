module Dillonkearns.Examples.Github.Object.CreatedPullRequestContributionEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__CreatedPullRequestContributionEdge
  , Scope__CreatedPullRequestContribution
  )
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__CreatedPullRequestContributionEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__CreatedPullRequestContribution r
  -> SelectionSet Scope__CreatedPullRequestContributionEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
