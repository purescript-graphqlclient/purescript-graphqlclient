module Examples.Github.Object.ReleaseAsset where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__ReleaseAsset, Scope__Release, Scope__User)
import Examples.Github.Scalars (DateTime, Uri, Id)
import Data.Maybe (Maybe)

contentType :: SelectionSet Scope__ReleaseAsset String
contentType = selectionForField
              "contentType"
              []
              graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__ReleaseAsset DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

downloadCount :: SelectionSet Scope__ReleaseAsset Int
downloadCount = selectionForField
                "downloadCount"
                []
                graphqlDefaultResponseScalarDecoder

downloadUrl :: SelectionSet Scope__ReleaseAsset Uri
downloadUrl = selectionForField
              "downloadUrl"
              []
              graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ReleaseAsset Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__ReleaseAsset String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

release
  :: forall r
   . SelectionSet Scope__Release r
  -> SelectionSet Scope__ReleaseAsset (Maybe r)
release = selectionForCompositeField
          "release"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

size :: SelectionSet Scope__ReleaseAsset Int
size = selectionForField "size" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__ReleaseAsset DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

uploadedBy
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__ReleaseAsset r
uploadedBy = selectionForCompositeField
             "uploadedBy"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

url :: SelectionSet Scope__ReleaseAsset Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
