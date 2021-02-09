module Dillonkearns.Examples.Github.Object.EnterpriseOutsideCollaboratorEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphQLArguments
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__EnterpriseOutsideCollaboratorEdge
  , Scope__User
  , Scope__EnterpriseRepositoryInfoConnection
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.InputObject (RepositoryOrder) as Dillonkearns.Examples.Github.InputObject
import Type.Row (type (+))

cursor :: SelectionSet Scope__EnterpriseOutsideCollaboratorEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

isUnlicensed :: SelectionSet Scope__EnterpriseOutsideCollaboratorEdge Boolean
isUnlicensed = selectionForField
               "isUnlicensed"
               []
               graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__EnterpriseOutsideCollaboratorEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoriesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy
      :: Optional
         Dillonkearns.Examples.Github.InputObject.RepositoryOrder
    | r
    )

type RepositoriesInput = { | RepositoriesInputRowOptional + () }

repositories
  :: forall r
   . RepositoriesInput
  -> SelectionSet Scope__EnterpriseRepositoryInfoConnection r
  -> SelectionSet Scope__EnterpriseOutsideCollaboratorEdge r
repositories input = selectionForCompositeField
                     "repositories"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer
