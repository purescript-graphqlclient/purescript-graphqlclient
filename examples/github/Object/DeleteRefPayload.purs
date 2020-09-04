module Examples.Github.Object.DeleteRefPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__DeleteRefPayload
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__DeleteRefPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder
