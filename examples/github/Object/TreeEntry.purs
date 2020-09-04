module Examples.Github.Object.TreeEntry where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__TreeEntry
  , Scope__GitObject
  , Scope__Repository
  , Scope__Submodule
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( GitObjectId
  )

mode :: SelectionSet Scope__TreeEntry Int
mode = selectionForField "mode" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__TreeEntry String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

object :: forall r . SelectionSet Scope__GitObject r -> SelectionSet Scope__TreeEntry (Maybe r)
object = selectionForCompositeField "object" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

oid :: SelectionSet Scope__TreeEntry GitObjectId
oid = selectionForField "oid" [] graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__TreeEntry r
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

submodule :: forall r . SelectionSet Scope__Submodule r -> SelectionSet Scope__TreeEntry (Maybe r)
submodule = selectionForCompositeField "submodule" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type_ :: SelectionSet Scope__TreeEntry String
type_ = selectionForField "type" [] graphqlDefaultResponseScalarDecoder
