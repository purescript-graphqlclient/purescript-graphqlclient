module Examples.Github.Object.Submodule where

import GraphqlClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__Submodule)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, GitObjectId)

branch :: SelectionSet Scope__Submodule (Maybe String)
branch = selectionForField "branch" [] graphqlDefaultResponseScalarDecoder

gitUrl :: SelectionSet Scope__Submodule Uri
gitUrl = selectionForField "gitUrl" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Submodule String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

path :: SelectionSet Scope__Submodule String
path = selectionForField "path" [] graphqlDefaultResponseScalarDecoder

subprojectCommitOid :: SelectionSet Scope__Submodule (Maybe GitObjectId)
subprojectCommitOid = selectionForField
                      "subprojectCommitOid"
                      []
                      graphqlDefaultResponseScalarDecoder
