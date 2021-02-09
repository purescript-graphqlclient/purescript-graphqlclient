module Dillonkearns.Examples.Github.Object.ProjectCard where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__ProjectColumn
  , Scope__ProjectCard
  , Scope__ProjectCardItem
  , Scope__Actor
  , Scope__Project
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id, Uri)
import Dillonkearns.Examples.Github.Enum.ProjectCardState (ProjectCardState)

column
  :: forall r
   . SelectionSet Scope__ProjectColumn r
  -> SelectionSet Scope__ProjectCard (Maybe r)
column = selectionForCompositeField
         "column"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

content
  :: forall r
   . SelectionSet Scope__ProjectCardItem r
  -> SelectionSet Scope__ProjectCard (Maybe r)
content = selectionForCompositeField
          "content"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ProjectCard DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

creator
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__ProjectCard (Maybe r)
creator = selectionForCompositeField
          "creator"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

databaseId :: SelectionSet Scope__ProjectCard (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ProjectCard Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isArchived :: SelectionSet Scope__ProjectCard Boolean
isArchived = selectionForField
             "isArchived"
             []
             graphqlDefaultResponseScalarDecoder

note :: SelectionSet Scope__ProjectCard (Maybe String)
note = selectionForField "note" [] graphqlDefaultResponseScalarDecoder

project
  :: forall r
   . SelectionSet Scope__Project r
  -> SelectionSet Scope__ProjectCard r
project = selectionForCompositeField
          "project"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__ProjectCard Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__ProjectCard (Maybe ProjectCardState)
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__ProjectCard DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__ProjectCard Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
