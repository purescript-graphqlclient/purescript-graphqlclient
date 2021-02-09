module Examples.Github.Object.UserBlockedEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__UserBlockedEvent, Scope__User)
import Data.Maybe (Maybe)
import Examples.Github.Enum.UserBlockDuration (UserBlockDuration)
import Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__UserBlockedEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

blockDuration :: SelectionSet Scope__UserBlockedEvent UserBlockDuration
blockDuration = selectionForField
                "blockDuration"
                []
                graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__UserBlockedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__UserBlockedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

subject
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__UserBlockedEvent (Maybe r)
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
