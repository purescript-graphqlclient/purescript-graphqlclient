module Examples.Github.Object.UnarchiveRepositoryPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__UnarchiveRepositoryPayload
  , Scope__Repository
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__UnarchiveRepositoryPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__UnarchiveRepositoryPayload (Maybe r)
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
