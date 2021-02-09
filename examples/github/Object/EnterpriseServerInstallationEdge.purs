module Examples.Github.Object.EnterpriseServerInstallationEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__EnterpriseServerInstallationEdge, Scope__EnterpriseServerInstallation)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__EnterpriseServerInstallationEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__EnterpriseServerInstallation r
  -> SelectionSet Scope__EnterpriseServerInstallationEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
