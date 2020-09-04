module Examples.Github.Object.RepositoryInvitationEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__RepositoryInvitationEdge
  , Scope__RepositoryInvitation
  )
import Data.Maybe
  ( Maybe
  )

cursor :: SelectionSet Scope__RepositoryInvitationEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet Scope__RepositoryInvitation r -> SelectionSet Scope__RepositoryInvitationEdge (Maybe r)
node = selectionForCompositeField "node" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
