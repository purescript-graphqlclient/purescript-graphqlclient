module Examples.Github.Object.BranchProtectionRuleEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__BranchProtectionRuleEdge, Scope__BranchProtectionRule)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__BranchProtectionRuleEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__BranchProtectionRule r
  -> SelectionSet Scope__BranchProtectionRuleEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
