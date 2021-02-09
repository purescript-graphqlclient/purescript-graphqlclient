module Dillonkearns.Examples.Github.Object.EnterprisePendingMemberInvitationConnection where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__EnterprisePendingMemberInvitationEdge
  , Scope__EnterprisePendingMemberInvitationConnection
  , Scope__OrganizationInvitation
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges
  :: forall r
   . SelectionSet Scope__EnterprisePendingMemberInvitationEdge r
  -> SelectionSet
        Scope__EnterprisePendingMemberInvitationConnection
        (Maybe (Array (Maybe r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes
  :: forall r
   . SelectionSet Scope__OrganizationInvitation r
  -> SelectionSet
        Scope__EnterprisePendingMemberInvitationConnection
        (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo
  :: forall r
   . SelectionSet Scope__PageInfo r
  -> SelectionSet Scope__EnterprisePendingMemberInvitationConnection r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount
  :: SelectionSet
     Scope__EnterprisePendingMemberInvitationConnection
     Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder

totalUniqueUserCount
  :: SelectionSet
     Scope__EnterprisePendingMemberInvitationConnection
     Int
totalUniqueUserCount = selectionForField
                       "totalUniqueUserCount"
                       []
                       graphqlDefaultResponseScalarDecoder
