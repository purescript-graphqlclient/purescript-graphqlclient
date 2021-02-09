module Dillonkearns.Examples.Github.Object.ReferencedEvent where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__Actor
  , Scope__ReferencedEvent
  , Scope__Commit
  , Scope__Repository
  , Scope__ReferencedSubject
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__ReferencedEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commit
  :: forall r
   . SelectionSet Scope__Commit r
  -> SelectionSet Scope__ReferencedEvent (Maybe r)
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commitRepository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__ReferencedEvent r
commitRepository = selectionForCompositeField
                   "commitRepository"
                   []
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ReferencedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ReferencedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isCrossRepository :: SelectionSet Scope__ReferencedEvent Boolean
isCrossRepository = selectionForField
                    "isCrossRepository"
                    []
                    graphqlDefaultResponseScalarDecoder

isDirectReference :: SelectionSet Scope__ReferencedEvent Boolean
isDirectReference = selectionForField
                    "isDirectReference"
                    []
                    graphqlDefaultResponseScalarDecoder

subject
  :: forall r
   . SelectionSet Scope__ReferencedSubject r
  -> SelectionSet Scope__ReferencedEvent r
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
