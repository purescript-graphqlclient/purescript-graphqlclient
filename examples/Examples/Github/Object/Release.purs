module Examples.Github.Object.Release where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , toGraphQLArguments
  )
import Examples.Github.Scopes
  ( Scope__User
  , Scope__Release
  , Scope__UserConnection
  , Scope__ReactionGroup
  , Scope__ReactionConnection
  , Scope__ReleaseAssetConnection
  , Scope__Repository
  , Scope__Ref
  , Scope__Commit
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Html, Id, Uri)
import Type.Row (type (+))
import Examples.Github.Enum.ReactionContent (ReactionContent)
import Examples.Github.InputObject (ReactionOrder) as Examples.Github.InputObject

author
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__Release (Maybe r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__Release DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Release (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Release (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

descriptionHTML :: SelectionSet Scope__Release (Maybe Html)
descriptionHTML = selectionForField
                  "descriptionHTML"
                  []
                  graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Release Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isDraft :: SelectionSet Scope__Release Boolean
isDraft = selectionForField "isDraft" [] graphqlDefaultResponseScalarDecoder

isLatest :: SelectionSet Scope__Release Boolean
isLatest = selectionForField "isLatest" [] graphqlDefaultResponseScalarDecoder

isPrerelease :: SelectionSet Scope__Release Boolean
isPrerelease = selectionForField
               "isPrerelease"
               []
               graphqlDefaultResponseScalarDecoder

type MentionsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type MentionsInput = { | MentionsInputRowOptional + () }

mentions
  :: forall r
   . MentionsInput
  -> SelectionSet Scope__UserConnection r
  -> SelectionSet Scope__Release (Maybe r)
mentions input = selectionForCompositeField
                 "mentions"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

name :: SelectionSet Scope__Release (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__Release (Maybe DateTime)
publishedAt = selectionForField
              "publishedAt"
              []
              graphqlDefaultResponseScalarDecoder

reactionGroups
  :: forall r
   . SelectionSet Scope__ReactionGroup r
  -> SelectionSet Scope__Release (Maybe (Array r))
reactionGroups = selectionForCompositeField
                 "reactionGroups"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReactionsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , content :: Optional ReactionContent
    , orderBy :: Optional Examples.Github.InputObject.ReactionOrder
    | r
    )

type ReactionsInput = { | ReactionsInputRowOptional + () }

reactions
  :: forall r
   . ReactionsInput
  -> SelectionSet Scope__ReactionConnection r
  -> SelectionSet Scope__Release r
reactions input = selectionForCompositeField
                  "reactions"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReleaseAssetsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , name :: Optional String
    | r
    )

type ReleaseAssetsInput = { | ReleaseAssetsInputRowOptional + () }

releaseAssets
  :: forall r
   . ReleaseAssetsInput
  -> SelectionSet Scope__ReleaseAssetConnection r
  -> SelectionSet Scope__Release r
releaseAssets input = selectionForCompositeField
                      "releaseAssets"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__Release r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Release Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

type ShortDescriptionHtmlInputRowOptional r = ( limit :: Optional Int | r )

type ShortDescriptionHtmlInput = { | ShortDescriptionHtmlInputRowOptional + () }

shortDescriptionHTML
  :: ShortDescriptionHtmlInput
  -> SelectionSet Scope__Release (Maybe Html)
shortDescriptionHTML input = selectionForField
                             "shortDescriptionHTML"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseScalarDecoder

tag
  :: forall r
   . SelectionSet Scope__Ref r
  -> SelectionSet Scope__Release (Maybe r)
tag = selectionForCompositeField
      "tag"
      []
      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

tagCommit
  :: forall r
   . SelectionSet Scope__Commit r
  -> SelectionSet Scope__Release (Maybe r)
tagCommit = selectionForCompositeField
            "tagCommit"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

tagName :: SelectionSet Scope__Release String
tagName = selectionForField "tagName" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Release DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Release Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanReact :: SelectionSet Scope__Release Boolean
viewerCanReact = selectionForField
                 "viewerCanReact"
                 []
                 graphqlDefaultResponseScalarDecoder
