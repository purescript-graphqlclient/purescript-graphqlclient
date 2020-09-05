module Examples.Github.Object.PushAllowance where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__PushAllowanceActor, Scope__PushAllowance, Scope__BranchProtectionRule)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id)

actor :: forall r . SelectionSet
                    Scope__PushAllowanceActor
                    r -> SelectionSet
                         Scope__PushAllowance
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

branchProtectionRule :: forall r . SelectionSet
                                   Scope__BranchProtectionRule
                                   r -> SelectionSet
                                        Scope__PushAllowance
                                        (Maybe
                                         r)
branchProtectionRule = selectionForCompositeField
                       "branchProtectionRule"
                       []
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__PushAllowance Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
