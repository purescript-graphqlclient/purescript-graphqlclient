module Examples.Github.Object.BypassPullRequestAllowance where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__BranchActorAllowanceActor
  , Scope__BypassPullRequestAllowance
  , Scope__BranchProtectionRule
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id)

actor
  :: forall r
   . SelectionSet Scope__BranchActorAllowanceActor r
  -> SelectionSet Scope__BypassPullRequestAllowance (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

branchProtectionRule
  :: forall r
   . SelectionSet Scope__BranchProtectionRule r
  -> SelectionSet Scope__BypassPullRequestAllowance (Maybe r)
branchProtectionRule = selectionForCompositeField
                       "branchProtectionRule"
                       []
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__BypassPullRequestAllowance Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
