module Examples.Github.Object.TeamDiscussionEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__TeamDiscussionEdge, Scope__TeamDiscussion)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__TeamDiscussionEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__TeamDiscussion
                   r -> SelectionSet
                        Scope__TeamDiscussionEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
