module Examples.Github.Object.PackageFile where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__PackageFile
  , Scope__PackageVersion
  )
import Examples.Github.Scalars
  ( Id
  , DateTime
  , Uri
  )
import Data.Maybe
  ( Maybe
  )

id :: SelectionSet Scope__PackageFile Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

md5 :: SelectionSet Scope__PackageFile (Maybe String)
md5 = selectionForField "md5" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__PackageFile String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

packageVersion :: forall r . SelectionSet Scope__PackageVersion r -> SelectionSet Scope__PackageFile (Maybe r)
packageVersion = selectionForCompositeField "packageVersion" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sha1 :: SelectionSet Scope__PackageFile (Maybe String)
sha1 = selectionForField "sha1" [] graphqlDefaultResponseScalarDecoder

sha256 :: SelectionSet Scope__PackageFile (Maybe String)
sha256 = selectionForField "sha256" [] graphqlDefaultResponseScalarDecoder

size :: SelectionSet Scope__PackageFile (Maybe Int)
size = selectionForField "size" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__PackageFile DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__PackageFile (Maybe Uri)
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
