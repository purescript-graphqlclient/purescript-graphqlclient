module Dillonkearns.Examples.Github.Object.EnterpriseAdministratorInvitationConnection where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__EnterpriseAdministratorInvitationEdge
  , Scope__EnterpriseAdministratorInvitationConnection
  , Scope__EnterpriseAdministratorInvitation
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges
  :: forall r
   . SelectionSet Scope__EnterpriseAdministratorInvitationEdge r
  -> SelectionSet
        Scope__EnterpriseAdministratorInvitationConnection
        (Maybe (Array (Maybe r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes
  :: forall r
   . SelectionSet Scope__EnterpriseAdministratorInvitation r
  -> SelectionSet
        Scope__EnterpriseAdministratorInvitationConnection
        (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo
  :: forall r
   . SelectionSet Scope__PageInfo r
  -> SelectionSet Scope__EnterpriseAdministratorInvitationConnection r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount
  :: SelectionSet
     Scope__EnterpriseAdministratorInvitationConnection
     Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
