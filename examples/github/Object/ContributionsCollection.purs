module Examples.Github.Object.ContributionsCollection where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Type.Row
  ( type (+)
  )
import Examples.Github.Scopes
  ( Scope__CommitContributionsByRepository
  , Scope__ContributionsCollection
  , Scope__ContributionCalendar
  , Scope__CreatedIssueOrRestrictedContribution
  , Scope__CreatedPullRequestOrRestrictedContribution
  , Scope__CreatedRepositoryOrRestrictedContribution
  , Scope__CreatedIssueContributionConnection
  , Scope__IssueContributionsByRepository
  , Scope__JoinedGitHubContribution
  , Scope__CreatedIssueContribution
  , Scope__CreatedPullRequestContribution
  , Scope__CreatedPullRequestContributionConnection
  , Scope__PullRequestContributionsByRepository
  , Scope__CreatedPullRequestReviewContributionConnection
  , Scope__PullRequestReviewContributionsByRepository
  , Scope__CreatedRepositoryContributionConnection
  , Scope__User
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( Date
  , DateTime
  )
import Examples.Github.InputObject
  ( ContributionOrder
  ) as Examples.Github.InputObject

type CommitContributionsByRepositoryInputRowOptional r = ( maxRepositories :: Optional Int
                                                         | r
                                                         )

type CommitContributionsByRepositoryInput = { | CommitContributionsByRepositoryInputRowOptional + () }

commitContributionsByRepository :: forall r . CommitContributionsByRepositoryInput -> SelectionSet Scope__CommitContributionsByRepository r -> SelectionSet Scope__ContributionsCollection (Array r)
commitContributionsByRepository input = selectionForCompositeField "commitContributionsByRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

contributionCalendar :: forall r . SelectionSet Scope__ContributionCalendar r -> SelectionSet Scope__ContributionsCollection r
contributionCalendar = selectionForCompositeField "contributionCalendar" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

contributionYears :: SelectionSet Scope__ContributionsCollection (Array Int)
contributionYears = selectionForField "contributionYears" [] graphqlDefaultResponseScalarDecoder

doesEndInCurrentMonth :: SelectionSet Scope__ContributionsCollection Boolean
doesEndInCurrentMonth = selectionForField "doesEndInCurrentMonth" [] graphqlDefaultResponseScalarDecoder

earliestRestrictedContributionDate :: SelectionSet Scope__ContributionsCollection (Maybe Date)
earliestRestrictedContributionDate = selectionForField "earliestRestrictedContributionDate" [] graphqlDefaultResponseScalarDecoder

endedAt :: SelectionSet Scope__ContributionsCollection DateTime
endedAt = selectionForField "endedAt" [] graphqlDefaultResponseScalarDecoder

firstIssueContribution :: forall r . SelectionSet Scope__CreatedIssueOrRestrictedContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
firstIssueContribution = selectionForCompositeField "firstIssueContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

firstPullRequestContribution :: forall r . SelectionSet Scope__CreatedPullRequestOrRestrictedContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
firstPullRequestContribution = selectionForCompositeField "firstPullRequestContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

firstRepositoryContribution :: forall r . SelectionSet Scope__CreatedRepositoryOrRestrictedContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
firstRepositoryContribution = selectionForCompositeField "firstRepositoryContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

hasActivityInThePast :: SelectionSet Scope__ContributionsCollection Boolean
hasActivityInThePast = selectionForField "hasActivityInThePast" [] graphqlDefaultResponseScalarDecoder

hasAnyContributions :: SelectionSet Scope__ContributionsCollection Boolean
hasAnyContributions = selectionForField "hasAnyContributions" [] graphqlDefaultResponseScalarDecoder

hasAnyRestrictedContributions :: SelectionSet Scope__ContributionsCollection Boolean
hasAnyRestrictedContributions = selectionForField "hasAnyRestrictedContributions" [] graphqlDefaultResponseScalarDecoder

isSingleDay :: SelectionSet Scope__ContributionsCollection Boolean
isSingleDay = selectionForField "isSingleDay" [] graphqlDefaultResponseScalarDecoder

type IssueContributionsInputRowOptional r = ( after :: Optional String
                                            , before :: Optional String
                                            , first :: Optional Int
                                            , last :: Optional Int
                                            , excludeFirst :: Optional Boolean
                                            , excludePopular :: Optional Boolean
                                            , orderBy :: Optional Examples.Github.InputObject.ContributionOrder
                                            | r
                                            )

type IssueContributionsInput = { | IssueContributionsInputRowOptional + () }

issueContributions :: forall r . IssueContributionsInput -> SelectionSet Scope__CreatedIssueContributionConnection r -> SelectionSet Scope__ContributionsCollection r
issueContributions input = selectionForCompositeField "issueContributions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type IssueContributionsByRepositoryInputRowOptional r = ( maxRepositories :: Optional Int
                                                        , excludeFirst :: Optional Boolean
                                                        , excludePopular :: Optional Boolean
                                                        | r
                                                        )

