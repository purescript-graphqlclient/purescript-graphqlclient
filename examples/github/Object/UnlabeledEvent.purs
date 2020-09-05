module Examples.Github.Object.UnlabeledEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__UnlabeledEvent, Scope__Label, Scope__Labelable)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor :: forall r . SelectionSet
                    Scope__Actor
                    r -> SelectionSet
                         Scope__UnlabeledEvent
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__UnlabeledEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__UnlabeledEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

label :: forall r . SelectionSet
                    Scope__Label
                    r -> SelectionSet
                         Scope__UnlabeledEvent
                         r
label = selectionForCompositeField
        "label"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

labelable :: forall r . SelectionSet
                        Scope__Labelable
                        r -> SelectionSet
                             Scope__UnlabeledEvent
                             r
labelable = selectionForCompositeField
            "labelable"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer
