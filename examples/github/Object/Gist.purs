module Examples.Github.Object.Gist where

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
  ( Scope__GistCommentConnection
  , Scope__Gist
  , Scope__GistFile
  , Scope__GistConnection
  , Scope__RepositoryOwner
  , Scope__StargazerConnection
  )
import Examples.Github.Scalars (DateTime, GitObjectId, Id, Uri)
import Data.Maybe (Maybe)
import Examples.Github.InputObject (GistOrder, StarOrder) as Examples.Github.InputObject

type CommentsInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type CommentsInput = { | CommentsInputRowOptional + () }

comments :: forall r . CommentsInput -> SelectionSet
                                        Scope__GistCommentConnection
                                        r -> SelectionSet
                                             Scope__Gist
                                             r
comments input = selectionForCompositeField
                 "comments"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__Gist DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Gist (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

type FilesInputRowOptional r = ( limit :: Optional Int
                               , oid :: Optional GitObjectId
                               | r
                               )

type FilesInput = { | FilesInputRowOptional + () }

files :: forall r . FilesInput -> SelectionSet
                                  Scope__GistFile
                                  r -> SelectionSet
                                       Scope__Gist
                                       (Maybe
                                        (Array
                                         (Maybe
                                          r)))
files input = selectionForCompositeField
              "files"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ForksInputRowOptional r = ( after :: Optional String
                               , before :: Optional String
                               , first :: Optional Int
                               , last :: Optional Int
                               , orderBy :: Optional
                                            Examples.Github.InputObject.GistOrder
                               | r
                               )

type ForksInput = { | ForksInputRowOptional + () }

forks :: forall r . ForksInput -> SelectionSet
                                  Scope__GistConnection
                                  r -> SelectionSet
                                       Scope__Gist
                                       r
forks input = selectionForCompositeField
              "forks"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Gist Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isFork :: SelectionSet Scope__Gist Boolean
isFork = selectionForField "isFork" [] graphqlDefaultResponseScalarDecoder

isPublic :: SelectionSet Scope__Gist Boolean
isPublic = selectionForField "isPublic" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Gist String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

owner :: forall r . SelectionSet
                    Scope__RepositoryOwner
                    r -> SelectionSet
                         Scope__Gist
                         (Maybe
                          r)
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pushedAt :: SelectionSet Scope__Gist (Maybe DateTime)
pushedAt = selectionForField "pushedAt" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__Gist Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

stargazerCount :: SelectionSet Scope__Gist Int
stargazerCount = selectionForField
                 "stargazerCount"
                 []
                 graphqlDefaultResponseScalarDecoder

type StargazersInputRowOptional r = ( after :: Optional String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    , orderBy :: Optional
                                                 Examples.Github.InputObject.StarOrder
                                    | r
                                    )

type StargazersInput = { | StargazersInputRowOptional + () }

stargazers :: forall r . StargazersInput -> SelectionSet
                                            Scope__StargazerConnection
                                            r -> SelectionSet
                                                 Scope__Gist
                                                 r
stargazers input = selectionForCompositeField
                   "stargazers"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

updatedAt :: SelectionSet Scope__Gist DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Gist Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerHasStarred :: SelectionSet Scope__Gist Boolean
viewerHasStarred = selectionForField
                   "viewerHasStarred"
                   []
                   graphqlDefaultResponseScalarDecoder
