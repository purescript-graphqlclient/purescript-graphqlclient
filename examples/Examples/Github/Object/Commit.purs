module Examples.Github.Object.Commit where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__Commit
  , Scope__PullRequestConnection
  , Scope__GitActor
  , Scope__GitActorConnection
  , Scope__Blame
  , Scope__CheckSuiteConnection
  , Scope__CommitCommentConnection
  , Scope__DeploymentConnection
  , Scope__TreeEntry
  , Scope__CommitHistoryConnection
  , Scope__Organization
  , Scope__CommitConnection
  , Scope__Repository
  , Scope__GitSignature
  , Scope__Status
  , Scope__StatusCheckRollup
  , Scope__SubmoduleConnection
  , Scope__Tree
  )
import Examples.Github.InputObject
  (PullRequestOrder, CheckSuiteFilter, DeploymentOrder, CommitAuthor) as Examples.Github.InputObject
import Type.Row (type (+))
import Data.Maybe (Maybe)
import Examples.Github.Scalars
  (DateTime, Uri, GitTimestamp, Id, Html, GitObjectId)
import Examples.Github.Enum.SubscriptionState (SubscriptionState)

abbreviatedOid :: SelectionSet Scope__Commit String
abbreviatedOid = selectionForField
                 "abbreviatedOid"
                 []
                 graphqlDefaultResponseScalarDecoder

additions :: SelectionSet Scope__Commit Int
additions = selectionForField "additions" [] graphqlDefaultResponseScalarDecoder

type AssociatedPullRequestsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy
      :: Optional
         Examples.Github.InputObject.PullRequestOrder
    | r
    )

type AssociatedPullRequestsInput
  = { | AssociatedPullRequestsInputRowOptional + () }

associatedPullRequests
  :: forall r
   . AssociatedPullRequestsInput
  -> SelectionSet Scope__PullRequestConnection r
  -> SelectionSet Scope__Commit (Maybe r)
associatedPullRequests input = selectionForCompositeField
                               "associatedPullRequests"
                               (toGraphQLArguments
                                input)
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

author
  :: forall r
   . SelectionSet Scope__GitActor r
  -> SelectionSet Scope__Commit (Maybe r)
author = selectionForCompositeField
         "author"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

authoredByCommitter :: SelectionSet Scope__Commit Boolean
authoredByCommitter = selectionForField
                      "authoredByCommitter"
                      []
                      graphqlDefaultResponseScalarDecoder

authoredDate :: SelectionSet Scope__Commit DateTime
authoredDate = selectionForField
               "authoredDate"
               []
               graphqlDefaultResponseScalarDecoder

type AuthorsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type AuthorsInput = { | AuthorsInputRowOptional + () }

authors
  :: forall r
   . AuthorsInput
  -> SelectionSet Scope__GitActorConnection r
  -> SelectionSet Scope__Commit r
authors input = selectionForCompositeField
                "authors"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type BlameInputRowRequired r = ( path :: String | r )

type BlameInput = { | BlameInputRowRequired + () }

blame
  :: forall r
   . BlameInput
  -> SelectionSet Scope__Blame r
  -> SelectionSet Scope__Commit r
blame input = selectionForCompositeField
              "blame"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

changedFiles :: SelectionSet Scope__Commit Int
changedFiles = selectionForField
               "changedFiles"
               []
               graphqlDefaultResponseScalarDecoder

type CheckSuitesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , filterBy
      :: Optional
         Examples.Github.InputObject.CheckSuiteFilter
    | r
    )

type CheckSuitesInput = { | CheckSuitesInputRowOptional + () }

checkSuites
  :: forall r
   . CheckSuitesInput
  -> SelectionSet Scope__CheckSuiteConnection r
  -> SelectionSet Scope__Commit (Maybe r)
checkSuites input = selectionForCompositeField
                    "checkSuites"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CommentsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type CommentsInput = { | CommentsInputRowOptional + () }

comments
  :: forall r
   . CommentsInput
  -> SelectionSet Scope__CommitCommentConnection r
  -> SelectionSet Scope__Commit r
comments input = selectionForCompositeField
                 "comments"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

commitResourcePath :: SelectionSet Scope__Commit Uri
commitResourcePath = selectionForField
                     "commitResourcePath"
                     []
                     graphqlDefaultResponseScalarDecoder

commitUrl :: SelectionSet Scope__Commit Uri
commitUrl = selectionForField "commitUrl" [] graphqlDefaultResponseScalarDecoder

committedDate :: SelectionSet Scope__Commit DateTime
committedDate = selectionForField
                "committedDate"
                []
                graphqlDefaultResponseScalarDecoder

committedViaWeb :: SelectionSet Scope__Commit Boolean
committedViaWeb = selectionForField
                  "committedViaWeb"
                  []
                  graphqlDefaultResponseScalarDecoder

committer
  :: forall r
   . SelectionSet Scope__GitActor r
  -> SelectionSet Scope__Commit (Maybe r)
committer = selectionForCompositeField
            "committer"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

