module Dillonkearns.Examples.Github.Object.EnterprisePendingMemberInvitationEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__EnterprisePendingMemberInvitationEdge, Scope__OrganizationInvitation)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__EnterprisePendingMemberInvitationEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

isUnlicensed
  :: SelectionSet
     Scope__EnterprisePendingMemberInvitationEdge
     Boolean
isUnlicensed = selectionForField
               "isUnlicensed"
               []
               graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__OrganizationInvitation r
  -> SelectionSet Scope__EnterprisePendingMemberInvitationEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
