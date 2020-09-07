module Examples.Github.Interface.GitObject where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__GitObject
  , Scope__Repository
  , Scope__Blob
  , Scope__Commit
  , Scope__Tag
  , Scope__Tree
  )
import Examples.Github.Scalars (Uri, Id, GitObjectId)
import Data.Maybe (Maybe(..))
import Prelude (pure)

abbreviatedOid :: SelectionSet Scope__GitObject String
abbreviatedOid = selectionForField
                 "abbreviatedOid"
                 []
                 graphqlDefaultResponseScalarDecoder

commitResourcePath :: SelectionSet Scope__GitObject Uri
commitResourcePath = selectionForField
                     "commitResourcePath"
                     []
                     graphqlDefaultResponseScalarDecoder

commitUrl :: SelectionSet Scope__GitObject Uri
commitUrl = selectionForField "commitUrl" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__GitObject Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

oid :: SelectionSet Scope__GitObject GitObjectId
oid = selectionForField "oid" [] graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__GitObject
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type Fragments decodesTo = { onBlob :: SelectionSet Scope__Blob decodesTo
                           , onCommit :: SelectionSet Scope__Commit decodesTo
                           , onTag :: SelectionSet Scope__Tag decodesTo
                           , onTree :: SelectionSet Scope__Tree decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__GitObject
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Blob" selections.onBlob
                       , buildFragment "Commit" selections.onCommit
                       , buildFragment "Tag" selections.onTag
                       , buildFragment "Tree" selections.onTree
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onBlob: pure
                           Nothing
                 , onCommit: pure
                             Nothing
                 , onTag: pure
                          Nothing
                 , onTree: pure
                           Nothing
                 }