deletions :: SelectionSet Scope__Commit Int
deletions = selectionForField "deletions" [] graphqlDefaultResponseScalarDecoder

type DeploymentsInputRowOptional r
  = ( environments :: Optional (Array String)
    , orderBy
      :: Optional
         Examples.Github.InputObject.DeploymentOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type DeploymentsInput = { | DeploymentsInputRowOptional + () }

deployments
  :: forall r
   . DeploymentsInput
  -> SelectionSet Scope__DeploymentConnection r
  -> SelectionSet Scope__Commit (Maybe r)
deployments input = selectionForCompositeField
                    "deployments"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type FileInputRowRequired r = ( path :: String | r )

type FileInput = { | FileInputRowRequired + () }

file
  :: forall r
   . FileInput
  -> SelectionSet Scope__TreeEntry r
  -> SelectionSet Scope__Commit (Maybe r)
file input = selectionForCompositeField
             "file"
             (toGraphQLArguments
              input)
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HistoryInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , path :: Optional String
    , author :: Optional Examples.Github.InputObject.CommitAuthor
    , since :: Optional GitTimestamp
    , until :: Optional GitTimestamp
    | r
    )

type HistoryInput = { | HistoryInputRowOptional + () }

history
  :: forall r
   . HistoryInput
  -> SelectionSet Scope__CommitHistoryConnection r
  -> SelectionSet Scope__Commit r
history input = selectionForCompositeField
                "history"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Commit Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

message :: SelectionSet Scope__Commit String
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

messageBody :: SelectionSet Scope__Commit String
messageBody = selectionForField
              "messageBody"
              []
              graphqlDefaultResponseScalarDecoder

messageBodyHTML :: SelectionSet Scope__Commit Html
messageBodyHTML = selectionForField
                  "messageBodyHTML"
                  []
                  graphqlDefaultResponseScalarDecoder

messageHeadline :: SelectionSet Scope__Commit String
messageHeadline = selectionForField
                  "messageHeadline"
                  []
                  graphqlDefaultResponseScalarDecoder

messageHeadlineHTML :: SelectionSet Scope__Commit Html
messageHeadlineHTML = selectionForField
                      "messageHeadlineHTML"
                      []
                      graphqlDefaultResponseScalarDecoder

oid :: SelectionSet Scope__Commit GitObjectId
oid = selectionForField "oid" [] graphqlDefaultResponseScalarDecoder

onBehalfOf
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__Commit (Maybe r)
onBehalfOf = selectionForCompositeField
             "onBehalfOf"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ParentsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type ParentsInput = { | ParentsInputRowOptional + () }

parents
  :: forall r
   . ParentsInput
  -> SelectionSet Scope__CommitConnection r
  -> SelectionSet Scope__Commit r
parents input = selectionForCompositeField
                "parents"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pushedDate :: SelectionSet Scope__Commit (Maybe DateTime)
pushedDate = selectionForField
             "pushedDate"
             []
             graphqlDefaultResponseScalarDecoder

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__Commit r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Commit Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

signature
  :: forall r
   . SelectionSet Scope__GitSignature r
  -> SelectionSet Scope__Commit (Maybe r)
signature = selectionForCompositeField
            "signature"
            []
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

status
  :: forall r
   . SelectionSet Scope__Status r
  -> SelectionSet Scope__Commit (Maybe r)
status = selectionForCompositeField
         "status"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

statusCheckRollup
  :: forall r
   . SelectionSet Scope__StatusCheckRollup r
  -> SelectionSet Scope__Commit (Maybe r)
statusCheckRollup = selectionForCompositeField
                    "statusCheckRollup"
                    []
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SubmodulesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type SubmodulesInput = { | SubmodulesInputRowOptional + () }

submodules
  :: forall r
   . SubmodulesInput
  -> SelectionSet Scope__SubmoduleConnection r
  -> SelectionSet Scope__Commit r
submodules input = selectionForCompositeField
                   "submodules"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

tarballUrl :: SelectionSet Scope__Commit Uri
tarballUrl = selectionForField
             "tarballUrl"
             []
             graphqlDefaultResponseScalarDecoder

tree :: forall r. SelectionSet Scope__Tree r -> SelectionSet Scope__Commit r
tree = selectionForCompositeField
       "tree"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

treeResourcePath :: SelectionSet Scope__Commit Uri
treeResourcePath = selectionForField
                   "treeResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

treeUrl :: SelectionSet Scope__Commit Uri
treeUrl = selectionForField "treeUrl" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Commit Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__Commit Boolean
viewerCanSubscribe = selectionForField
                     "viewerCanSubscribe"
                     []
                     graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__Commit (Maybe SubscriptionState)
viewerSubscription = selectionForField
                     "viewerSubscription"
                     []
                     graphqlDefaultResponseScalarDecoder

zipballUrl :: SelectionSet Scope__Commit Uri
zipballUrl = selectionForField
             "zipballUrl"
             []
             graphqlDefaultResponseScalarDecoder
