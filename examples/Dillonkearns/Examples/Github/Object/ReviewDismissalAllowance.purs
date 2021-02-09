module Dillonkearns.Examples.Github.Object.ReviewDismissalAllowance where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__ReviewDismissalAllowanceActor
  , Scope__ReviewDismissalAllowance
  , Scope__BranchProtectionRule
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Id)

actor
  :: forall r
   . SelectionSet Scope__ReviewDismissalAllowanceActor r
  -> SelectionSet Scope__ReviewDismissalAllowance (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

branchProtectionRule
  :: forall r
   . SelectionSet Scope__BranchProtectionRule r
  -> SelectionSet Scope__ReviewDismissalAllowance (Maybe r)
branchProtectionRule = selectionForCompositeField
                       "branchProtectionRule"
                       []
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__ReviewDismissalAllowance Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
