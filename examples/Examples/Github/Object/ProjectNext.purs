module Examples.Github.Object.ProjectNext where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphQLArguments
  )
import Examples.Github.Scopes
  ( Scope__ProjectNext
  , Scope__Actor
  , Scope__ProjectNextFieldConnection
  , Scope__ProjectNextItemConnection
  , Scope__ProjectNextOwner
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id, Uri)
import Type.Row (type (+))

closed :: SelectionSet Scope__ProjectNext Boolean
closed = selectionForField "closed" [] graphqlDefaultResponseScalarDecoder

closedAt :: SelectionSet Scope__ProjectNext (Maybe DateTime)
closedAt = selectionForField "closedAt" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__ProjectNext DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

creator
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__ProjectNext (Maybe r)
creator = selectionForCompositeField
          "creator"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

databaseId :: SelectionSet Scope__ProjectNext (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__ProjectNext (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

type FieldsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type FieldsInput = { | FieldsInputRowOptional + () }

fields
  :: forall r
   . FieldsInput
  -> SelectionSet Scope__ProjectNextFieldConnection r
  -> SelectionSet Scope__ProjectNext r
fields input = selectionForCompositeField
               "fields"
               (toGraphQLArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__ProjectNext Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type ItemsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type ItemsInput = { | ItemsInputRowOptional + () }

items
  :: forall r
   . ItemsInput
  -> SelectionSet Scope__ProjectNextItemConnection r
  -> SelectionSet Scope__ProjectNext r
items input = selectionForCompositeField
              "items"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

number :: SelectionSet Scope__ProjectNext Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

owner
  :: forall r
   . SelectionSet Scope__ProjectNextOwner r
  -> SelectionSet Scope__ProjectNext r
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

public :: SelectionSet Scope__ProjectNext Boolean
public = selectionForField "public" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__ProjectNext Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

shortDescription :: SelectionSet Scope__ProjectNext (Maybe String)
shortDescription = selectionForField
                   "shortDescription"
                   []
                   graphqlDefaultResponseScalarDecoder

title :: SelectionSet Scope__ProjectNext (Maybe String)
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__ProjectNext DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__ProjectNext Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__ProjectNext Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder
