module Dillonkearns.Examples.Github.Object.EnterpriseServerUserAccountsUploadEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__EnterpriseServerUserAccountsUploadEdge
  , Scope__EnterpriseServerUserAccountsUpload
  )
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__EnterpriseServerUserAccountsUploadEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__EnterpriseServerUserAccountsUpload r
  -> SelectionSet Scope__EnterpriseServerUserAccountsUploadEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
