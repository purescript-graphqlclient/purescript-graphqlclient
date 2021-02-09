module Dillonkearns.Examples.Github.Object.Bot where

import Dillonkearns.GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphQLArguments
  , graphqlDefaultResponseScalarDecoder
  )
import Type.Row (type (+))
import Dillonkearns.Examples.Github.Scopes (Scope__Bot)
import Dillonkearns.Examples.Github.Scalars (Uri, DateTime, Id)
import Data.Maybe (Maybe)

type AvatarUrlInputRowOptional r = ( size :: Optional Int | r )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__Bot Uri
avatarUrl input = selectionForField
                  "avatarUrl"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Bot DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Bot (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Bot Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__Bot String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__Bot Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Bot DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Bot Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
