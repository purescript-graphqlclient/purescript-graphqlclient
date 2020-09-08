module Examples.Github.Object.Blob where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__Blob, Scope__Repository)
import Examples.Github.Scalars (Uri, Id, GitObjectId)
import Data.Maybe (Maybe)

abbreviatedOid :: SelectionSet Scope__Blob String
abbreviatedOid = selectionForField
                 "abbreviatedOid"
                 []
                 graphqlDefaultResponseScalarDecoder

byteSize :: SelectionSet Scope__Blob Int
byteSize = selectionForField "byteSize" [] graphqlDefaultResponseScalarDecoder

commitResourcePath :: SelectionSet Scope__Blob Uri
commitResourcePath = selectionForField
                     "commitResourcePath"
                     []
                     graphqlDefaultResponseScalarDecoder

commitUrl :: SelectionSet Scope__Blob Uri
commitUrl = selectionForField "commitUrl" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Blob Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isBinary :: SelectionSet Scope__Blob (Maybe Boolean)
isBinary = selectionForField "isBinary" [] graphqlDefaultResponseScalarDecoder

isTruncated :: SelectionSet Scope__Blob Boolean
isTruncated = selectionForField
              "isTruncated"
              []
              graphqlDefaultResponseScalarDecoder

oid :: SelectionSet Scope__Blob GitObjectId
oid = selectionForField "oid" [] graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__Blob
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

text :: SelectionSet Scope__Blob (Maybe String)
text = selectionForField "text" [] graphqlDefaultResponseScalarDecoder
