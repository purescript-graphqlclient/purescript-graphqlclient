module Dillonkearns.Examples.Github.Object.App where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , toGraphQLArguments
  )
import Dillonkearns.Examples.Github.Scopes (Scope__App)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id, Uri)
import Data.Maybe (Maybe)
import Type.Row (type (+))

createdAt :: SelectionSet Scope__App DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__App (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__App (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__App Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

logoBackgroundColor :: SelectionSet Scope__App String
logoBackgroundColor = selectionForField
                      "logoBackgroundColor"
                      []
                      graphqlDefaultResponseScalarDecoder

type LogoUrlInputRowOptional r = ( size :: Optional Int | r )

type LogoUrlInput = { | LogoUrlInputRowOptional + () }

logoUrl :: LogoUrlInput -> SelectionSet Scope__App Uri
logoUrl input = selectionForField
                "logoUrl"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__App String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

slug :: SelectionSet Scope__App String
slug = selectionForField "slug" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__App DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__App Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
