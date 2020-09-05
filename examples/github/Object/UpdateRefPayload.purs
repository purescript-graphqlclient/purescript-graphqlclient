module Examples.Github.Object.UpdateRefPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__UpdateRefPayload, Scope__Ref)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__UpdateRefPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

ref :: forall r . SelectionSet
                  Scope__Ref
                  r -> SelectionSet
                       Scope__UpdateRefPayload
                       (Maybe
                        r)
ref = selectionForCompositeField
      "ref"
      []
      graphqlDefaultResponseFunctorOrScalarDecoderTransformer
