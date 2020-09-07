module Examples.Github.Object.OrganizationAuditEntryEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__OrganizationAuditEntryEdge, Scope__OrganizationAuditEntry)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__OrganizationAuditEntryEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__OrganizationAuditEntry
                   r -> SelectionSet
                        Scope__OrganizationAuditEntryEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
