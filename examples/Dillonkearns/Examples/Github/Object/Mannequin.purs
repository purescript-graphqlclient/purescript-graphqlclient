module Dillonkearns.Examples.Github.Object.Mannequin where

import Dillonkearns.GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphQLArguments
  , graphqlDefaultResponseScalarDecoder
  )
import Type.Row (type (+))
import Dillonkearns.Examples.Github.Scopes (Scope__Mannequin)
import Dillonkearns.Examples.Github.Scalars (Uri, DateTime, Id)
import Data.Maybe (Maybe)

type AvatarUrlInputRowOptional r = ( size :: Optional Int | r )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__Mannequin Uri
avatarUrl input = selectionForField
                  "avatarUrl"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Mannequin DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Mannequin (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

email :: SelectionSet Scope__Mannequin (Maybe String)
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Mannequin Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__Mannequin String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__Mannequin Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Mannequin DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Mannequin Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
