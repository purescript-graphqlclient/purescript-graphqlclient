module Examples.Github.Object.ProjectCardEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__ProjectCardEdge
  , Scope__ProjectCard
  )
import Data.Maybe
  ( Maybe
  )

cursor :: SelectionSet Scope__ProjectCardEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet Scope__ProjectCard r -> SelectionSet Scope__ProjectCardEdge (Maybe r)
node = selectionForCompositeField "node" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
