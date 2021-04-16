module Examples.Github.Object.PackageVersion where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.InputObject (PackageFileOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__PackageFileConnection
  , Scope__PackageVersion
  , Scope__Package
  , Scope__Release
  , Scope__PackageVersionStatistics
  )
import Examples.Github.Scalars (Id)
import Data.Maybe (Maybe)

type FilesInputRowOptional r
  = ( orderBy :: Optional Examples.Github.InputObject.PackageFileOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type FilesInput = { | FilesInputRowOptional + () }

files
  :: forall r
   . FilesInput
  -> SelectionSet Scope__PackageFileConnection r
  -> SelectionSet Scope__PackageVersion r
files input = selectionForCompositeField
              "files"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__PackageVersion Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

package
  :: forall r
   . SelectionSet Scope__Package r
  -> SelectionSet Scope__PackageVersion (Maybe r)
package = selectionForCompositeField
          "package"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

platform :: SelectionSet Scope__PackageVersion (Maybe String)
platform = selectionForField "platform" [] graphqlDefaultResponseScalarDecoder

preRelease :: SelectionSet Scope__PackageVersion Boolean
preRelease = selectionForField
             "preRelease"
             []
             graphqlDefaultResponseScalarDecoder

readme :: SelectionSet Scope__PackageVersion (Maybe String)
readme = selectionForField "readme" [] graphqlDefaultResponseScalarDecoder

release
  :: forall r
   . SelectionSet Scope__Release r
  -> SelectionSet Scope__PackageVersion (Maybe r)
release = selectionForCompositeField
          "release"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

statistics
  :: forall r
   . SelectionSet Scope__PackageVersionStatistics r
  -> SelectionSet Scope__PackageVersion (Maybe r)
statistics = selectionForCompositeField
             "statistics"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

summary :: SelectionSet Scope__PackageVersion (Maybe String)
summary = selectionForField "summary" [] graphqlDefaultResponseScalarDecoder

version :: SelectionSet Scope__PackageVersion String
version = selectionForField "version" [] graphqlDefaultResponseScalarDecoder
