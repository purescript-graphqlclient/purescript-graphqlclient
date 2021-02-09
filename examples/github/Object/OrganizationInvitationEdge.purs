module Examples.Github.Object.OrganizationInvitationEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__OrganizationInvitationEdge, Scope__OrganizationInvitation)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__OrganizationInvitationEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__OrganizationInvitation r
  -> SelectionSet Scope__OrganizationInvitationEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
