module Dillonkearns.Examples.Github.Object.Reaction where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__Reaction, Scope__Reactable, Scope__User)
import Dillonkearns.Examples.Github.Enum.ReactionContent (ReactionContent)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id)
import Data.Maybe (Maybe)

content :: SelectionSet Scope__Reaction ReactionContent
content = selectionForField "content" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Reaction DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Reaction (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Reaction Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

reactable
  :: forall r
   . SelectionSet Scope__Reactable r
  -> SelectionSet Scope__Reaction r
reactable = selectionForCompositeField
            "reactable"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__Reaction (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
