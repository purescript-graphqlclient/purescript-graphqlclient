module Examples.Github.Object.ExternalIdentitySamlAttributes where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__ExternalIdentitySamlAttributes
  )
import Data.Maybe
  ( Maybe
  )

nameId :: SelectionSet Scope__ExternalIdentitySamlAttributes (Maybe String)
nameId = selectionForField "nameId" [] graphqlDefaultResponseScalarDecoder
