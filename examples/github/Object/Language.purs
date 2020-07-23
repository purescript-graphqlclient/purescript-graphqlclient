module Examples.Github.Object.Language where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Language
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( Id
  )

color :: SelectionSet Scope__Language (Maybe String)
color = selectionForField "color" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Language Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Language String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder
