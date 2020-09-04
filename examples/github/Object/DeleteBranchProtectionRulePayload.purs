module Examples.Github.Object.DeleteBranchProtectionRulePayload where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__DeleteBranchProtectionRulePayload
  )
import Data.Maybe
  ( Maybe
  )

clientMutationId :: SelectionSet Scope__DeleteBranchProtectionRulePayload (Maybe String)
clientMutationId = selectionForField "clientMutationId" [] graphqlDefaultResponseScalarDecoder
