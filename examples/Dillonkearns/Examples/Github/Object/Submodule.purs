module Dillonkearns.Examples.Github.Object.Submodule where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__Submodule)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Uri, GitObjectId)

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
