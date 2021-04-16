module Examples.Github.Object.RemovedFromProjectEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes (Scope__Actor, Scope__RemovedFromProjectEvent)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__RemovedFromProjectEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__RemovedFromProjectEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__RemovedFromProjectEvent (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__RemovedFromProjectEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
