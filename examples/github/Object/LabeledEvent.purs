module Examples.Github.Object.LabeledEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__LabeledEvent, Scope__Label, Scope__Labelable)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__LabeledEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__LabeledEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__LabeledEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

label
  :: forall r
   . SelectionSet Scope__Label r
  -> SelectionSet Scope__LabeledEvent r
label = selectionForCompositeField
        "label"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

labelable
  :: forall r
   . SelectionSet Scope__Labelable r
  -> SelectionSet Scope__LabeledEvent r
labelable = selectionForCompositeField
            "labelable"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer
