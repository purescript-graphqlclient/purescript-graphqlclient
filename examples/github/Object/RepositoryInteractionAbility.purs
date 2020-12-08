module Examples.Github.Object.RepositoryInteractionAbility where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__RepositoryInteractionAbility)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime)
import Examples.Github.Enum.RepositoryInteractionLimit
  (RepositoryInteractionLimit)
import Examples.Github.Enum.RepositoryInteractionLimitOrigin
  (RepositoryInteractionLimitOrigin)

expiresAt :: SelectionSet Scope__RepositoryInteractionAbility (Maybe DateTime)
expiresAt = selectionForField "expiresAt" [] graphqlDefaultResponseScalarDecoder

limit :: SelectionSet
         Scope__RepositoryInteractionAbility
         RepositoryInteractionLimit
limit = selectionForField "limit" [] graphqlDefaultResponseScalarDecoder

origin :: SelectionSet
          Scope__RepositoryInteractionAbility
          RepositoryInteractionLimitOrigin
origin = selectionForField "origin" [] graphqlDefaultResponseScalarDecoder
