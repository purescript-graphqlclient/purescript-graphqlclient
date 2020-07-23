module Examples.Github.Object.BranchProtectionRuleConflict where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__BranchProtectionRule
  , Scope__BranchProtectionRuleConflict
  , Scope__Ref
  )
import Data.Maybe
  ( Maybe
  )

branchProtectionRule :: forall r . SelectionSet Scope__BranchProtectionRule r -> SelectionSet Scope__BranchProtectionRuleConflict (Maybe r)
branchProtectionRule = selectionForCompositeField "branchProtectionRule" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

conflictingBranchProtectionRule :: forall r . SelectionSet Scope__BranchProtectionRule r -> SelectionSet Scope__BranchProtectionRuleConflict (Maybe r)
conflictingBranchProtectionRule = selectionForCompositeField "conflictingBranchProtectionRule" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ref :: forall r . SelectionSet Scope__Ref r -> SelectionSet Scope__BranchProtectionRuleConflict (Maybe r)
ref = selectionForCompositeField "ref" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
