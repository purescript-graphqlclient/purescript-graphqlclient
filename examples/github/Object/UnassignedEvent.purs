module Examples.Github.Object.UnassignedEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__UnassignedEvent
  , Scope__Assignable
  , Scope__Assignee
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__UnassignedEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

assignable
  :: forall r
   . SelectionSet Scope__Assignable r
  -> SelectionSet Scope__UnassignedEvent r
assignable = selectionForCompositeField
             "assignable"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

assignee
  :: forall r
   . SelectionSet Scope__Assignee r
  -> SelectionSet Scope__UnassignedEvent (Maybe r)
assignee = selectionForCompositeField
           "assignee"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__UnassignedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__UnassignedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__UnassignedEvent (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
