module Dillonkearns.Examples.Github.Object.CheckAnnotationPosition where

import Dillonkearns.GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Dillonkearns.Examples.Github.Scopes (Scope__CheckAnnotationPosition)
import Data.Maybe (Maybe)

column :: SelectionSet Scope__CheckAnnotationPosition (Maybe Int)
column = selectionForField "column" [] graphqlDefaultResponseScalarDecoder

line :: SelectionSet Scope__CheckAnnotationPosition Int
line = selectionForField "line" [] graphqlDefaultResponseScalarDecoder
