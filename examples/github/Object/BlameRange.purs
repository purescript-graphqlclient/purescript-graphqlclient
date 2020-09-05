module Examples.Github.Object.BlameRange where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__BlameRange, Scope__Commit)

age :: SelectionSet Scope__BlameRange Int
age = selectionForField "age" [] graphqlDefaultResponseScalarDecoder

commit :: forall r . SelectionSet
                     Scope__Commit
                     r -> SelectionSet
                          Scope__BlameRange
                          r
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

endingLine :: SelectionSet Scope__BlameRange Int
endingLine = selectionForField
             "endingLine"
             []
             graphqlDefaultResponseScalarDecoder

startingLine :: SelectionSet Scope__BlameRange Int
startingLine = selectionForField
               "startingLine"
               []
               graphqlDefaultResponseScalarDecoder
