module Dillonkearns.Examples.Github.Object.SuggestedReviewer where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__SuggestedReviewer, Scope__User)

isAuthor :: SelectionSet Scope__SuggestedReviewer Boolean
isAuthor = selectionForField "isAuthor" [] graphqlDefaultResponseScalarDecoder

isCommenter :: SelectionSet Scope__SuggestedReviewer Boolean
isCommenter = selectionForField
              "isCommenter"
              []
              graphqlDefaultResponseScalarDecoder

reviewer
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__SuggestedReviewer r
reviewer = selectionForCompositeField
           "reviewer"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer
