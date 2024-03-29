module Examples.Github.Object.User where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphQLArguments
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Enum.PinnableItemType (PinnableItemType)
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__User
  , Scope__CommitCommentConnection
  , Scope__ContributionsCollection
  , Scope__FollowerConnection
  , Scope__FollowingConnection
  , Scope__Gist
  , Scope__GistCommentConnection
  , Scope__GistConnection
  , Scope__Hovercard
  , Scope__RepositoryInteractionAbility
  , Scope__IssueCommentConnection
  , Scope__IssueConnection
  , Scope__ProfileItemShowcase
  , Scope__Organization
  , Scope__OrganizationConnection
  , Scope__PackageConnection
  , Scope__PinnableItemConnection
  , Scope__Project
  , Scope__ProjectNext
  , Scope__ProjectConnection
  , Scope__ProjectNextConnection
  , Scope__PublicKeyConnection
  , Scope__PullRequestConnection
  , Scope__RepositoryConnection
  , Scope__Repository
  , Scope__DiscussionCommentConnection
  , Scope__DiscussionConnection
  , Scope__SavedReplyConnection
  , Scope__SponsorConnection
  , Scope__SponsorsActivityConnection
  , Scope__SponsorsListing
  , Scope__Sponsorship
  , Scope__SponsorshipNewsletterConnection
  , Scope__SponsorshipConnection
  , Scope__StarredRepositoryConnection
  , Scope__UserStatus
  )
import Examples.Github.Scalars (Uri, Html, Id, DateTime)
import Data.Maybe (Maybe)
import Examples.Github.Enum.GistPrivacy (GistPrivacy)
import Examples.Github.InputObject
  ( GistOrder
  , IssueCommentOrder
  , IssueOrder
  , IssueFilters
  , PackageOrder
  , ProjectOrder
  , RepositoryOrder
  , DiscussionOrder
  , SavedReplyOrder
  , SponsorOrder
  , SponsorsActivityOrder
  , SponsorshipNewsletterOrder
  , SponsorshipOrder
  , StarOrder
  ) as Examples.Github.InputObject
import Examples.Github.Enum.IssueState (IssueState)
import Examples.Github.Enum.PackageType (PackageType)
import Examples.Github.Enum.ProjectState (ProjectState)
import Examples.Github.Enum.ProjectNextOrderField (ProjectNextOrderField)
import Examples.Github.Enum.PullRequestState (PullRequestState)
import Examples.Github.Enum.RepositoryPrivacy (RepositoryPrivacy)
import Examples.Github.Enum.RepositoryAffiliation (RepositoryAffiliation)
import Examples.Github.Enum.RepositoryContributionType
  (RepositoryContributionType)
import Examples.Github.Enum.SponsorsActivityPeriod (SponsorsActivityPeriod)

type AnyPinnableItemsInputRowOptional r
  = ( "type" :: Optional PinnableItemType | r )

type AnyPinnableItemsInput = { | AnyPinnableItemsInputRowOptional + () }

anyPinnableItems :: AnyPinnableItemsInput -> SelectionSet Scope__User Boolean
anyPinnableItems input = selectionForField
                         "anyPinnableItems"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseScalarDecoder

type AvatarUrlInputRowOptional r = ( size :: Optional Int | r )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__User Uri
avatarUrl input = selectionForField
                  "avatarUrl"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseScalarDecoder

bio :: SelectionSet Scope__User (Maybe String)
bio = selectionForField "bio" [] graphqlDefaultResponseScalarDecoder

bioHTML :: SelectionSet Scope__User Html
bioHTML = selectionForField "bioHTML" [] graphqlDefaultResponseScalarDecoder

type CanReceiveOrganizationEmailsWhenNotificationsRestrictedInputRowRequired r
  = ( login :: String | r )

type CanReceiveOrganizationEmailsWhenNotificationsRestrictedInput
  = { | CanReceiveOrganizationEmailsWhenNotificationsRestrictedInputRowRequired
      + ()
    }

canReceiveOrganizationEmailsWhenNotificationsRestricted
  :: CanReceiveOrganizationEmailsWhenNotificationsRestrictedInput
  -> SelectionSet Scope__User Boolean
canReceiveOrganizationEmailsWhenNotificationsRestricted input = selectionForField
                                                                "canReceiveOrganizationEmailsWhenNotificationsRestricted"
                                                                (toGraphQLArguments
                                                                 input)
                                                                graphqlDefaultResponseScalarDecoder

type CommitCommentsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type CommitCommentsInput = { | CommitCommentsInputRowOptional + () }

commitComments
  :: forall r
   . CommitCommentsInput
  -> SelectionSet Scope__CommitCommentConnection r
  -> SelectionSet Scope__User r
commitComments input = selectionForCompositeField
                       "commitComments"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

company :: SelectionSet Scope__User (Maybe String)
company = selectionForField "company" [] graphqlDefaultResponseScalarDecoder

companyHTML :: SelectionSet Scope__User Html
companyHTML = selectionForField
              "companyHTML"
              []
              graphqlDefaultResponseScalarDecoder

type ContributionsCollectionInputRowOptional r
  = ( organizationID :: Optional Id
    , from :: Optional DateTime
    , to :: Optional DateTime
    | r
    )

type ContributionsCollectionInput
  = { | ContributionsCollectionInputRowOptional + () }

contributionsCollection
  :: forall r
   . ContributionsCollectionInput
  -> SelectionSet Scope__ContributionsCollection r
  -> SelectionSet Scope__User r
contributionsCollection input = selectionForCompositeField
                                "contributionsCollection"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__User DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__User (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

email :: SelectionSet Scope__User String
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

estimatedNextSponsorsPayoutInCents :: SelectionSet Scope__User Int
estimatedNextSponsorsPayoutInCents = selectionForField
                                     "estimatedNextSponsorsPayoutInCents"
                                     []
                                     graphqlDefaultResponseScalarDecoder

type FollowersInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type FollowersInput = { | FollowersInputRowOptional + () }

followers
  :: forall r
   . FollowersInput
  -> SelectionSet Scope__FollowerConnection r
  -> SelectionSet Scope__User r
followers input = selectionForCompositeField
                  "followers"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type FollowingInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type FollowingInput = { | FollowingInputRowOptional + () }

following
  :: forall r
   . FollowingInput
  -> SelectionSet Scope__FollowingConnection r
  -> SelectionSet Scope__User r
following input = selectionForCompositeField
                  "following"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GistInputRowRequired r = ( name :: String | r )

type GistInput = { | GistInputRowRequired + () }

gist
  :: forall r
   . GistInput
  -> SelectionSet Scope__Gist r
  -> SelectionSet Scope__User (Maybe r)
gist input = selectionForCompositeField
             "gist"
             (toGraphQLArguments
              input)
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GistCommentsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type GistCommentsInput = { | GistCommentsInputRowOptional + () }

gistComments
  :: forall r
   . GistCommentsInput
  -> SelectionSet Scope__GistCommentConnection r
  -> SelectionSet Scope__User r
gistComments input = selectionForCompositeField
                     "gistComments"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GistsInputRowOptional r
  = ( privacy :: Optional GistPrivacy
    , orderBy :: Optional Examples.Github.InputObject.GistOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type GistsInput = { | GistsInputRowOptional + () }

gists
  :: forall r
   . GistsInput
  -> SelectionSet Scope__GistConnection r
  -> SelectionSet Scope__User r
gists input = selectionForCompositeField
              "gists"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

hasSponsorsListing :: SelectionSet Scope__User Boolean
hasSponsorsListing = selectionForField
                     "hasSponsorsListing"
                     []
                     graphqlDefaultResponseScalarDecoder

type HovercardInputRowOptional r = ( primarySubjectId :: Optional Id | r )

type HovercardInput = { | HovercardInputRowOptional + () }

hovercard
  :: forall r
   . HovercardInput
  -> SelectionSet Scope__Hovercard r
  -> SelectionSet Scope__User r
hovercard input = selectionForCompositeField
                  "hovercard"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__User Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

interactionAbility
  :: forall r
   . SelectionSet Scope__RepositoryInteractionAbility r
  -> SelectionSet Scope__User (Maybe r)
interactionAbility = selectionForCompositeField
                     "interactionAbility"
                     []
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

isBountyHunter :: SelectionSet Scope__User Boolean
isBountyHunter = selectionForField
                 "isBountyHunter"
                 []
                 graphqlDefaultResponseScalarDecoder

isCampusExpert :: SelectionSet Scope__User Boolean
isCampusExpert = selectionForField
                 "isCampusExpert"
                 []
                 graphqlDefaultResponseScalarDecoder

isDeveloperProgramMember :: SelectionSet Scope__User Boolean
isDeveloperProgramMember = selectionForField
                           "isDeveloperProgramMember"
                           []
                           graphqlDefaultResponseScalarDecoder

isEmployee :: SelectionSet Scope__User Boolean
isEmployee = selectionForField
             "isEmployee"
             []
             graphqlDefaultResponseScalarDecoder

isFollowingViewer :: SelectionSet Scope__User Boolean
isFollowingViewer = selectionForField
                    "isFollowingViewer"
                    []
                    graphqlDefaultResponseScalarDecoder

isGitHubStar :: SelectionSet Scope__User Boolean
isGitHubStar = selectionForField
               "isGitHubStar"
               []
               graphqlDefaultResponseScalarDecoder

isHireable :: SelectionSet Scope__User Boolean
isHireable = selectionForField
             "isHireable"
             []
             graphqlDefaultResponseScalarDecoder

isSiteAdmin :: SelectionSet Scope__User Boolean
isSiteAdmin = selectionForField
              "isSiteAdmin"
              []
              graphqlDefaultResponseScalarDecoder

type IsSponsoredByInputRowRequired r = ( accountLogin :: String | r )

type IsSponsoredByInput = { | IsSponsoredByInputRowRequired + () }

isSponsoredBy :: IsSponsoredByInput -> SelectionSet Scope__User Boolean
isSponsoredBy input = selectionForField
                      "isSponsoredBy"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseScalarDecoder

isSponsoringViewer :: SelectionSet Scope__User Boolean
isSponsoringViewer = selectionForField
                     "isSponsoringViewer"
                     []
                     graphqlDefaultResponseScalarDecoder

isViewer :: SelectionSet Scope__User Boolean
isViewer = selectionForField "isViewer" [] graphqlDefaultResponseScalarDecoder

type IssueCommentsInputRowOptional r
  = ( orderBy :: Optional Examples.Github.InputObject.IssueCommentOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type IssueCommentsInput = { | IssueCommentsInputRowOptional + () }

issueComments
  :: forall r
   . IssueCommentsInput
  -> SelectionSet Scope__IssueCommentConnection r
  -> SelectionSet Scope__User r
issueComments input = selectionForCompositeField
                      "issueComments"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type IssuesInputRowOptional r
  = ( orderBy :: Optional Examples.Github.InputObject.IssueOrder
    , labels :: Optional (Array String)
    , states :: Optional (Array IssueState)
    , filterBy :: Optional Examples.Github.InputObject.IssueFilters
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type IssuesInput = { | IssuesInputRowOptional + () }

issues
  :: forall r
   . IssuesInput
  -> SelectionSet Scope__IssueConnection r
  -> SelectionSet Scope__User r
issues input = selectionForCompositeField
               "issues"
               (toGraphQLArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

itemShowcase
  :: forall r
   . SelectionSet Scope__ProfileItemShowcase r
  -> SelectionSet Scope__User r
itemShowcase = selectionForCompositeField
               "itemShowcase"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

location :: SelectionSet Scope__User (Maybe String)
location = selectionForField "location" [] graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__User String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

monthlyEstimatedSponsorsIncomeInCents :: SelectionSet Scope__User Int
monthlyEstimatedSponsorsIncomeInCents = selectionForField
                                        "monthlyEstimatedSponsorsIncomeInCents"
                                        []
                                        graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__User (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type OrganizationInputRowRequired r = ( login :: String | r )

type OrganizationInput = { | OrganizationInputRowRequired + () }

organization
  :: forall r
   . OrganizationInput
  -> SelectionSet Scope__Organization r
  -> SelectionSet Scope__User (Maybe r)
organization input = selectionForCompositeField
                     "organization"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type OrganizationVerifiedDomainEmailsInputRowRequired r
  = ( login :: String | r )

type OrganizationVerifiedDomainEmailsInput
  = { | OrganizationVerifiedDomainEmailsInputRowRequired + () }

organizationVerifiedDomainEmails
  :: OrganizationVerifiedDomainEmailsInput
  -> SelectionSet Scope__User (Array String)
organizationVerifiedDomainEmails input = selectionForField
                                         "organizationVerifiedDomainEmails"
                                         (toGraphQLArguments
                                          input)
                                         graphqlDefaultResponseScalarDecoder

type OrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type OrganizationsInput = { | OrganizationsInputRowOptional + () }

organizations
  :: forall r
   . OrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__User r
organizations input = selectionForCompositeField
                      "organizations"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PackagesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , names :: Optional (Array (Maybe String))
    , repositoryId :: Optional Id
    , packageType :: Optional PackageType
    , orderBy :: Optional Examples.Github.InputObject.PackageOrder
    | r
    )

type PackagesInput = { | PackagesInputRowOptional + () }

packages
  :: forall r
   . PackagesInput
  -> SelectionSet Scope__PackageConnection r
  -> SelectionSet Scope__User r
packages input = selectionForCompositeField
                 "packages"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinnableItemsInputRowOptional r
  = ( types :: Optional (Array PinnableItemType)
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type PinnableItemsInput = { | PinnableItemsInputRowOptional + () }

pinnableItems
  :: forall r
   . PinnableItemsInput
  -> SelectionSet Scope__PinnableItemConnection r
  -> SelectionSet Scope__User r
pinnableItems input = selectionForCompositeField
                      "pinnableItems"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinnedItemsInputRowOptional r
  = ( types :: Optional (Array PinnableItemType)
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type PinnedItemsInput = { | PinnedItemsInputRowOptional + () }

pinnedItems
  :: forall r
   . PinnedItemsInput
  -> SelectionSet Scope__PinnableItemConnection r
  -> SelectionSet Scope__User r
pinnedItems input = selectionForCompositeField
                    "pinnedItems"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pinnedItemsRemaining :: SelectionSet Scope__User Int
pinnedItemsRemaining = selectionForField
                       "pinnedItemsRemaining"
                       []
                       graphqlDefaultResponseScalarDecoder

type ProjectInputRowRequired r = ( number :: Int | r )

type ProjectInput = { | ProjectInputRowRequired + () }

project
  :: forall r
   . ProjectInput
  -> SelectionSet Scope__Project r
  -> SelectionSet Scope__User (Maybe r)
project input = selectionForCompositeField
                "project"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectNextInputRowRequired r = ( number :: Int | r )

type ProjectNextInput = { | ProjectNextInputRowRequired + () }

projectNext
  :: forall r
   . ProjectNextInput
  -> SelectionSet Scope__ProjectNext r
  -> SelectionSet Scope__User (Maybe r)
projectNext input = selectionForCompositeField
                    "projectNext"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectsInputRowOptional r
  = ( orderBy :: Optional Examples.Github.InputObject.ProjectOrder
    , search :: Optional String
    , states :: Optional (Array ProjectState)
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type ProjectsInput = { | ProjectsInputRowOptional + () }

projects
  :: forall r
   . ProjectsInput
  -> SelectionSet Scope__ProjectConnection r
  -> SelectionSet Scope__User r
projects input = selectionForCompositeField
                 "projects"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectsNextInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , query :: Optional String
    , sortBy :: Optional ProjectNextOrderField
    | r
    )

type ProjectsNextInput = { | ProjectsNextInputRowOptional + () }

projectsNext
  :: forall r
   . ProjectsNextInput
  -> SelectionSet Scope__ProjectNextConnection r
  -> SelectionSet Scope__User r
projectsNext input = selectionForCompositeField
                     "projectsNext"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

projectsResourcePath :: SelectionSet Scope__User Uri
projectsResourcePath = selectionForField
                       "projectsResourcePath"
                       []
                       graphqlDefaultResponseScalarDecoder

projectsUrl :: SelectionSet Scope__User Uri
projectsUrl = selectionForField
              "projectsUrl"
              []
              graphqlDefaultResponseScalarDecoder

type PublicKeysInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type PublicKeysInput = { | PublicKeysInputRowOptional + () }

publicKeys
  :: forall r
   . PublicKeysInput
  -> SelectionSet Scope__PublicKeyConnection r
  -> SelectionSet Scope__User r
publicKeys input = selectionForCompositeField
                   "publicKeys"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestsInputRowOptional r
  = ( states :: Optional (Array PullRequestState)
    , labels :: Optional (Array String)
    , headRefName :: Optional String
    , baseRefName :: Optional String
    , orderBy :: Optional Examples.Github.InputObject.IssueOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type PullRequestsInput = { | PullRequestsInputRowOptional + () }

pullRequests
  :: forall r
   . PullRequestsInput
  -> SelectionSet Scope__PullRequestConnection r
  -> SelectionSet Scope__User r
pullRequests input = selectionForCompositeField
                     "pullRequests"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoriesInputRowOptional r
  = ( privacy :: Optional RepositoryPrivacy
    , orderBy :: Optional Examples.Github.InputObject.RepositoryOrder
    , affiliations :: Optional (Array (Maybe RepositoryAffiliation))
    , ownerAffiliations :: Optional (Array (Maybe RepositoryAffiliation))
    , isLocked :: Optional Boolean
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , isFork :: Optional Boolean
    | r
    )

type RepositoriesInput = { | RepositoriesInputRowOptional + () }

repositories
  :: forall r
   . RepositoriesInput
  -> SelectionSet Scope__RepositoryConnection r
  -> SelectionSet Scope__User r
repositories input = selectionForCompositeField
                     "repositories"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoriesContributedToInputRowOptional r
  = ( privacy :: Optional RepositoryPrivacy
    , orderBy :: Optional Examples.Github.InputObject.RepositoryOrder
    , isLocked :: Optional Boolean
    , includeUserRepositories :: Optional Boolean
    , contributionTypes :: Optional (Array (Maybe RepositoryContributionType))
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type RepositoriesContributedToInput
  = { | RepositoriesContributedToInputRowOptional + () }

repositoriesContributedTo
  :: forall r
   . RepositoriesContributedToInput
  -> SelectionSet Scope__RepositoryConnection r
  -> SelectionSet Scope__User r
repositoriesContributedTo input = selectionForCompositeField
                                  "repositoriesContributedTo"
                                  (toGraphQLArguments
                                   input)
                                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryInputRowOptional r = ( followRenames :: Optional Boolean | r )

type RepositoryInputRowRequired r = ( name :: String | r )

type RepositoryInput
  = { | RepositoryInputRowOptional + RepositoryInputRowRequired + () }

repository
  :: forall r
   . RepositoryInput
  -> SelectionSet Scope__Repository r
  -> SelectionSet Scope__User (Maybe r)
repository input = selectionForCompositeField
                   "repository"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryDiscussionCommentsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , repositoryId :: Optional Id
    , onlyAnswers :: Optional Boolean
    | r
    )

type RepositoryDiscussionCommentsInput
  = { | RepositoryDiscussionCommentsInputRowOptional + () }

repositoryDiscussionComments
  :: forall r
   . RepositoryDiscussionCommentsInput
  -> SelectionSet Scope__DiscussionCommentConnection r
  -> SelectionSet Scope__User r
repositoryDiscussionComments input = selectionForCompositeField
                                     "repositoryDiscussionComments"
                                     (toGraphQLArguments
                                      input)
                                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryDiscussionsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.DiscussionOrder
    , repositoryId :: Optional Id
    , answered :: Optional Boolean
    | r
    )

type RepositoryDiscussionsInput
  = { | RepositoryDiscussionsInputRowOptional + () }

repositoryDiscussions
  :: forall r
   . RepositoryDiscussionsInput
  -> SelectionSet Scope__DiscussionConnection r
  -> SelectionSet Scope__User r
repositoryDiscussions input = selectionForCompositeField
                              "repositoryDiscussions"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__User Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

type SavedRepliesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.SavedReplyOrder
    | r
    )

type SavedRepliesInput = { | SavedRepliesInputRowOptional + () }

savedReplies
  :: forall r
   . SavedRepliesInput
  -> SelectionSet Scope__SavedReplyConnection r
  -> SelectionSet Scope__User (Maybe r)
savedReplies input = selectionForCompositeField
                     "savedReplies"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsoringInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.SponsorOrder
    | r
    )

type SponsoringInput = { | SponsoringInputRowOptional + () }

sponsoring
  :: forall r
   . SponsoringInput
  -> SelectionSet Scope__SponsorConnection r
  -> SelectionSet Scope__User r
sponsoring input = selectionForCompositeField
                   "sponsoring"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , tierId :: Optional Id
    , orderBy :: Optional Examples.Github.InputObject.SponsorOrder
    | r
    )

type SponsorsInput = { | SponsorsInputRowOptional + () }

sponsors
  :: forall r
   . SponsorsInput
  -> SelectionSet Scope__SponsorConnection r
  -> SelectionSet Scope__User r
sponsors input = selectionForCompositeField
                 "sponsors"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorsActivitiesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , period :: Optional SponsorsActivityPeriod
    , orderBy :: Optional Examples.Github.InputObject.SponsorsActivityOrder
    | r
    )

type SponsorsActivitiesInput = { | SponsorsActivitiesInputRowOptional + () }

sponsorsActivities
  :: forall r
   . SponsorsActivitiesInput
  -> SelectionSet Scope__SponsorsActivityConnection r
  -> SelectionSet Scope__User r
sponsorsActivities input = selectionForCompositeField
                           "sponsorsActivities"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorsListing
  :: forall r
   . SelectionSet Scope__SponsorsListing r
  -> SelectionSet Scope__User (Maybe r)
sponsorsListing = selectionForCompositeField
                  "sponsorsListing"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorshipForViewerAsSponsor
  :: forall r
   . SelectionSet Scope__Sponsorship r
  -> SelectionSet Scope__User (Maybe r)
sponsorshipForViewerAsSponsor = selectionForCompositeField
                                "sponsorshipForViewerAsSponsor"
                                []
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorshipForViewerAsSponsorable
  :: forall r
   . SelectionSet Scope__Sponsorship r
  -> SelectionSet Scope__User (Maybe r)
sponsorshipForViewerAsSponsorable = selectionForCompositeField
                                    "sponsorshipForViewerAsSponsorable"
                                    []
                                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipNewslettersInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.SponsorshipNewsletterOrder
    | r
    )

type SponsorshipNewslettersInput
  = { | SponsorshipNewslettersInputRowOptional + () }

sponsorshipNewsletters
  :: forall r
   . SponsorshipNewslettersInput
  -> SelectionSet Scope__SponsorshipNewsletterConnection r
  -> SelectionSet Scope__User r
sponsorshipNewsletters input = selectionForCompositeField
                               "sponsorshipNewsletters"
                               (toGraphQLArguments
                                input)
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsMaintainerInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , includePrivate :: Optional Boolean
    , orderBy :: Optional Examples.Github.InputObject.SponsorshipOrder
    | r
    )

type SponsorshipsAsMaintainerInput
  = { | SponsorshipsAsMaintainerInputRowOptional + () }

sponsorshipsAsMaintainer
  :: forall r
   . SponsorshipsAsMaintainerInput
  -> SelectionSet Scope__SponsorshipConnection r
  -> SelectionSet Scope__User r
sponsorshipsAsMaintainer input = selectionForCompositeField
                                 "sponsorshipsAsMaintainer"
                                 (toGraphQLArguments
                                  input)
                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsSponsorInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.SponsorshipOrder
    | r
    )

