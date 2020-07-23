module Examples.Github.Object.MilestoneEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__MilestoneEdge
  , Scope__Milestone
  )
import Data.Maybe
  ( Maybe
  )

cursor :: SelectionSet Scope__MilestoneEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet Scope__Milestone r -> SelectionSet Scope__MilestoneEdge (Maybe r)
node = selectionForCompositeField "node" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
