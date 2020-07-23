module Examples.Github.Object.BranchProtectionRuleConflictEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__BranchProtectionRuleConflictEdge
  , Scope__BranchProtectionRuleConflict
  )
import Data.Maybe
  ( Maybe
  )

cursor :: SelectionSet Scope__BranchProtectionRuleConflictEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet Scope__BranchProtectionRuleConflict r -> SelectionSet Scope__BranchProtectionRuleConflictEdge (Maybe r)
node = selectionForCompositeField "node" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
