module Dillonkearns.Examples.Github.Object.CreatedCommitContribution where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__CreatedCommitContribution, Scope__Repository, Scope__User)
import Dillonkearns.Examples.Github.Scalars (DateTime, Uri)

commitCount :: SelectionSet Scope__CreatedCommitContribution Int
commitCount = selectionForField
              "commitCount"
              []
              graphqlDefaultResponseScalarDecoder

isRestricted :: SelectionSet Scope__CreatedCommitContribution Boolean
isRestricted = selectionForField
               "isRestricted"
               []
               graphqlDefaultResponseScalarDecoder

occurredAt :: SelectionSet Scope__CreatedCommitContribution DateTime
occurredAt = selectionForField
             "occurredAt"
             []
             graphqlDefaultResponseScalarDecoder

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__CreatedCommitContribution r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__CreatedCommitContribution Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__CreatedCommitContribution Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__CreatedCommitContribution r
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
