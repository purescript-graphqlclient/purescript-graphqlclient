module Examples.Github.Object.BypassForcePushAllowance where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__BranchActorAllowanceActor
  , Scope__BypassForcePushAllowance
  , Scope__BranchProtectionRule
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id)

actor
  :: forall r
   . SelectionSet Scope__BranchActorAllowanceActor r
  -> SelectionSet Scope__BypassForcePushAllowance (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

branchProtectionRule
  :: forall r
   . SelectionSet Scope__BranchProtectionRule r
  -> SelectionSet Scope__BypassForcePushAllowance (Maybe r)
branchProtectionRule = selectionForCompositeField
                       "branchProtectionRule"
                       []
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__BypassForcePushAllowance Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
