module Examples.Github.Object.CreateCommitOnBranchPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__CreateCommitOnBranchPayload, Scope__Commit, Scope__Ref)
import Data.Maybe (Maybe)

clientMutationId
  :: SelectionSet
     Scope__CreateCommitOnBranchPayload
     (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

commit
  :: forall r
   . SelectionSet Scope__Commit r
  -> SelectionSet Scope__CreateCommitOnBranchPayload (Maybe r)
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ref
  :: forall r
   . SelectionSet Scope__Ref r
  -> SelectionSet Scope__CreateCommitOnBranchPayload (Maybe r)
ref = selectionForCompositeField
      "ref"
      []
      graphqlDefaultResponseFunctorOrScalarDecoderTransformer
