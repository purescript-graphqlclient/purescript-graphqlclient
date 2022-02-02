module Examples.Github.Object.ProjectNextField where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__ProjectNextField, Scope__ProjectNext)
import Examples.Github.Scalars (DateTime, Id)
import Data.Maybe (Maybe)

createdAt :: SelectionSet Scope__ProjectNextField DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__ProjectNextField (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ProjectNextField Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__ProjectNextField String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

project
  :: forall r
   . SelectionSet Scope__ProjectNext r
  -> SelectionSet Scope__ProjectNextField r
project = selectionForCompositeField
          "project"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

settings :: SelectionSet Scope__ProjectNextField (Maybe String)
settings = selectionForField "settings" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__ProjectNextField DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
