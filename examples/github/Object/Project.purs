module Examples.Github.Object.Project where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__Project
  , Scope__ProjectColumnConnection
  , Scope__Actor
  , Scope__ProjectOwner
  , Scope__ProjectCardConnection
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Html, DateTime, Id, Uri)
import Type.Row (type (+))
import Examples.Github.Enum.ProjectCardArchivedState (ProjectCardArchivedState)
import Examples.Github.Enum.ProjectState (ProjectState)

body :: SelectionSet Scope__Project (Maybe String)
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__Project Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

closed :: SelectionSet Scope__Project Boolean
closed = selectionForField "closed" [] graphqlDefaultResponseScalarDecoder

closedAt :: SelectionSet Scope__Project (Maybe DateTime)
closedAt = selectionForField "closedAt" [] graphqlDefaultResponseScalarDecoder

type ColumnsInputRowOptional r = ( after :: Optional
                                            String
                                 , before :: Optional String
                                 , first :: Optional Int
                                 , last :: Optional Int
                                 | r
                                 )

type ColumnsInput = { | ColumnsInputRowOptional + () }

columns :: forall r . ColumnsInput -> SelectionSet
                                      Scope__ProjectColumnConnection
                                      r -> SelectionSet
                                           Scope__Project
                                           r
columns input = selectionForCompositeField
                "columns"
                (toGraphqlArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__Project DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

creator :: forall r . SelectionSet
                      Scope__Actor
                      r -> SelectionSet
                           Scope__Project
                           (Maybe
                            r)
creator = selectionForCompositeField
          "creator"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

databaseId :: SelectionSet Scope__Project (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Project Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Project String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

number :: SelectionSet Scope__Project Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

owner :: forall r . SelectionSet
                    Scope__ProjectOwner
                    r -> SelectionSet
                         Scope__Project
                         r
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingCardsInputRowOptional r = ( after :: Optional
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

type PendingCardsInput = { | PendingCardsInputRowOptional + () }

pendingCards :: forall r . PendingCardsInput -> SelectionSet
                                                Scope__ProjectCardConnection
                                                r -> SelectionSet
                                                     Scope__Project
                                                     r
pendingCards input = selectionForCompositeField
                     "pendingCards"
                     (toGraphqlArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Project Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__Project ProjectState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Project DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Project Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__Project Boolean
viewerCanUpdate = selectionForField
                  "viewerCanUpdate"
                  []
                  graphqlDefaultResponseScalarDecoder
