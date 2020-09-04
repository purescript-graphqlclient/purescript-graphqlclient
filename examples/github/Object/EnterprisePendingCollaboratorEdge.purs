module Examples.Github.Object.EnterprisePendingCollaboratorEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphqlArguments
  )
import Examples.Github.Scopes
  ( Scope__EnterprisePendingCollaboratorEdge
  , Scope__User
  , Scope__EnterpriseRepositoryInfoConnection
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.InputObject
  ( RepositoryOrder
  ) as Examples.Github.InputObject
import Type.Row
  ( type (+)
  )

cursor :: SelectionSet Scope__EnterprisePendingCollaboratorEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

isUnlicensed :: SelectionSet Scope__EnterprisePendingCollaboratorEdge Boolean
isUnlicensed = selectionForField "isUnlicensed" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__EnterprisePendingCollaboratorEdge (Maybe r)
node = selectionForCompositeField "node" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoriesInputRowOptional r = ( after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      , orderBy :: Optional Examples.Github.InputObject.RepositoryOrder
                                      | r
                                      )

type RepositoriesInput = { | RepositoriesInputRowOptional + () }

repositories :: forall r . RepositoriesInput -> SelectionSet Scope__EnterpriseRepositoryInfoConnection r -> SelectionSet Scope__EnterprisePendingCollaboratorEdge r
repositories input = selectionForCompositeField "repositories" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer
