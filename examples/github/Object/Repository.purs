module Examples.Github.Object.Repository where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__UserConnection
  , Scope__Repository
  , Scope__BranchProtectionRuleConnection
  , Scope__CodeOfConduct
  , Scope__RepositoryCollaboratorConnection
  , Scope__CommitCommentConnection
  , Scope__Ref
  , Scope__DeployKeyConnection
  , Scope__DeploymentConnection
  , Scope__RepositoryConnection
  , Scope__FundingLink
  , Scope__Issue
  , Scope__IssueOrPullRequest
  , Scope__IssueConnection
  , Scope__Label
  , Scope__LabelConnection
  , Scope__LanguageConnection
  , Scope__License
  , Scope__Milestone
  , Scope__MilestoneConnection
  , Scope__GitObject
  , Scope__RepositoryOwner
  , Scope__PackageConnection
  , Scope__Language
  , Scope__Project
  , Scope__ProjectConnection
  , Scope__PullRequest
  , Scope__PullRequestConnection
  , Scope__RefConnection
  , Scope__Release
  , Scope__ReleaseConnection
  , Scope__RepositoryTopicConnection
  , Scope__StargazerConnection
  , Scope__SubmoduleConnection
  , Scope__RepositoryVulnerabilityAlertConnection
  )
import Data.Maybe (Maybe)
import Examples.Github.Enum.CollaboratorAffiliation (CollaboratorAffiliation)
import Examples.Github.Scalars
  (DateTime, Html, Uri, Id, GitObjectId, GitSshRemote)
import Examples.Github.InputObject
  ( DeploymentOrder
  , RepositoryOrder
  , IssueOrder
  , IssueFilters
  , LabelOrder
  , LanguageOrder
  , MilestoneOrder
  , PackageOrder
  , ProjectOrder
  , RefOrder
  , ReleaseOrder
  , StarOrder
  ) as Examples.Github.InputObject
import Examples.Github.Enum.RepositoryPrivacy (RepositoryPrivacy)
import Examples.Github.Enum.RepositoryAffiliation (RepositoryAffiliation)
import Examples.Github.Enum.IssueState (IssueState)
import Examples.Github.Enum.RepositoryLockReason (RepositoryLockReason)
import Examples.Github.Enum.MilestoneState (MilestoneState)
import Examples.Github.Enum.PackageType (PackageType)
import Examples.Github.Enum.ProjectState (ProjectState)
import Examples.Github.Enum.PullRequestState (PullRequestState)
import Examples.Github.Enum.OrderDirection (OrderDirection)
import Examples.Github.Enum.PullRequestMergeMethod (PullRequestMergeMethod)
import Examples.Github.Enum.RepositoryPermission (RepositoryPermission)
import Examples.Github.Enum.SubscriptionState (SubscriptionState)

type AssignableUsersInputRowOptional r = ( query :: Optional String
                                         , after :: Optional String
                                         , before :: Optional String
                                         , first :: Optional Int
                                         , last :: Optional Int
                                         | r
                                         )

type AssignableUsersInput = { | AssignableUsersInputRowOptional + () }

assignableUsers :: forall r . AssignableUsersInput -> SelectionSet
                                                      Scope__UserConnection
                                                      r -> SelectionSet
                                                           Scope__Repository
                                                           r
assignableUsers input = selectionForCompositeField
                        "assignableUsers"
                        (toGraphqlArguments
                         input)
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type BranchProtectionRulesInputRowOptional r = ( after :: Optional String
                                               , before :: Optional String
                                               , first :: Optional Int
                                               , last :: Optional Int
                                               | r
                                               )

type BranchProtectionRulesInput = {
| BranchProtectionRulesInputRowOptional + ()
}

branchProtectionRules :: forall r . BranchProtectionRulesInput -> SelectionSet
                                                                  Scope__BranchProtectionRuleConnection
                                                                  r -> SelectionSet
                                                                       Scope__Repository
                                                                       r
branchProtectionRules input = selectionForCompositeField
                              "branchProtectionRules"
                              (toGraphqlArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

codeOfConduct :: forall r . SelectionSet
                            Scope__CodeOfConduct
                            r -> SelectionSet
                                 Scope__Repository
                                 (Maybe
                                  r)
codeOfConduct = selectionForCompositeField
                "codeOfConduct"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CollaboratorsInputRowOptional r = ( affiliation :: Optional
                                                        CollaboratorAffiliation
                                       , query :: Optional String
                                       , after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type CollaboratorsInput = { | CollaboratorsInputRowOptional + () }

collaborators :: forall r . CollaboratorsInput -> SelectionSet
                                                  Scope__RepositoryCollaboratorConnection
                                                  r -> SelectionSet
                                                       Scope__Repository
                                                       (Maybe
                                                        r)
collaborators input = selectionForCompositeField
                      "collaborators"
                      (toGraphqlArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type CommitCommentsInputRowOptional r = ( after :: Optional String
                                        , before :: Optional String
                                        , first :: Optional Int
                                        , last :: Optional Int
                                        | r
                                        )

type CommitCommentsInput = { | CommitCommentsInputRowOptional + () }

commitComments :: forall r . CommitCommentsInput -> SelectionSet
                                                    Scope__CommitCommentConnection
                                                    r -> SelectionSet
                                                         Scope__Repository
                                                         r
commitComments input = selectionForCompositeField
                       "commitComments"
                       (toGraphqlArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__Repository DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Repository (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

defaultBranchRef :: forall r . SelectionSet
                               Scope__Ref
                               r -> SelectionSet
                                    Scope__Repository
                                    (Maybe
                                     r)
defaultBranchRef = selectionForCompositeField
                   "defaultBranchRef"
                   []
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

deleteBranchOnMerge :: SelectionSet Scope__Repository Boolean
deleteBranchOnMerge = selectionForField
                      "deleteBranchOnMerge"
                      []
                      graphqlDefaultResponseScalarDecoder

type DeployKeysInputRowOptional r = ( after :: Optional String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    | r
                                    )

type DeployKeysInput = { | DeployKeysInputRowOptional + () }

deployKeys :: forall r . DeployKeysInput -> SelectionSet
                                            Scope__DeployKeyConnection
                                            r -> SelectionSet
                                                 Scope__Repository
                                                 r
deployKeys input = selectionForCompositeField
                   "deployKeys"
                   (toGraphqlArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DeploymentsInputRowOptional r = ( environments :: Optional (Array String)
                                     , orderBy :: Optional
                                                  Examples.Github.InputObject.DeploymentOrder
                                     , after :: Optional String
                                     , before :: Optional String
                                     , first :: Optional Int
                                     , last :: Optional Int
                                     | r
                                     )

type DeploymentsInput = { | DeploymentsInputRowOptional + () }

deployments :: forall r . DeploymentsInput -> SelectionSet
                                              Scope__DeploymentConnection
                                              r -> SelectionSet
                                                   Scope__Repository
                                                   r
deployments input = selectionForCompositeField
                    "deployments"
                    (toGraphqlArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

description :: SelectionSet Scope__Repository (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

descriptionHTML :: SelectionSet Scope__Repository Html
descriptionHTML = selectionForField
                  "descriptionHTML"
                  []
                  graphqlDefaultResponseScalarDecoder

diskUsage :: SelectionSet Scope__Repository (Maybe Int)
diskUsage = selectionForField "diskUsage" [] graphqlDefaultResponseScalarDecoder

forkCount :: SelectionSet Scope__Repository Int
forkCount = selectionForField "forkCount" [] graphqlDefaultResponseScalarDecoder

type ForksInputRowOptional r = ( privacy :: Optional RepositoryPrivacy
                               , orderBy :: Optional
                                            Examples.Github.InputObject.RepositoryOrder
                               , affiliations :: Optional
                                                 (Array
                                                  (Maybe
                                                   RepositoryAffiliation))
                               , ownerAffiliations :: Optional
                                                      (Array
                                                       (Maybe
                                                        RepositoryAffiliation))
                               , isLocked :: Optional Boolean
                               , after :: Optional String
                               , before :: Optional String
                               , first :: Optional Int
                               , last :: Optional Int
                               | r
                               )

type ForksInput = { | ForksInputRowOptional + () }

forks :: forall r . ForksInput -> SelectionSet
                                  Scope__RepositoryConnection
                                  r -> SelectionSet
                                       Scope__Repository
                                       r
forks input = selectionForCompositeField
              "forks"
              (toGraphqlArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

fundingLinks :: forall r . SelectionSet
                           Scope__FundingLink
                           r -> SelectionSet
                                Scope__Repository
                                (Array
                                 r)
fundingLinks = selectionForCompositeField
               "fundingLinks"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

hasIssuesEnabled :: SelectionSet Scope__Repository Boolean
hasIssuesEnabled = selectionForField
                   "hasIssuesEnabled"
                   []
                   graphqlDefaultResponseScalarDecoder

hasProjectsEnabled :: SelectionSet Scope__Repository Boolean
hasProjectsEnabled = selectionForField
                     "hasProjectsEnabled"
                     []
                     graphqlDefaultResponseScalarDecoder

hasWikiEnabled :: SelectionSet Scope__Repository Boolean
hasWikiEnabled = selectionForField
                 "hasWikiEnabled"
                 []
                 graphqlDefaultResponseScalarDecoder

homepageUrl :: SelectionSet Scope__Repository (Maybe Uri)
homepageUrl = selectionForField
              "homepageUrl"
              []
              graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Repository Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isArchived :: SelectionSet Scope__Repository Boolean
isArchived = selectionForField
             "isArchived"
             []
             graphqlDefaultResponseScalarDecoder

isDisabled :: SelectionSet Scope__Repository Boolean
isDisabled = selectionForField
             "isDisabled"
             []
             graphqlDefaultResponseScalarDecoder

isEmpty :: SelectionSet Scope__Repository Boolean
isEmpty = selectionForField "isEmpty" [] graphqlDefaultResponseScalarDecoder

isFork :: SelectionSet Scope__Repository Boolean
isFork = selectionForField "isFork" [] graphqlDefaultResponseScalarDecoder

isLocked :: SelectionSet Scope__Repository Boolean
isLocked = selectionForField "isLocked" [] graphqlDefaultResponseScalarDecoder

isMirror :: SelectionSet Scope__Repository Boolean
isMirror = selectionForField "isMirror" [] graphqlDefaultResponseScalarDecoder

isPrivate :: SelectionSet Scope__Repository Boolean
isPrivate = selectionForField "isPrivate" [] graphqlDefaultResponseScalarDecoder

isTemplate :: SelectionSet Scope__Repository Boolean
isTemplate = selectionForField
             "isTemplate"
             []
             graphqlDefaultResponseScalarDecoder

type IssueInputRowRequired r = ( number :: Int | r )

type IssueInput = { | IssueInputRowRequired + () }

issue :: forall r . IssueInput -> SelectionSet
                                  Scope__Issue
                                  r -> SelectionSet
                                       Scope__Repository
                                       (Maybe
                                        r)
issue input = selectionForCompositeField
              "issue"
              (toGraphqlArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type IssueOrPullRequestInputRowRequired r = ( number :: Int | r )

type IssueOrPullRequestInput = { | IssueOrPullRequestInputRowRequired + () }

issueOrPullRequest :: forall r . IssueOrPullRequestInput -> SelectionSet
                                                            Scope__IssueOrPullRequest
                                                            r -> SelectionSet
                                                                 Scope__Repository
                                                                 (Maybe
                                                                  r)
issueOrPullRequest input = selectionForCompositeField
                           "issueOrPullRequest"
                           (toGraphqlArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type IssuesInputRowOptional r = ( orderBy :: Optional
                                             Examples.Github.InputObject.IssueOrder
                                , labels :: Optional (Array String)
                                , states :: Optional (Array IssueState)
                                , filterBy :: Optional
                                              Examples.Github.InputObject.IssueFilters
                                , after :: Optional String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                | r
                                )

type IssuesInput = { | IssuesInputRowOptional + () }

issues :: forall r . IssuesInput -> SelectionSet
                                    Scope__IssueConnection
                                    r -> SelectionSet
                                         Scope__Repository
                                         r
issues input = selectionForCompositeField
               "issues"
               (toGraphqlArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LabelInputRowRequired r = ( name :: String | r )

type LabelInput = { | LabelInputRowRequired + () }

label :: forall r . LabelInput -> SelectionSet
                                  Scope__Label
                                  r -> SelectionSet
                                       Scope__Repository
                                       (Maybe
                                        r)
label input = selectionForCompositeField
              "label"
              (toGraphqlArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LabelsInputRowOptional r = ( orderBy :: Optional
                                             Examples.Github.InputObject.LabelOrder
                                , after :: Optional String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                , query :: Optional String
                                | r
                                )

type LabelsInput = { | LabelsInputRowOptional + () }

labels :: forall r . LabelsInput -> SelectionSet
                                    Scope__LabelConnection
                                    r -> SelectionSet
                                         Scope__Repository
                                         (Maybe
                                          r)
labels input = selectionForCompositeField
               "labels"
               (toGraphqlArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LanguagesInputRowOptional r = ( after :: Optional String
                                   , before :: Optional String
                                   , first :: Optional Int
                                   , last :: Optional Int
                                   , orderBy :: Optional
                                                Examples.Github.InputObject.LanguageOrder
                                   | r
                                   )

type LanguagesInput = { | LanguagesInputRowOptional + () }

languages :: forall r . LanguagesInput -> SelectionSet
                                          Scope__LanguageConnection
                                          r -> SelectionSet
                                               Scope__Repository
                                               (Maybe
                                                r)
languages input = selectionForCompositeField
                  "languages"
                  (toGraphqlArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

licenseInfo :: forall r . SelectionSet
                          Scope__License
                          r -> SelectionSet
                               Scope__Repository
                               (Maybe
                                r)
licenseInfo = selectionForCompositeField
              "licenseInfo"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

lockReason :: SelectionSet Scope__Repository (Maybe RepositoryLockReason)
lockReason = selectionForField
             "lockReason"
             []
             graphqlDefaultResponseScalarDecoder

type MentionableUsersInputRowOptional r = ( query :: Optional String
                                          , after :: Optional String
                                          , before :: Optional String
                                          , first :: Optional Int
                                          , last :: Optional Int
                                          | r
                                          )

type MentionableUsersInput = { | MentionableUsersInputRowOptional + () }

mentionableUsers :: forall r . MentionableUsersInput -> SelectionSet
                                                        Scope__UserConnection
                                                        r -> SelectionSet
                                                             Scope__Repository
                                                             r
mentionableUsers input = selectionForCompositeField
                         "mentionableUsers"
                         (toGraphqlArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mergeCommitAllowed :: SelectionSet Scope__Repository Boolean
mergeCommitAllowed = selectionForField
                     "mergeCommitAllowed"
                     []
                     graphqlDefaultResponseScalarDecoder

type MilestoneInputRowRequired r = ( number :: Int | r )

type MilestoneInput = { | MilestoneInputRowRequired + () }

milestone :: forall r . MilestoneInput -> SelectionSet
                                          Scope__Milestone
                                          r -> SelectionSet
                                               Scope__Repository
                                               (Maybe
                                                r)
milestone input = selectionForCompositeField
                  "milestone"
                  (toGraphqlArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MilestonesInputRowOptional r = ( after :: Optional String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    , states :: Optional (Array MilestoneState)
                                    , orderBy :: Optional
                                                 Examples.Github.InputObject.MilestoneOrder
                                    , query :: Optional String
                                    | r
                                    )

type MilestonesInput = { | MilestonesInputRowOptional + () }

milestones :: forall r . MilestonesInput -> SelectionSet
                                            Scope__MilestoneConnection
                                            r -> SelectionSet
                                                 Scope__Repository
                                                 (Maybe
                                                  r)
milestones input = selectionForCompositeField
                   "milestones"
                   (toGraphqlArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mirrorUrl :: SelectionSet Scope__Repository (Maybe Uri)
mirrorUrl = selectionForField "mirrorUrl" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Repository String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

nameWithOwner :: SelectionSet Scope__Repository String
nameWithOwner = selectionForField
                "nameWithOwner"
                []
                graphqlDefaultResponseScalarDecoder

type ObjectInputRowOptional r = ( oid :: Optional GitObjectId
                                , expression :: Optional String
                                | r
                                )

type ObjectInput = { | ObjectInputRowOptional + () }

object :: forall r . ObjectInput -> SelectionSet
                                    Scope__GitObject
                                    r -> SelectionSet
                                         Scope__Repository
                                         (Maybe
                                          r)
object input = selectionForCompositeField
               "object"
               (toGraphqlArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

openGraphImageUrl :: SelectionSet Scope__Repository Uri
openGraphImageUrl = selectionForField
                    "openGraphImageUrl"
                    []
                    graphqlDefaultResponseScalarDecoder

owner :: forall r . SelectionSet
                    Scope__RepositoryOwner
                    r -> SelectionSet
                         Scope__Repository
                         r
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PackagesInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  , names :: Optional (Array (Maybe String))
                                  , repositoryId :: Optional Id
                                  , packageType :: Optional PackageType
                                  , orderBy :: Optional
                                               Examples.Github.InputObject.PackageOrder
                                  | r
                                  )

type PackagesInput = { | PackagesInputRowOptional + () }

packages :: forall r . PackagesInput -> SelectionSet
                                        Scope__PackageConnection
                                        r -> SelectionSet
                                             Scope__Repository
                                             r
packages input = selectionForCompositeField
                 "packages"
                 (toGraphqlArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

parent :: forall r . SelectionSet
                     Scope__Repository
                     r -> SelectionSet
                          Scope__Repository
                          (Maybe
                           r)
parent = selectionForCompositeField
         "parent"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

primaryLanguage :: forall r . SelectionSet
                              Scope__Language
                              r -> SelectionSet
                                   Scope__Repository
                                   (Maybe
                                    r)
primaryLanguage = selectionForCompositeField
                  "primaryLanguage"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectInputRowRequired r = ( number :: Int | r )

type ProjectInput = { | ProjectInputRowRequired + () }

project :: forall r . ProjectInput -> SelectionSet
                                      Scope__Project
                                      r -> SelectionSet
                                           Scope__Repository
                                           (Maybe
                                            r)
project input = selectionForCompositeField
                "project"
                (toGraphqlArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectsInputRowOptional r = ( orderBy :: Optional
                                               Examples.Github.InputObject.ProjectOrder
                                  , search :: Optional String
                                  , states :: Optional (Array ProjectState)
                                  , after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type ProjectsInput = { | ProjectsInputRowOptional + () }

projects :: forall r . ProjectsInput -> SelectionSet
                                        Scope__ProjectConnection
                                        r -> SelectionSet
                                             Scope__Repository
                                             r
projects input = selectionForCompositeField
                 "projects"
                 (toGraphqlArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

projectsResourcePath :: SelectionSet Scope__Repository Uri
projectsResourcePath = selectionForField
                       "projectsResourcePath"
                       []
                       graphqlDefaultResponseScalarDecoder

projectsUrl :: SelectionSet Scope__Repository Uri
projectsUrl = selectionForField
              "projectsUrl"
              []
              graphqlDefaultResponseScalarDecoder

type PullRequestInputRowRequired r = ( number :: Int | r )

type PullRequestInput = { | PullRequestInputRowRequired + () }

pullRequest :: forall r . PullRequestInput -> SelectionSet
                                              Scope__PullRequest
                                              r -> SelectionSet
                                                   Scope__Repository
                                                   (Maybe
                                                    r)
pullRequest input = selectionForCompositeField
                    "pullRequest"
                    (toGraphqlArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestsInputRowOptional r = ( states :: Optional
                                                  (Array
                                                   PullRequestState)
                                      , labels :: Optional (Array String)
                                      , headRefName :: Optional String
                                      , baseRefName :: Optional String
                                      , orderBy :: Optional
                                                   Examples.Github.InputObject.IssueOrder
                                      , after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type PullRequestsInput = { | PullRequestsInputRowOptional + () }

pullRequests :: forall r . PullRequestsInput -> SelectionSet
                                                Scope__PullRequestConnection
                                                r -> SelectionSet
                                                     Scope__Repository
                                                     r
pullRequests input = selectionForCompositeField
                     "pullRequests"
                     (toGraphqlArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pushedAt :: SelectionSet Scope__Repository (Maybe DateTime)
pushedAt = selectionForField "pushedAt" [] graphqlDefaultResponseScalarDecoder

rebaseMergeAllowed :: SelectionSet Scope__Repository Boolean
rebaseMergeAllowed = selectionForField
                     "rebaseMergeAllowed"
                     []
                     graphqlDefaultResponseScalarDecoder

type RefInputRowRequired r = ( qualifiedName :: String | r )

type RefInput = { | RefInputRowRequired + () }

ref :: forall r . RefInput -> SelectionSet
                              Scope__Ref
                              r -> SelectionSet
                                   Scope__Repository
                                   (Maybe
                                    r)
ref input = selectionForCompositeField
            "ref"
            (toGraphqlArguments
             input)
            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RefsInputRowOptional r = ( query :: Optional String
                              , after :: Optional String
                              , before :: Optional String
                              , first :: Optional Int
                              , last :: Optional Int
                              , direction :: Optional OrderDirection
                              , orderBy :: Optional
                                           Examples.Github.InputObject.RefOrder
                              | r
                              )

type RefsInputRowRequired r = ( refPrefix :: String | r )

type RefsInput = { | RefsInputRowOptional + RefsInputRowRequired + () }

refs :: forall r . RefsInput -> SelectionSet
                                Scope__RefConnection
                                r -> SelectionSet
                                     Scope__Repository
                                     (Maybe
                                      r)
refs input = selectionForCompositeField
             "refs"
             (toGraphqlArguments
              input)
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReleaseInputRowRequired r = ( tagName :: String | r )

type ReleaseInput = { | ReleaseInputRowRequired + () }

release :: forall r . ReleaseInput -> SelectionSet
                                      Scope__Release
                                      r -> SelectionSet
                                           Scope__Repository
                                           (Maybe
                                            r)
release input = selectionForCompositeField
                "release"
                (toGraphqlArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ReleasesInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  , orderBy :: Optional
                                               Examples.Github.InputObject.ReleaseOrder
                                  | r
                                  )

type ReleasesInput = { | ReleasesInputRowOptional + () }

releases :: forall r . ReleasesInput -> SelectionSet
                                        Scope__ReleaseConnection
                                        r -> SelectionSet
                                             Scope__Repository
                                             r
releases input = selectionForCompositeField
                 "releases"
                 (toGraphqlArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryTopicsInputRowOptional r = ( after :: Optional String
                                          , before :: Optional String
                                          , first :: Optional Int
                                          , last :: Optional Int
                                          | r
                                          )

type RepositoryTopicsInput = { | RepositoryTopicsInputRowOptional + () }

repositoryTopics :: forall r . RepositoryTopicsInput -> SelectionSet
                                                        Scope__RepositoryTopicConnection
                                                        r -> SelectionSet
                                                             Scope__Repository
                                                             r
repositoryTopics input = selectionForCompositeField
                         "repositoryTopics"
                         (toGraphqlArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Repository Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

type ShortDescriptionHtmlInputRowOptional r = ( limit :: Optional Int | r )

type ShortDescriptionHtmlInput = { | ShortDescriptionHtmlInputRowOptional + () }

shortDescriptionHTML :: ShortDescriptionHtmlInput -> SelectionSet
                                                     Scope__Repository
                                                     Html
shortDescriptionHTML input = selectionForField
                             "shortDescriptionHTML"
                             (toGraphqlArguments
                              input)
                             graphqlDefaultResponseScalarDecoder

squashMergeAllowed :: SelectionSet Scope__Repository Boolean
squashMergeAllowed = selectionForField
                     "squashMergeAllowed"
                     []
                     graphqlDefaultResponseScalarDecoder

sshUrl :: SelectionSet Scope__Repository GitSshRemote
sshUrl = selectionForField "sshUrl" [] graphqlDefaultResponseScalarDecoder

type StargazersInputRowOptional r = ( after :: Optional String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    , orderBy :: Optional
                                                 Examples.Github.InputObject.StarOrder
                                    | r
                                    )

type StargazersInput = { | StargazersInputRowOptional + () }

stargazers :: forall r . StargazersInput -> SelectionSet
                                            Scope__StargazerConnection
                                            r -> SelectionSet
                                                 Scope__Repository
                                                 r
stargazers input = selectionForCompositeField
                   "stargazers"
                   (toGraphqlArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SubmodulesInputRowOptional r = ( after :: Optional String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    | r
                                    )

type SubmodulesInput = { | SubmodulesInputRowOptional + () }

submodules :: forall r . SubmodulesInput -> SelectionSet
                                            Scope__SubmoduleConnection
                                            r -> SelectionSet
                                                 Scope__Repository
                                                 r
submodules input = selectionForCompositeField
                   "submodules"
                   (toGraphqlArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

tempCloneToken :: SelectionSet Scope__Repository (Maybe String)
tempCloneToken = selectionForField
                 "tempCloneToken"
                 []
                 graphqlDefaultResponseScalarDecoder

templateRepository :: forall r . SelectionSet
                                 Scope__Repository
                                 r -> SelectionSet
                                      Scope__Repository
                                      (Maybe
                                       r)
templateRepository = selectionForCompositeField
                     "templateRepository"
                     []
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

updatedAt :: SelectionSet Scope__Repository DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Repository Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

usesCustomOpenGraphImage :: SelectionSet Scope__Repository Boolean
usesCustomOpenGraphImage = selectionForField
                           "usesCustomOpenGraphImage"
                           []
                           graphqlDefaultResponseScalarDecoder

viewerCanAdminister :: SelectionSet Scope__Repository Boolean
viewerCanAdminister = selectionForField
                      "viewerCanAdminister"
                      []
                      graphqlDefaultResponseScalarDecoder

viewerCanCreateProjects :: SelectionSet Scope__Repository Boolean
viewerCanCreateProjects = selectionForField
                          "viewerCanCreateProjects"
                          []
                          graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__Repository Boolean
viewerCanSubscribe = selectionForField
                     "viewerCanSubscribe"
                     []
                     graphqlDefaultResponseScalarDecoder

viewerCanUpdateTopics :: SelectionSet Scope__Repository Boolean
viewerCanUpdateTopics = selectionForField
                        "viewerCanUpdateTopics"
                        []
                        graphqlDefaultResponseScalarDecoder

viewerDefaultCommitEmail :: SelectionSet Scope__Repository (Maybe String)
viewerDefaultCommitEmail = selectionForField
                           "viewerDefaultCommitEmail"
                           []
                           graphqlDefaultResponseScalarDecoder

viewerDefaultMergeMethod :: SelectionSet
                            Scope__Repository
                            PullRequestMergeMethod
viewerDefaultMergeMethod = selectionForField
                           "viewerDefaultMergeMethod"
                           []
                           graphqlDefaultResponseScalarDecoder

viewerHasStarred :: SelectionSet Scope__Repository Boolean
viewerHasStarred = selectionForField
                   "viewerHasStarred"
                   []
                   graphqlDefaultResponseScalarDecoder

viewerPermission :: SelectionSet Scope__Repository (Maybe RepositoryPermission)
viewerPermission = selectionForField
                   "viewerPermission"
                   []
                   graphqlDefaultResponseScalarDecoder

viewerPossibleCommitEmails :: SelectionSet
                              Scope__Repository
                              (Maybe
                               (Array
                                String))
viewerPossibleCommitEmails = selectionForField
                             "viewerPossibleCommitEmails"
                             []
                             graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__Repository (Maybe SubscriptionState)
viewerSubscription = selectionForField
                     "viewerSubscription"
                     []
                     graphqlDefaultResponseScalarDecoder

type VulnerabilityAlertsInputRowOptional r = ( after :: Optional String
                                             , before :: Optional String
                                             , first :: Optional Int
                                             , last :: Optional Int
                                             | r
                                             )

type VulnerabilityAlertsInput = { | VulnerabilityAlertsInputRowOptional + () }

vulnerabilityAlerts :: forall r . VulnerabilityAlertsInput -> SelectionSet
                                                              Scope__RepositoryVulnerabilityAlertConnection
                                                              r -> SelectionSet
                                                                   Scope__Repository
                                                                   (Maybe
                                                                    r)
vulnerabilityAlerts input = selectionForCompositeField
                            "vulnerabilityAlerts"
                            (toGraphqlArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type WatchersInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type WatchersInput = { | WatchersInputRowOptional + () }

watchers :: forall r . WatchersInput -> SelectionSet
                                        Scope__UserConnection
                                        r -> SelectionSet
                                             Scope__Repository
                                             r
watchers input = selectionForCompositeField
                 "watchers"
                 (toGraphqlArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer
