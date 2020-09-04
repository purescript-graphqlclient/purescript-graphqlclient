module Examples.Github.Object.DeleteTeamDiscussionPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__DeleteTeamDiscussionPayload
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__DeleteTeamDiscussionPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder
