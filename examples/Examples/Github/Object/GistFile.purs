module Examples.Github.Object.GistFile where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphQLArguments
  )
import Examples.Github.Scopes (Scope__GistFile, Scope__Language)
import Data.Maybe (Maybe)
import Type.Row (type (+))

encodedName :: SelectionSet Scope__GistFile (Maybe String)
encodedName = selectionForField
              "encodedName"
              []
              graphqlDefaultResponseScalarDecoder

encoding :: SelectionSet Scope__GistFile (Maybe String)
encoding = selectionForField "encoding" [] graphqlDefaultResponseScalarDecoder

extension :: SelectionSet Scope__GistFile (Maybe String)
extension = selectionForField "extension" [] graphqlDefaultResponseScalarDecoder

isImage :: SelectionSet Scope__GistFile Boolean
isImage = selectionForField "isImage" [] graphqlDefaultResponseScalarDecoder

isTruncated :: SelectionSet Scope__GistFile Boolean
isTruncated = selectionForField
              "isTruncated"
              []
              graphqlDefaultResponseScalarDecoder

language
  :: forall r
   . SelectionSet Scope__Language r
  -> SelectionSet Scope__GistFile (Maybe r)
language = selectionForCompositeField
           "language"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

name :: SelectionSet Scope__GistFile (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

size :: SelectionSet Scope__GistFile (Maybe Int)
size = selectionForField "size" [] graphqlDefaultResponseScalarDecoder

type TextInputRowOptional r = ( truncate :: Optional Int | r )

type TextInput = { | TextInputRowOptional + () }

text :: TextInput -> SelectionSet Scope__GistFile (Maybe String)
text input = selectionForField
             "text"
             (toGraphQLArguments
              input)
             graphqlDefaultResponseScalarDecoder
