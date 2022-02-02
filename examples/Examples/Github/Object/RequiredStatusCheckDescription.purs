module Examples.Github.Object.RequiredStatusCheckDescription where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__App, Scope__RequiredStatusCheckDescription)
import Data.Maybe (Maybe)

app
  :: forall r
   . SelectionSet Scope__App r
  -> SelectionSet Scope__RequiredStatusCheckDescription (Maybe r)
app = selectionForCompositeField
      "app"
      []
      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

context :: SelectionSet Scope__RequiredStatusCheckDescription String
context = selectionForField "context" [] graphqlDefaultResponseScalarDecoder
