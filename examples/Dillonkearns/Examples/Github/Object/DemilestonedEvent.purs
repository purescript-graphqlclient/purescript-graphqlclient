module Dillonkearns.Examples.Github.Object.DemilestonedEvent where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Actor, Scope__DemilestonedEvent, Scope__MilestoneItem)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__DemilestonedEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__DemilestonedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__DemilestonedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

milestoneTitle :: SelectionSet Scope__DemilestonedEvent String
milestoneTitle = selectionForField
                 "milestoneTitle"
                 []
                 graphqlDefaultResponseScalarDecoder

subject
  :: forall r
   . SelectionSet Scope__MilestoneItem r
  -> SelectionSet Scope__DemilestonedEvent r
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
