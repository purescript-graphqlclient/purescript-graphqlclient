module Examples.Github.Object.StatusCheckRollupContextEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__StatusCheckRollupContextEdge
  , Scope__StatusCheckRollupContext
  )
import Data.Maybe
  ( Maybe
  )

cursor :: SelectionSet Scope__StatusCheckRollupContextEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet Scope__StatusCheckRollupContext r -> SelectionSet Scope__StatusCheckRollupContextEdge (Maybe r)
node = selectionForCompositeField "node" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
