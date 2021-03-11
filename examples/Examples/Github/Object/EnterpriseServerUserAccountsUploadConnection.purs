module Examples.Github.Object.EnterpriseServerUserAccountsUploadConnection where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__EnterpriseServerUserAccountsUploadEdge
  , Scope__EnterpriseServerUserAccountsUploadConnection
  , Scope__EnterpriseServerUserAccountsUpload
  , Scope__PageInfo
  )
import Data.Maybe (Maybe)

edges
  :: forall r
   . SelectionSet Scope__EnterpriseServerUserAccountsUploadEdge r
  -> SelectionSet
        Scope__EnterpriseServerUserAccountsUploadConnection
        (Maybe (Array (Maybe r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes
  :: forall r
   . SelectionSet Scope__EnterpriseServerUserAccountsUpload r
  -> SelectionSet
        Scope__EnterpriseServerUserAccountsUploadConnection
        (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo
  :: forall r
   . SelectionSet Scope__PageInfo r
  -> SelectionSet Scope__EnterpriseServerUserAccountsUploadConnection r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount
  :: SelectionSet
     Scope__EnterpriseServerUserAccountsUploadConnection
     Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
