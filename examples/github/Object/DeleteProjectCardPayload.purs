module Examples.Github.Object.DeleteProjectCardPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__DeleteProjectCardPayload, Scope__ProjectColumn)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id)

clientMutationId :: SelectionSet Scope__DeleteProjectCardPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

column
  :: forall r
   . SelectionSet Scope__ProjectColumn r
  -> SelectionSet Scope__DeleteProjectCardPayload (Maybe r)
column = selectionForCompositeField
         "column"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

deletedCardId :: SelectionSet Scope__DeleteProjectCardPayload (Maybe Id)
deletedCardId = selectionForField
                "deletedCardId"
                []
                graphqlDefaultResponseScalarDecoder
