module Dillonkearns.Examples.Github.Object.OrganizationInvitationEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
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
