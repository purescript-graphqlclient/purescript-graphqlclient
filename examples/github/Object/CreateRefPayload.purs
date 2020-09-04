module Examples.Github.Object.CreateRefPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__CreateRefPayload
  , Scope__Ref
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__CreateRefPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

ref :: forall r . SelectionSet Scope__Ref r -> SelectionSet Scope__CreateRefPayload (Maybe r)
ref = selectionForCompositeField "ref" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
