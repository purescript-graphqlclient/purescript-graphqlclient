module Examples.Github.Object.BypassPullRequestAllowanceEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__BypassPullRequestAllowanceEdge, Scope__BypassPullRequestAllowance)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__BypassPullRequestAllowanceEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__BypassPullRequestAllowance r
  -> SelectionSet Scope__BypassPullRequestAllowanceEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
