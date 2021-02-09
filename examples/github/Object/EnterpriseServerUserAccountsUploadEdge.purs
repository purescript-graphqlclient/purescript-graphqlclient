module Examples.Github.Object.EnterpriseServerUserAccountsUploadEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
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
