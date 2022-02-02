module Examples.Github.Object.DeploymentProtectionRuleEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeploymentProtectionRuleEdge, Scope__DeploymentProtectionRule)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__DeploymentProtectionRuleEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__DeploymentProtectionRule r
  -> SelectionSet Scope__DeploymentProtectionRuleEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
