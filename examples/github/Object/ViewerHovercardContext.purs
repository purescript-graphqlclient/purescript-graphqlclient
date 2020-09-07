module Examples.Github.Object.ViewerHovercardContext where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__ViewerHovercardContext, Scope__User)

message :: SelectionSet Scope__ViewerHovercardContext String
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

octicon :: SelectionSet Scope__ViewerHovercardContext String
octicon = selectionForField "octicon" [] graphqlDefaultResponseScalarDecoder

viewer :: forall r . SelectionSet
                     Scope__User
                     r -> SelectionSet
                          Scope__ViewerHovercardContext
                          r
viewer = selectionForCompositeField
         "viewer"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
