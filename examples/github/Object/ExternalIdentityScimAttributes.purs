module Examples.Github.Object.ExternalIdentityScimAttributes where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__ExternalIdentityScimAttributes
  )
import Data.Maybe
  ( Maybe
  )

username :: SelectionSet Scope__ExternalIdentityScimAttributes (Maybe String)
username = selectionForField "username" [] graphqlDefaultResponseScalarDecoder
