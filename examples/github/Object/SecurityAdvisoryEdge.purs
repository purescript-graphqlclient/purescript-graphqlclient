module Examples.Github.Object.SecurityAdvisoryEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__SecurityAdvisoryEdge
  , Scope__SecurityAdvisory
  )
import Data.Maybe
  ( Maybe
  )

cursor :: SelectionSet Scope__SecurityAdvisoryEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet Scope__SecurityAdvisory r -> SelectionSet Scope__SecurityAdvisoryEdge (Maybe r)
node = selectionForCompositeField "node" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
