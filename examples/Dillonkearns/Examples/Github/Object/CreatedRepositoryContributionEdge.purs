module Dillonkearns.Examples.Github.Object.CreatedRepositoryContributionEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__CreatedRepositoryContributionEdge
  , Scope__CreatedRepositoryContribution
  )
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__CreatedRepositoryContributionEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__CreatedRepositoryContribution r
  -> SelectionSet Scope__CreatedRepositoryContributionEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
