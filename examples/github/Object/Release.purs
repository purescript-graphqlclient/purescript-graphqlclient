module Examples.Github.Object.Release where

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
  ( Scope__User
  , Scope__Release
  , Scope__ReleaseAssetConnection
  , Scope__Ref
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Html
  , Id
  , Uri
  )
import Type.Row
  ( type (+)
  )

author :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__Release (Maybe r)
author = selectionForCompositeField "author" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__Release DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Release (Maybe String)
description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

descriptionHTML :: SelectionSet Scope__Release (Maybe Html)
descriptionHTML = selectionForField "descriptionHTML" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Release Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isDraft :: SelectionSet Scope__Release Boolean
isDraft = selectionForField "isDraft" [] graphqlDefaultResponseScalarDecoder

isPrerelease :: SelectionSet Scope__Release Boolean
isPrerelease = selectionForField "isPrerelease" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Release (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__Release (Maybe DateTime)
publishedAt = selectionForField "publishedAt" [] graphqlDefaultResponseScalarDecoder

type ReleaseAssetsInputRowOptional r = ( after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       , name :: Optional String
                                       | r
                                       )

type ReleaseAssetsInput = { | ReleaseAssetsInputRowOptional + () }

releaseAssets :: forall r . ReleaseAssetsInput -> SelectionSet Scope__ReleaseAssetConnection r -> SelectionSet Scope__Release r
releaseAssets input = selectionForCompositeField "releaseAssets" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Release Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

type ShortDescriptionHtmlInputRowOptional r = ( limit :: Optional Int
                                              | r
                                              )

type ShortDescriptionHtmlInput = { | ShortDescriptionHtmlInputRowOptional + () }

shortDescriptionHTML :: ShortDescriptionHtmlInput -> SelectionSet Scope__Release (Maybe Html)
shortDescriptionHTML input = selectionForField "shortDescriptionHTML" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

tag :: forall r . SelectionSet Scope__Ref r -> SelectionSet Scope__Release (Maybe r)
tag = selectionForCompositeField "tag" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

tagName :: SelectionSet Scope__Release String
tagName = selectionForField "tagName" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Release DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Release Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
