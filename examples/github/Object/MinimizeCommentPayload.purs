module Examples.Github.Object.MinimizeCommentPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__MinimizeCommentPayload
  , Scope__Minimizable
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__MinimizeCommentPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

minimizedComment :: forall r . SelectionSet Scope__Minimizable r -> SelectionSet Scope__MinimizeCommentPayload (Maybe r)
minimizedComment = selectionForCompositeField "minimizedComment" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
