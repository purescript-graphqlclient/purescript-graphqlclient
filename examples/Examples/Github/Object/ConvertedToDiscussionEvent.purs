module Examples.Github.Object.ConvertedToDiscussionEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__ConvertedToDiscussionEvent, Scope__Discussion)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__ConvertedToDiscussionEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ConvertedToDiscussionEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

discussion
  :: forall r
   . SelectionSet Scope__Discussion r
  -> SelectionSet Scope__ConvertedToDiscussionEvent (Maybe r)
discussion = selectionForCompositeField
             "discussion"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__ConvertedToDiscussionEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
