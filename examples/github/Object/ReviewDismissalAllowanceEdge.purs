module Examples.Github.Object.ReviewDismissalAllowanceEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__ReviewDismissalAllowanceEdge
  , Scope__ReviewDismissalAllowance
  )
import Data.Maybe
  ( Maybe
  )

cursor :: SelectionSet Scope__ReviewDismissalAllowanceEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet Scope__ReviewDismissalAllowance r -> SelectionSet Scope__ReviewDismissalAllowanceEdge (Maybe r)
node = selectionForCompositeField "node" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
