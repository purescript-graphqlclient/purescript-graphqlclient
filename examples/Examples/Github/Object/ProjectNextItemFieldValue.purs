module Examples.Github.Object.ProjectNextItemFieldValue where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__ProjectNextItemFieldValue
  , Scope__Actor
  , Scope__ProjectNextField
  , Scope__ProjectNextItem
  )
import Examples.Github.Scalars (DateTime, Id)
import Data.Maybe (Maybe)

createdAt :: SelectionSet Scope__ProjectNextItemFieldValue DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

creator
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__ProjectNextItemFieldValue (Maybe r)
creator = selectionForCompositeField
          "creator"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

databaseId :: SelectionSet Scope__ProjectNextItemFieldValue (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ProjectNextItemFieldValue Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

projectField
  :: forall r
   . SelectionSet Scope__ProjectNextField r
  -> SelectionSet Scope__ProjectNextItemFieldValue r
projectField = selectionForCompositeField
               "projectField"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

projectItem
  :: forall r
   . SelectionSet Scope__ProjectNextItem r
  -> SelectionSet Scope__ProjectNextItemFieldValue r
projectItem = selectionForCompositeField
              "projectItem"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

updatedAt :: SelectionSet Scope__ProjectNextItemFieldValue DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

value :: SelectionSet Scope__ProjectNextItemFieldValue (Maybe String)
value = selectionForField "value" [] graphqlDefaultResponseScalarDecoder
