module Examples.Github.Object.Tag where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__Tag, Scope__Repository, Scope__GitActor, Scope__GitObject)
import Examples.Github.Scalars (Uri, Id, GitObjectId)
import Data.Maybe (Maybe)

abbreviatedOid :: SelectionSet Scope__Tag String
abbreviatedOid = selectionForField
                 "abbreviatedOid"
                 []
                 graphqlDefaultResponseScalarDecoder

commitResourcePath :: SelectionSet Scope__Tag Uri
commitResourcePath = selectionForField
                     "commitResourcePath"
                     []
                     graphqlDefaultResponseScalarDecoder

commitUrl :: SelectionSet Scope__Tag Uri
commitUrl = selectionForField "commitUrl" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Tag Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

message :: SelectionSet Scope__Tag (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Tag String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

oid :: SelectionSet Scope__Tag GitObjectId
oid = selectionForField "oid" [] graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__Tag
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

tagger :: forall r . SelectionSet
                     Scope__GitActor
                     r -> SelectionSet
                          Scope__Tag
                          (Maybe
                           r)
tagger = selectionForCompositeField
         "tagger"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

target :: forall r . SelectionSet
                     Scope__GitObject
                     r -> SelectionSet
                          Scope__Tag
                          r
target = selectionForCompositeField
         "target"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
