module Examples.Github.Object.EnterpriseAdministratorEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__EnterpriseAdministratorEdge, Scope__User)
import Data.Maybe (Maybe)
import Examples.Github.Enum.EnterpriseAdministratorRole
  (EnterpriseAdministratorRole)

cursor :: SelectionSet Scope__EnterpriseAdministratorEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__EnterpriseAdministratorEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

role
  :: SelectionSet
     Scope__EnterpriseAdministratorEdge
     EnterpriseAdministratorRole
role = selectionForField "role" [] graphqlDefaultResponseScalarDecoder
