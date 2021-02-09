module Dillonkearns.Examples.Github.Object.CheckSuite where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphQLArguments
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__App
  , Scope__CheckSuite
  , Scope__Ref
  , Scope__CheckRunConnection
  , Scope__Commit
  , Scope__PullRequestConnection
  , Scope__Push
  , Scope__Repository
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.InputObject (CheckRunFilter, IssueOrder) as Dillonkearns.Examples.Github.InputObject
import Type.Row (type (+))
import Dillonkearns.Examples.Github.Enum.CheckConclusionState
  (CheckConclusionState)
import Dillonkearns.Examples.Github.Scalars (DateTime, Id, Uri)
import Dillonkearns.Examples.Github.Enum.PullRequestState (PullRequestState)
import Dillonkearns.Examples.Github.Enum.CheckStatusState (CheckStatusState)

app
  :: forall r
   . SelectionSet Scope__App r
  -> SelectionSet Scope__CheckSuite (Maybe r)
app = selectionForCompositeField
      "app"
      []
      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

branch
  :: forall r
   . SelectionSet Scope__Ref r
  -> SelectionSet Scope__CheckSuite (Maybe r)
branch = selectionForCompositeField
         "branch"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CheckRunsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , filterBy
      :: Optional
         Dillonkearns.Examples.Github.InputObject.CheckRunFilter
    | r
    )

type CheckRunsInput = { | CheckRunsInputRowOptional + () }

checkRuns
  :: forall r
   . CheckRunsInput
  -> SelectionSet Scope__CheckRunConnection r
  -> SelectionSet Scope__CheckSuite (Maybe r)
checkRuns input = selectionForCompositeField
                  "checkRuns"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commit
  :: forall r
   . SelectionSet Scope__Commit r
  -> SelectionSet Scope__CheckSuite r
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

conclusion :: SelectionSet Scope__CheckSuite (Maybe CheckConclusionState)
conclusion = selectionForField
             "conclusion"
             []
             graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__CheckSuite DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__CheckSuite (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__CheckSuite Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type MatchingPullRequestsInputRowOptional r
  = ( states :: Optional (Array PullRequestState)
    , labels :: Optional (Array String)
    , headRefName :: Optional String
    , baseRefName :: Optional String
    , orderBy :: Optional Dillonkearns.Examples.Github.InputObject.IssueOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type MatchingPullRequestsInput = { | MatchingPullRequestsInputRowOptional + () }

matchingPullRequests
  :: forall r
   . MatchingPullRequestsInput
  -> SelectionSet Scope__PullRequestConnection r
  -> SelectionSet Scope__CheckSuite (Maybe r)
matchingPullRequests input = selectionForCompositeField
                             "matchingPullRequests"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

push
  :: forall r
   . SelectionSet Scope__Push r
  -> SelectionSet Scope__CheckSuite (Maybe r)
push = selectionForCompositeField
       "push"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__CheckSuite r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__CheckSuite Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

status :: SelectionSet Scope__CheckSuite CheckStatusState
status = selectionForField "status" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__CheckSuite DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__CheckSuite Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
