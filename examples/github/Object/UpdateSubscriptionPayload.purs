module Examples.Github.Object.UpdateSubscriptionPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UpdateSubscriptionPayload
  , Scope__Subscribable
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__UpdateSubscriptionPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

subscribable :: forall r . SelectionSet Scope__Subscribable r -> SelectionSet Scope__UpdateSubscriptionPayload (Maybe r)
subscribable = selectionForCompositeField "subscribable" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
