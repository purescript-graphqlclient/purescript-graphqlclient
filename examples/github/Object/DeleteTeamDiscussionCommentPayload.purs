module Examples.Github.Object.DeleteTeamDiscussionCommentPayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__DeleteTeamDiscussionCommentPayload
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__DeleteTeamDiscussionCommentPayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder
