module Examples.Github.Object.UserContentEdit where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__UserContentEdit, Scope__Actor)
import Examples.Github.Scalars (DateTime, Id)
import Data.Maybe (Maybe)

createdAt :: SelectionSet Scope__UserContentEdit DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

deletedAt :: SelectionSet Scope__UserContentEdit (Maybe DateTime)
deletedAt = selectionForField "deletedAt" [] graphqlDefaultResponseScalarDecoder

deletedBy :: forall r . SelectionSet
                        Scope__Actor
                        r -> SelectionSet
                             Scope__UserContentEdit
                             (Maybe
                              r)
deletedBy = selectionForCompositeField
            "deletedBy"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

diff :: SelectionSet Scope__UserContentEdit (Maybe String)
diff = selectionForField "diff" [] graphqlDefaultResponseScalarDecoder

editedAt :: SelectionSet Scope__UserContentEdit DateTime
editedAt = selectionForField "editedAt" [] graphqlDefaultResponseScalarDecoder

editor :: forall r . SelectionSet
                     Scope__Actor
                     r -> SelectionSet
                          Scope__UserContentEdit
                          (Maybe
                           r)
editor = selectionForCompositeField
         "editor"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__UserContentEdit Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__UserContentEdit DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
