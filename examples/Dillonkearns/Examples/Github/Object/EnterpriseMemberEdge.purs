module Dillonkearns.Examples.Github.Object.EnterpriseMemberEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__EnterpriseMemberEdge, Scope__EnterpriseMember)
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__EnterpriseMemberEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

isUnlicensed :: SelectionSet Scope__EnterpriseMemberEdge Boolean
isUnlicensed = selectionForField
               "isUnlicensed"
               []
               graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__EnterpriseMember r
  -> SelectionSet Scope__EnterpriseMemberEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
