module Examples.Github.Object.ProjectNextItem where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , toGraphQLArguments
  )
import Examples.Github.Scopes
  ( Scope__ProjectNextItemContent
  , Scope__ProjectNextItem
  , Scope__Actor
  , Scope__ProjectNextItemFieldValueConnection
  , Scope__ProjectNext
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)
import Type.Row (type (+))

content
  :: forall r
   . SelectionSet Scope__ProjectNextItemContent r
  -> SelectionSet Scope__ProjectNextItem (Maybe r)
content = selectionForCompositeField
          "content"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ProjectNextItem DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

creator
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__ProjectNextItem (Maybe r)
creator = selectionForCompositeField
          "creator"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

databaseId :: SelectionSet Scope__ProjectNextItem (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

type FieldValuesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type FieldValuesInput = { | FieldValuesInputRowOptional + () }

fieldValues
  :: forall r
   . FieldValuesInput
  -> SelectionSet Scope__ProjectNextItemFieldValueConnection r
  -> SelectionSet Scope__ProjectNextItem r
fieldValues input = selectionForCompositeField
                    "fieldValues"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__ProjectNextItem Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

project
  :: forall r
   . SelectionSet Scope__ProjectNext r
  -> SelectionSet Scope__ProjectNextItem r
project = selectionForCompositeField
          "project"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

title :: SelectionSet Scope__ProjectNextItem (Maybe String)
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__ProjectNextItem DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
