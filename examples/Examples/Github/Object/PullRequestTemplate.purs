module Examples.Github.Object.PullRequestTemplate where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__PullRequestTemplate, Scope__Repository)
import Data.Maybe (Maybe)

body :: SelectionSet Scope__PullRequestTemplate (Maybe String)
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

filename :: SelectionSet Scope__PullRequestTemplate (Maybe String)
filename = selectionForField "filename" [] graphqlDefaultResponseScalarDecoder

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__PullRequestTemplate r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
