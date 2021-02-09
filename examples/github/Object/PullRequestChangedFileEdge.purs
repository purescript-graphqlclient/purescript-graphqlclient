module Examples.Github.Object.PullRequestChangedFileEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__PullRequestChangedFileEdge, Scope__PullRequestChangedFile)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__PullRequestChangedFileEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__PullRequestChangedFile r
  -> SelectionSet Scope__PullRequestChangedFileEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
