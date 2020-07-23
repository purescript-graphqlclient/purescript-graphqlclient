module Examples.Github.Object.PageInfo where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__PageInfo
  )
import Data.Maybe
  ( Maybe
  )

endCursor :: SelectionSet Scope__PageInfo (Maybe String)
endCursor = selectionForField "endCursor" [] graphqlDefaultResponseScalarDecoder

hasNextPage :: SelectionSet Scope__PageInfo Boolean
hasNextPage = selectionForField "hasNextPage" [] graphqlDefaultResponseScalarDecoder

hasPreviousPage :: SelectionSet Scope__PageInfo Boolean
hasPreviousPage = selectionForField "hasPreviousPage" [] graphqlDefaultResponseScalarDecoder

startCursor :: SelectionSet Scope__PageInfo (Maybe String)
startCursor = selectionForField "startCursor" [] graphqlDefaultResponseScalarDecoder
