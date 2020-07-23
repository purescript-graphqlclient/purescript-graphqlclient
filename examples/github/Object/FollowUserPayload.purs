module Examples.Github.Object.FollowUserPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__FollowUserPayload
  , Scope__User
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__FollowUserPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__FollowUserPayload (Maybe r)
user = selectionForCompositeField "user" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
