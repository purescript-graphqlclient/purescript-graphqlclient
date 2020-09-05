module Examples.Github.Object.ProjectColumn where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Data.Maybe (Maybe)
import Examples.Github.Enum.ProjectCardArchivedState (ProjectCardArchivedState)
import Type.Row (type (+))
import Examples.Github.Scopes
  (Scope__ProjectCardConnection, Scope__ProjectColumn, Scope__Project)
import Examples.Github.Scalars (DateTime, Id, Uri)
import Examples.Github.Enum.ProjectColumnPurpose (ProjectColumnPurpose)

type CardsInputRowOptional r = ( after :: Optional
                                          String
                               , before :: Optional String
                               , first :: Optional Int
                               , last :: Optional Int
                               , archivedStates :: Optional
                                                   (Array
                                                    (Maybe
                                                     ProjectCardArchivedState))
                               | r
                               )

type CardsInput = { | CardsInputRowOptional + () }

cards :: forall r . CardsInput -> SelectionSet
                                  Scope__ProjectCardConnection
                                  r -> SelectionSet
                                       Scope__ProjectColumn
                                       r
cards input = selectionForCompositeField
              "cards"
              (toGraphqlArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__ProjectColumn DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__ProjectColumn (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ProjectColumn Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__ProjectColumn String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

project :: forall r . SelectionSet
                      Scope__Project
                      r -> SelectionSet
                           Scope__ProjectColumn
                           r
project = selectionForCompositeField
          "project"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

purpose :: SelectionSet Scope__ProjectColumn (Maybe ProjectColumnPurpose)
purpose = selectionForField "purpose" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__ProjectColumn Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__ProjectColumn DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__ProjectColumn Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
