module Examples.Github.Object.PackageTag where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__PackageTag, Scope__PackageVersion)
import Examples.Github.Scalars (Id)
import Data.Maybe (Maybe)

id :: SelectionSet Scope__PackageTag Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__PackageTag String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

version :: forall r . SelectionSet
                      Scope__PackageVersion
                      r -> SelectionSet
                           Scope__PackageTag
                           (Maybe
                            r)
version = selectionForCompositeField
          "version"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer
