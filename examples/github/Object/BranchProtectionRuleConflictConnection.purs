module Examples.Github.Object.BranchProtectionRuleConflictConnection where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__BranchProtectionRuleConflictEdge
  , Scope__BranchProtectionRuleConflictConnection
  , Scope__BranchProtectionRuleConflict
  , Scope__PageInfo
  )
import Data.Maybe
  ( Maybe
  )

edges :: forall r . SelectionSet Scope__BranchProtectionRuleConflictEdge r -> SelectionSet Scope__BranchProtectionRuleConflictConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField "edges" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes :: forall r . SelectionSet Scope__BranchProtectionRuleConflict r -> SelectionSet Scope__BranchProtectionRuleConflictConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField "nodes" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo :: forall r . SelectionSet Scope__PageInfo r -> SelectionSet Scope__BranchProtectionRuleConflictConnection r
pageInfo = selectionForCompositeField "pageInfo" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__BranchProtectionRuleConflictConnection Int
totalCount = selectionForField "totalCount" [] graphqlDefaultResponseScalarDecoder