type IssueContributionsByRepositoryInput = { | IssueContributionsByRepositoryInputRowOptional + () }

issueContributionsByRepository :: forall r . IssueContributionsByRepositoryInput -> SelectionSet Scope__IssueContributionsByRepository r -> SelectionSet Scope__ContributionsCollection (Array r)
issueContributionsByRepository input = selectionForCompositeField "issueContributionsByRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

joinedGitHubContribution :: forall r . SelectionSet Scope__JoinedGitHubContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
joinedGitHubContribution = selectionForCompositeField "joinedGitHubContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

latestRestrictedContributionDate :: SelectionSet Scope__ContributionsCollection (Maybe Date)
latestRestrictedContributionDate = selectionForField "latestRestrictedContributionDate" [] graphqlDefaultResponseScalarDecoder

mostRecentCollectionWithActivity :: forall r . SelectionSet Scope__ContributionsCollection r -> SelectionSet Scope__ContributionsCollection (Maybe r)
mostRecentCollectionWithActivity = selectionForCompositeField "mostRecentCollectionWithActivity" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mostRecentCollectionWithoutActivity :: forall r . SelectionSet Scope__ContributionsCollection r -> SelectionSet Scope__ContributionsCollection (Maybe r)
mostRecentCollectionWithoutActivity = selectionForCompositeField "mostRecentCollectionWithoutActivity" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

popularIssueContribution :: forall r . SelectionSet Scope__CreatedIssueContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
popularIssueContribution = selectionForCompositeField "popularIssueContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

popularPullRequestContribution :: forall r . SelectionSet Scope__CreatedPullRequestContribution r -> SelectionSet Scope__ContributionsCollection (Maybe r)
popularPullRequestContribution = selectionForCompositeField "popularPullRequestContribution" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestContributionsInputRowOptional r = ( after :: Optional String
                                                  , before :: Optional String
                                                  , first :: Optional Int
                                                  , last :: Optional Int
                                                  , excludeFirst :: Optional Boolean
                                                  , excludePopular :: Optional Boolean
                                                  , orderBy :: Optional Examples.Github.InputObject.ContributionOrder
                                                  | r
                                                  )

type PullRequestContributionsInput = { | PullRequestContributionsInputRowOptional + () }

pullRequestContributions :: forall r . PullRequestContributionsInput -> SelectionSet Scope__CreatedPullRequestContributionConnection r -> SelectionSet Scope__ContributionsCollection r
pullRequestContributions input = selectionForCompositeField "pullRequestContributions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestContributionsByRepositoryInputRowOptional r = ( maxRepositories :: Optional Int
                                                              , excludeFirst :: Optional Boolean
                                                              , excludePopular :: Optional Boolean
                                                              | r
                                                              )

type PullRequestContributionsByRepositoryInput = { | PullRequestContributionsByRepositoryInputRowOptional + () }

pullRequestContributionsByRepository :: forall r . PullRequestContributionsByRepositoryInput -> SelectionSet Scope__PullRequestContributionsByRepository r -> SelectionSet Scope__ContributionsCollection (Array r)
pullRequestContributionsByRepository input = selectionForCompositeField "pullRequestContributionsByRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestReviewContributionsInputRowOptional r = ( after :: Optional String
                                                        , before :: Optional String
                                                        , first :: Optional Int
                                                        , last :: Optional Int
                                                        , orderBy :: Optional Examples.Github.InputObject.ContributionOrder
                                                        | r
                                                        )

type PullRequestReviewContributionsInput = { | PullRequestReviewContributionsInputRowOptional + () }

pullRequestReviewContributions :: forall r . PullRequestReviewContributionsInput -> SelectionSet Scope__CreatedPullRequestReviewContributionConnection r -> SelectionSet Scope__ContributionsCollection r
pullRequestReviewContributions input = selectionForCompositeField "pullRequestReviewContributions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestReviewContributionsByRepositoryInputRowOptional r = ( maxRepositories :: Optional Int
                                                                    | r
                                                                    )

type PullRequestReviewContributionsByRepositoryInput = { | PullRequestReviewContributionsByRepositoryInputRowOptional + () }

pullRequestReviewContributionsByRepository :: forall r . PullRequestReviewContributionsByRepositoryInput -> SelectionSet Scope__PullRequestReviewContributionsByRepository r -> SelectionSet Scope__ContributionsCollection (Array r)
pullRequestReviewContributionsByRepository input = selectionForCompositeField "pullRequestReviewContributionsByRepository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryContributionsInputRowOptional r = ( after :: Optional String
                                                 , before :: Optional String
                                                 , first :: Optional Int
                                                 , last :: Optional Int
                                                 , excludeFirst :: Optional Boolean
                                                 , orderBy :: Optional Examples.Github.InputObject.ContributionOrder
                                                 | r
                                                 )

type RepositoryContributionsInput = { | RepositoryContributionsInputRowOptional + () }

repositoryContributions :: forall r . RepositoryContributionsInput -> SelectionSet Scope__CreatedRepositoryContributionConnection r -> SelectionSet Scope__ContributionsCollection r
repositoryContributions input = selectionForCompositeField "repositoryContributions" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

restrictedContributionsCount :: SelectionSet Scope__ContributionsCollection Int
restrictedContributionsCount = selectionForField "restrictedContributionsCount" [] graphqlDefaultResponseScalarDecoder

startedAt :: SelectionSet Scope__ContributionsCollection DateTime
startedAt = selectionForField "startedAt" [] graphqlDefaultResponseScalarDecoder

totalCommitContributions :: SelectionSet Scope__ContributionsCollection Int
totalCommitContributions = selectionForField "totalCommitContributions" [] graphqlDefaultResponseScalarDecoder

type TotalIssueContributionsInputRowOptional r = ( excludeFirst :: Optional Boolean
                                                 , excludePopular :: Optional Boolean
                                                 | r
                                                 )

type TotalIssueContributionsInput = { | TotalIssueContributionsInputRowOptional + () }

totalIssueContributions :: TotalIssueContributionsInput -> SelectionSet Scope__ContributionsCollection Int
totalIssueContributions input = selectionForField "totalIssueContributions" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

type TotalPullRequestContributionsInputRowOptional r = ( excludeFirst :: Optional Boolean
                                                       , excludePopular :: Optional Boolean
                                                       | r
                                                       )

type TotalPullRequestContributionsInput = { | TotalPullRequestContributionsInputRowOptional + () }

totalPullRequestContributions :: TotalPullRequestContributionsInput -> SelectionSet Scope__ContributionsCollection Int
totalPullRequestContributions input = selectionForField "totalPullRequestContributions" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

totalPullRequestReviewContributions :: SelectionSet Scope__ContributionsCollection Int
totalPullRequestReviewContributions = selectionForField "totalPullRequestReviewContributions" [] graphqlDefaultResponseScalarDecoder

totalRepositoriesWithContributedCommits :: SelectionSet Scope__ContributionsCollection Int
totalRepositoriesWithContributedCommits = selectionForField "totalRepositoriesWithContributedCommits" [] graphqlDefaultResponseScalarDecoder

type TotalRepositoriesWithContributedIssuesInputRowOptional r = ( excludeFirst :: Optional Boolean
                                                                , excludePopular :: Optional Boolean
                                                                | r
                                                                )

type TotalRepositoriesWithContributedIssuesInput = { | TotalRepositoriesWithContributedIssuesInputRowOptional + () }

totalRepositoriesWithContributedIssues :: TotalRepositoriesWithContributedIssuesInput -> SelectionSet Scope__ContributionsCollection Int
totalRepositoriesWithContributedIssues input = selectionForField "totalRepositoriesWithContributedIssues" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

totalRepositoriesWithContributedPullRequestReviews :: SelectionSet Scope__ContributionsCollection Int
totalRepositoriesWithContributedPullRequestReviews = selectionForField "totalRepositoriesWithContributedPullRequestReviews" [] graphqlDefaultResponseScalarDecoder

type TotalRepositoriesWithContributedPullRequestsInputRowOptional r = ( excludeFirst :: Optional Boolean
                                                                      , excludePopular :: Optional Boolean
                                                                      | r
                                                                      )

type TotalRepositoriesWithContributedPullRequestsInput = { | TotalRepositoriesWithContributedPullRequestsInputRowOptional + () }

totalRepositoriesWithContributedPullRequests :: TotalRepositoriesWithContributedPullRequestsInput -> SelectionSet Scope__ContributionsCollection Int
totalRepositoriesWithContributedPullRequests input = selectionForField "totalRepositoriesWithContributedPullRequests" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

type TotalRepositoryContributionsInputRowOptional r = ( excludeFirst :: Optional Boolean
                                                      | r
                                                      )

type TotalRepositoryContributionsInput = { | TotalRepositoryContributionsInputRowOptional + () }

totalRepositoryContributions :: TotalRepositoryContributionsInput -> SelectionSet Scope__ContributionsCollection Int
totalRepositoryContributions input = selectionForField "totalRepositoryContributions" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__ContributionsCollection r
user = selectionForCompositeField "user" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
