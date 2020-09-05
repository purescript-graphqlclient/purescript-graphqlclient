module Examples.Github.Object.Tree where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__Tree, Scope__TreeEntry, Scope__Repository)
import Examples.Github.Scalars (Uri, Id, GitObjectId)
import Data.Maybe (Maybe)

abbreviatedOid :: SelectionSet Scope__Tree String
abbreviatedOid = selectionForField
                 "abbreviatedOid"
                 []
                 graphqlDefaultResponseScalarDecoder

commitResourcePath :: SelectionSet Scope__Tree Uri
commitResourcePath = selectionForField
                     "commitResourcePath"
                     []
                     graphqlDefaultResponseScalarDecoder

commitUrl :: SelectionSet Scope__Tree Uri
commitUrl = selectionForField "commitUrl" [] graphqlDefaultResponseScalarDecoder

entries :: forall r . SelectionSet
                      Scope__TreeEntry
                      r -> SelectionSet
                           Scope__Tree
                           (Maybe
                            (Array
                             r))
entries = selectionForCompositeField
          "entries"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Tree Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

oid :: SelectionSet Scope__Tree GitObjectId
oid = selectionForField "oid" [] graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__Tree
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
