module Examples.Github.Object.ClosedEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__ClosedEvent, Scope__Closable, Scope__Closer)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id, Uri)

actor :: forall r . SelectionSet
                    Scope__Actor
                    r -> SelectionSet
                         Scope__ClosedEvent
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

closable :: forall r . SelectionSet
                       Scope__Closable
                       r -> SelectionSet
                            Scope__ClosedEvent
                            r
closable = selectionForCompositeField
           "closable"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

closer :: forall r . SelectionSet
                     Scope__Closer
                     r -> SelectionSet
                          Scope__ClosedEvent
                          (Maybe
                           r)
closer = selectionForCompositeField
         "closer"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ClosedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ClosedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__ClosedEvent Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__ClosedEvent Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
