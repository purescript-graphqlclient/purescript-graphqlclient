module Dillonkearns.Examples.Github.Object.BranchProtectionRuleConflictEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__BranchProtectionRuleConflictEdge, Scope__BranchProtectionRuleConflict)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__BranchProtectionRuleConflictEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__BranchProtectionRuleConflict r
  -> SelectionSet Scope__BranchProtectionRuleConflictEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