type SponsorshipsAsSponsorInput
  = { | SponsorshipsAsSponsorInputRowOptional + () }

sponsorshipsAsSponsor
  :: forall r
   . SponsorshipsAsSponsorInput
  -> SelectionSet Scope__SponsorshipConnection r
  -> SelectionSet Scope__User r
sponsorshipsAsSponsor input = selectionForCompositeField
                              "sponsorshipsAsSponsor"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type StarredRepositoriesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , ownedByViewer :: Optional Boolean
    , orderBy :: Optional Examples.Github.InputObject.StarOrder
    | r
    )

type StarredRepositoriesInput = { | StarredRepositoriesInputRowOptional + () }

starredRepositories
  :: forall r
   . StarredRepositoriesInput
  -> SelectionSet Scope__StarredRepositoryConnection r
  -> SelectionSet Scope__User r
starredRepositories input = selectionForCompositeField
                            "starredRepositories"
                            (toGraphQLArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

status
  :: forall r
   . SelectionSet Scope__UserStatus r
  -> SelectionSet Scope__User (Maybe r)
status = selectionForCompositeField
         "status"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TopRepositoriesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , since :: Optional DateTime
    | r
    )

type TopRepositoriesInputRowRequired r
  = ( orderBy :: Examples.Github.InputObject.RepositoryOrder | r )

