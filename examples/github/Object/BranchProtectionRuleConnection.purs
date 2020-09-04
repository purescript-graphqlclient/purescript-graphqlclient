module Examples.Github.Object.BranchProtectionRuleConnection where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__BranchProtectionRuleEdge
  , Scope__BranchProtectionRuleConnection
  , Scope__BranchProtectionRule
  , Scope__PageInfo
  )
import Data.Maybe
  ( Maybe
  )

edges :: forall r . SelectionSet Scope__BranchProtectionRuleEdge r -> SelectionSet Scope__BranchProtectionRuleConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField "edges" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet Scope__BranchProtectionRule r -> SelectionSet Scope__BranchProtectionRuleConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField "nodes" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo :: forall r . SelectionSet Scope__PageInfo r -> SelectionSet Scope__BranchProtectionRuleConnection r
pageInfo = selectionForCompositeField "pageInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__BranchProtectionRuleConnection Int
totalCount = selectionForField "totalCount" [] graphqlDefaultResponseScalarDecoder
