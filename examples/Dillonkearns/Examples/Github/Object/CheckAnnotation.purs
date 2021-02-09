module Dillonkearns.Examples.Github.Object.CheckAnnotation where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__CheckAnnotation, Scope__CheckAnnotationSpan)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Enum.CheckAnnotationLevel
  (CheckAnnotationLevel)
import Dillonkearns.Examples.Github.Scalars (Uri)

annotationLevel
  :: SelectionSet
     Scope__CheckAnnotation
     (Maybe CheckAnnotationLevel)
annotationLevel = selectionForField
                  "annotationLevel"
                  []
                  graphqlDefaultResponseScalarDecoder

blobUrl :: SelectionSet Scope__CheckAnnotation Uri
blobUrl = selectionForField "blobUrl" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__CheckAnnotation (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

location
  :: forall r
   . SelectionSet Scope__CheckAnnotationSpan r
  -> SelectionSet Scope__CheckAnnotation r
location = selectionForCompositeField
           "location"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

message :: SelectionSet Scope__CheckAnnotation String
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

path :: SelectionSet Scope__CheckAnnotation String
path = selectionForField "path" [] graphqlDefaultResponseScalarDecoder

rawDetails :: SelectionSet Scope__CheckAnnotation (Maybe String)
rawDetails = selectionForField
             "rawDetails"
             []
             graphqlDefaultResponseScalarDecoder

title :: SelectionSet Scope__CheckAnnotation (Maybe String)
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder
