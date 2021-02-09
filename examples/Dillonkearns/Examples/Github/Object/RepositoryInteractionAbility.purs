module Dillonkearns.Examples.Github.Object.RepositoryInteractionAbility where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__RepositoryInteractionAbility)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime)
import Dillonkearns.Examples.Github.Enum.RepositoryInteractionLimit
  (RepositoryInteractionLimit)
import Dillonkearns.Examples.Github.Enum.RepositoryInteractionLimitOrigin
  (RepositoryInteractionLimitOrigin)

expiresAt :: SelectionSet Scope__RepositoryInteractionAbility (Maybe DateTime)
expiresAt = selectionForField "expiresAt" [] graphqlDefaultResponseScalarDecoder

limit
  :: SelectionSet
     Scope__RepositoryInteractionAbility
     RepositoryInteractionLimit
limit = selectionForField "limit" [] graphqlDefaultResponseScalarDecoder

origin
  :: SelectionSet
     Scope__RepositoryInteractionAbility
     RepositoryInteractionLimitOrigin
origin = selectionForField "origin" [] graphqlDefaultResponseScalarDecoder
