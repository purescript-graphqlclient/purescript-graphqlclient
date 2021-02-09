module Examples.Github.Object.MergeBranchPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__MergeBranchPayload, Scope__Commit)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet Scope__MergeBranchPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

mergeCommit
  :: forall r
   . SelectionSet Scope__Commit r
  -> SelectionSet Scope__MergeBranchPayload (Maybe r)
mergeCommit = selectionForCompositeField
              "mergeCommit"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
