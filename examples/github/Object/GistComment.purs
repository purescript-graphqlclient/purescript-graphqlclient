module Examples.Github.Object.GistComment where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , toGraphqlArguments
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__GistComment
  , Scope__Gist
  , Scope__UserContentEditConnection
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Enum.CommentAuthorAssociation
  ( CommentAuthorAssociation
  )
import Examples.Github.Scalars
  ( Html
  , DateTime
  , Id
  )
import Type.Row
  ( type (+)
  )
import Examples.Github.Enum.CommentCannotUpdateReason
  ( CommentCannotUpdateReason
  )

author :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__GistComment (Maybe r)
author = selectionForCompositeField "author" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authorAssociation :: SelectionSet Scope__GistComment CommentAuthorAssociation
authorAssociation = selectionForField "authorAssociation" [] graphqlDefaultResponseScalarDecoder

body :: SelectionSet Scope__GistComment String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

bodyHTML :: SelectionSet Scope__GistComment Html
bodyHTML = selectionForField "bodyHTML" [] graphqlDefaultResponseScalarDecoder

bodyText :: SelectionSet Scope__GistComment String
bodyText = selectionForField "bodyText" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__GistComment DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

createdViaEmail :: SelectionSet Scope__GistComment Boolean
createdViaEmail = selectionForField "createdViaEmail" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__GistComment (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

editor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__GistComment (Maybe r)
editor = selectionForCompositeField "editor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

gist :: forall r . SelectionSet Scope__Gist r -> SelectionSet Scope__GistComment r
gist = selectionForCompositeField "gist" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__GistComment Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

includesCreatedEdit :: SelectionSet Scope__GistComment Boolean
includesCreatedEdit = selectionForField "includesCreatedEdit" [] graphqlDefaultResponseScalarDecoder

isMinimized :: SelectionSet Scope__GistComment Boolean
isMinimized = selectionForField "isMinimized" [] graphqlDefaultResponseScalarDecoder

lastEditedAt :: SelectionSet Scope__GistComment (Maybe DateTime)
lastEditedAt = selectionForField "lastEditedAt" [] graphqlDefaultResponseScalarDecoder

minimizedReason :: SelectionSet Scope__GistComment (Maybe String)
minimizedReason = selectionForField "minimizedReason" [] graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__GistComment (Maybe DateTime)
publishedAt = selectionForField "publishedAt" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__GistComment DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

type UserContentEditsInputRowOptional r = ( after :: Optional String
                                          , before :: Optional String
                                          , first :: Optional Int
                                          , last :: Optional Int
                                          | r
                                          )

type UserContentEditsInput = { | UserContentEditsInputRowOptional + () }

userContentEdits :: forall r . UserContentEditsInput -> SelectionSet Scope__UserContentEditConnection r -> SelectionSet Scope__GistComment (Maybe r)
userContentEdits input = selectionForCompositeField "userContentEdits" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerCanDelete :: SelectionSet Scope__GistComment Boolean
viewerCanDelete = selectionForField "viewerCanDelete" [] graphqlDefaultResponseScalarDecoder

viewerCanMinimize :: SelectionSet Scope__GistComment Boolean
viewerCanMinimize = selectionForField "viewerCanMinimize" [] graphqlDefaultResponseScalarDecoder

viewerCanUpdate :: SelectionSet Scope__GistComment Boolean
viewerCanUpdate = selectionForField "viewerCanUpdate" [] graphqlDefaultResponseScalarDecoder

viewerCannotUpdateReasons :: SelectionSet Scope__GistComment (Array CommentCannotUpdateReason)
viewerCannotUpdateReasons = selectionForField "viewerCannotUpdateReasons" [] graphqlDefaultResponseScalarDecoder

viewerDidAuthor :: SelectionSet Scope__GistComment Boolean
viewerDidAuthor = selectionForField "viewerDidAuthor" [] graphqlDefaultResponseScalarDecoder
