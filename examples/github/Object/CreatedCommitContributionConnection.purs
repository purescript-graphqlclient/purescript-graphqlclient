module Examples.Github.Object.CreatedCommitContributionConnection where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__CreatedCommitContributionEdge
  , Scope__CreatedCommitContributionConnection
  , Scope__CreatedCommitContribution
  , Scope__PageInfo
  )
import Data.Maybe
  ( Maybe
  )

edges :: forall r . SelectionSet Scope__CreatedCommitContributionEdge r -> SelectionSet Scope__CreatedCommitContributionConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField "edges" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet Scope__CreatedCommitContribution r -> SelectionSet Scope__CreatedCommitContributionConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField "nodes" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo :: forall r . SelectionSet Scope__PageInfo r -> SelectionSet Scope__CreatedCommitContributionConnection r
pageInfo = selectionForCompositeField "pageInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__CreatedCommitContributionConnection Int
totalCount = selectionForField "totalCount" [] graphqlDefaultResponseScalarDecoder
