module Examples.Github.Object.RateLimit where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__RateLimit
  )
import Examples.Github.Scalars
  ( DateTime
  )

cost :: SelectionSet Scope__RateLimit Int
cost = selectionForField "cost" [] graphqlDefaultResponseScalarDecoder

limit :: SelectionSet Scope__RateLimit Int
limit = selectionForField "limit" [] graphqlDefaultResponseScalarDecoder

nodeCount :: SelectionSet Scope__RateLimit Int
nodeCount = selectionForField "nodeCount" [] graphqlDefaultResponseScalarDecoder

remaining :: SelectionSet Scope__RateLimit Int
remaining = selectionForField "remaining" [] graphqlDefaultResponseScalarDecoder

resetAt :: SelectionSet Scope__RateLimit DateTime
resetAt = selectionForField "resetAt" [] graphqlDefaultResponseScalarDecoder

used :: SelectionSet Scope__RateLimit Int
used = selectionForField "used" [] graphqlDefaultResponseScalarDecoder
