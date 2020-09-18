module Examples.Github.Object.IssueTemplate where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__IssueTemplate)
import Data.Maybe (Maybe)

about :: SelectionSet Scope__IssueTemplate (Maybe String)
about = selectionForField "about" [] graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__IssueTemplate (Maybe String)
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__IssueTemplate String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

title :: SelectionSet Scope__IssueTemplate (Maybe String)
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder
