module Examples.Github.Object.CheckRun where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__CheckAnnotationConnection
  , Scope__CheckRun
  , Scope__CheckSuite
  , Scope__Repository
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Uri, Id)
import Examples.Github.Enum.CheckConclusionState (CheckConclusionState)
import Examples.Github.Enum.CheckStatusState (CheckStatusState)

type AnnotationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type AnnotationsInput = { | AnnotationsInputRowOptional + () }

annotations
  :: forall r
   . AnnotationsInput
  -> SelectionSet Scope__CheckAnnotationConnection r
  -> SelectionSet Scope__CheckRun (Maybe r)
annotations input = selectionForCompositeField
                    "annotations"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

checkSuite
  :: forall r
   . SelectionSet Scope__CheckSuite r
  -> SelectionSet Scope__CheckRun r
checkSuite = selectionForCompositeField
             "checkSuite"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

completedAt :: SelectionSet Scope__CheckRun (Maybe DateTime)
completedAt = selectionForField
              "completedAt"
              []
              graphqlDefaultResponseScalarDecoder

conclusion :: SelectionSet Scope__CheckRun (Maybe CheckConclusionState)
conclusion = selectionForField
             "conclusion"
             []
             graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__CheckRun (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

detailsUrl :: SelectionSet Scope__CheckRun (Maybe Uri)
detailsUrl = selectionForField
             "detailsUrl"
             []
             graphqlDefaultResponseScalarDecoder

externalId :: SelectionSet Scope__CheckRun (Maybe String)
externalId = selectionForField
             "externalId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__CheckRun Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type IsRequiredInputRowOptional r
  = ( pullRequestId :: Optional Id, pullRequestNumber :: Optional Int | r )

type IsRequiredInput = { | IsRequiredInputRowOptional + () }

isRequired :: IsRequiredInput -> SelectionSet Scope__CheckRun Boolean
isRequired input = selectionForField
                   "isRequired"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__CheckRun String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

permalink :: SelectionSet Scope__CheckRun Uri
permalink = selectionForField "permalink" [] graphqlDefaultResponseScalarDecoder

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__CheckRun r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__CheckRun Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

startedAt :: SelectionSet Scope__CheckRun (Maybe DateTime)
startedAt = selectionForField "startedAt" [] graphqlDefaultResponseScalarDecoder

status :: SelectionSet Scope__CheckRun CheckStatusState
status = selectionForField "status" [] graphqlDefaultResponseScalarDecoder

summary :: SelectionSet Scope__CheckRun (Maybe String)
summary = selectionForField "summary" [] graphqlDefaultResponseScalarDecoder

text :: SelectionSet Scope__CheckRun (Maybe String)
text = selectionForField "text" [] graphqlDefaultResponseScalarDecoder

title :: SelectionSet Scope__CheckRun (Maybe String)
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__CheckRun Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
