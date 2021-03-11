module Examples.Github.Object.SavedReply where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__SavedReply, Scope__Actor)
import Examples.Github.Scalars (Html, Id)
import Data.Maybe (Maybe)

body :: SelectionSet Scope__SavedReply String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__SavedReply Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__SavedReply (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__SavedReply Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

title :: SelectionSet Scope__SavedReply String
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__SavedReply (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
