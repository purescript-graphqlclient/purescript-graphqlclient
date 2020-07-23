module Examples.Github.Object.CloneTemplateRepositoryPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__CloneTemplateRepositoryPayload
  , Scope__Repository
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__CloneTemplateRepositoryPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__CloneTemplateRepositoryPayload (Maybe r)
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
