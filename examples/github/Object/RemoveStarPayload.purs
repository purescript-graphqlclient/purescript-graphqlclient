module Examples.Github.Object.RemoveStarPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__RemoveStarPayload
  , Scope__Starrable
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__RemoveStarPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

starrable :: forall r . SelectionSet Scope__Starrable r -> SelectionSet Scope__RemoveStarPayload (Maybe r)
starrable = selectionForCompositeField "starrable" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