type TopRepositoriesInput
  = { | TopRepositoriesInputRowOptional + TopRepositoriesInputRowRequired + () }

topRepositories
  :: forall r
   . TopRepositoriesInput
  -> SelectionSet Scope__RepositoryConnection r
  -> SelectionSet Scope__User r
topRepositories input = selectionForCompositeField
                        "topRepositories"
                        (toGraphQLArguments
                         input)
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

twitterUsername :: SelectionSet Scope__User (Maybe String)
twitterUsername = selectionForField
                  "twitterUsername"
                  []
                  graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__User DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__User Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanChangePinnedItems :: SelectionSet Scope__User Boolean
viewerCanChangePinnedItems = selectionForField
                             "viewerCanChangePinnedItems"
                             []
                             graphqlDefaultResponseScalarDecoder

viewerCanCreateProjects :: SelectionSet Scope__User Boolean
viewerCanCreateProjects = selectionForField
                          "viewerCanCreateProjects"
                          []
                          graphqlDefaultResponseScalarDecoder

viewerCanFollow :: SelectionSet Scope__User Boolean
viewerCanFollow = selectionForField
                  "viewerCanFollow"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerCanSponsor :: SelectionSet Scope__User Boolean
viewerCanSponsor = selectionForField
                   "viewerCanSponsor"
                   []
                   graphqlDefaultResponseScalarDecoder

viewerIsFollowing :: SelectionSet Scope__User Boolean
viewerIsFollowing = selectionForField
                    "viewerIsFollowing"
                    []
                    graphqlDefaultResponseScalarDecoder

viewerIsSponsoring :: SelectionSet Scope__User Boolean
viewerIsSponsoring = selectionForField
                     "viewerIsSponsoring"
                     []
                     graphqlDefaultResponseScalarDecoder

type WatchingInputRowOptional r
  = ( privacy :: Optional RepositoryPrivacy
    , orderBy :: Optional Examples.Github.InputObject.RepositoryOrder
    , affiliations :: Optional (Array (Maybe RepositoryAffiliation))
    , ownerAffiliations :: Optional (Array (Maybe RepositoryAffiliation))
    , isLocked :: Optional Boolean
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type WatchingInput = { | WatchingInputRowOptional + () }

watching
  :: forall r
   . WatchingInput
  -> SelectionSet Scope__RepositoryConnection r
  -> SelectionSet Scope__User r
watching input = selectionForCompositeField
                 "watching"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

websiteUrl :: SelectionSet Scope__User (Maybe Uri)
websiteUrl = selectionForField
             "websiteUrl"
             []
             graphqlDefaultResponseScalarDecoder
