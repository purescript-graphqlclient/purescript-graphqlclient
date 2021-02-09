module Dillonkearns.Examples.Github.Object.IssueTemplate where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__IssueTemplate)
import Data.Maybe (Maybe)

about :: SelectionSet Scope__IssueTemplate (Maybe String)
about = selectionForField "about" [] graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__IssueTemplate (Maybe String)
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__IssueTemplate String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

title :: SelectionSet Scope__IssueTemplate (Maybe String)
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder
