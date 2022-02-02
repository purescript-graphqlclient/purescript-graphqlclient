module Examples.Github.Object.Import where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphQLArguments
  )
import Examples.Github.Scopes
  (Scope__Import, Scope__Actor, Scope__RepositoryConnection)
import Examples.Github.Scalars (DateTime, Id)
import Examples.Github.InputObject (RepositoryOrder) as Examples.Github.InputObject
import Type.Row (type (+))

createdAt :: SelectionSet Scope__Import DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

creator :: forall r. SelectionSet Scope__Actor r -> SelectionSet Scope__Import r
creator = selectionForCompositeField
          "creator"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Import Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type RepositoriesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.RepositoryOrder
    | r
    )

type RepositoriesInput = { | RepositoriesInputRowOptional + () }

repositories
  :: forall r
   . RepositoriesInput
  -> SelectionSet Scope__RepositoryConnection r
  -> SelectionSet Scope__Import r
repositories input = selectionForCompositeField
                     "repositories"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer
