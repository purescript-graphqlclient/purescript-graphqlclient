module Dillonkearns.Examples.Github.Object.MilestonedEvent where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Actor, Scope__MilestonedEvent, Scope__MilestoneItem)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__MilestonedEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__MilestonedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__MilestonedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

milestoneTitle :: SelectionSet Scope__MilestonedEvent String
milestoneTitle = selectionForField
                 "milestoneTitle"
                 []
                 graphqlDefaultResponseScalarDecoder

subject
  :: forall r
   . SelectionSet Scope__MilestoneItem r
  -> SelectionSet Scope__MilestonedEvent r
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
