module Examples.Github.Object.User where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphqlArguments
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Enum.PinnableItemType
  ( PinnableItemType
  )
import Type.Row
  ( type (+)
  )
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
  , Scope__IssueCommentConnection
  , Scope__IssueConnection
  , Scope__ProfileItemShowcase
  , Scope__Organization
  , Scope__OrganizationConnection
  , Scope__PackageConnection
  , Scope__PinnableItemConnection
  , Scope__Project
  , Scope__ProjectConnection
  , Scope__PublicKeyConnection
  , Scope__PullRequestConnection
  , Scope__RepositoryConnection
  , Scope__Repository
  , Scope__SavedReplyConnection
  , Scope__SponsorsListing
  , Scope__SponsorshipConnection
  , Scope__StarredRepositoryConnection
  , Scope__UserStatus
  )
import Examples.Github.Scalars
  ( Uri
  , Html
  , Id
  , DateTime
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Enum.GistPrivacy
  ( GistPrivacy
  )
import Examples.Github.InputObject
  ( GistOrder
  , IssueOrder
  , IssueFilters
  , PackageOrder
  , ProjectOrder
  , RepositoryOrder
  , SavedReplyOrder
  , SponsorshipOrder
  , StarOrder
  ) as Examples.Github.InputObject
import Examples.Github.Enum.IssueState
  ( IssueState
  )
import Examples.Github.Enum.PackageType
  ( PackageType
  )
import Examples.Github.Enum.ProjectState
  ( ProjectState
  )
import Examples.Github.Enum.PullRequestState
  ( PullRequestState
  )
import Examples.Github.Enum.RepositoryPrivacy
  ( RepositoryPrivacy
  )
import Examples.Github.Enum.RepositoryAffiliation
  ( RepositoryAffiliation
  )
import Examples.Github.Enum.RepositoryContributionType
  ( RepositoryContributionType
  )

type AnyPinnableItemsInputRowOptional r = ( "type" :: Optional PinnableItemType
                                          | r
                                          )

type AnyPinnableItemsInput = { | AnyPinnableItemsInputRowOptional + () }

anyPinnableItems :: AnyPinnableItemsInput -> SelectionSet Scope__User Boolean
anyPinnableItems input = selectionForField "anyPinnableItems" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

type AvatarUrlInputRowOptional r = ( size :: Optional Int
                                   | r
                                   )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__User Uri
avatarUrl input = selectionForField "avatarUrl" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

bio :: SelectionSet Scope__User (Maybe String)
bio = selectionForField "bio" [] graphqlDefaultResponseScalarDecoder

bioHTML :: SelectionSet Scope__User Html
bioHTML = selectionForField "bioHTML" [] graphqlDefaultResponseScalarDecoder

type CommitCommentsInputRowOptional r = ( after :: Optional String
                                        , before :: Optional String
                                        , first :: Optional Int
                                        , last :: Optional Int
                                        | r
                                        )

type CommitCommentsInput = { | CommitCommentsInputRowOptional + () }

commitComments :: forall r . CommitCommentsInput -> SelectionSet Scope__CommitCommentConnection r -> SelectionSet Scope__User r
commitComments input = selectionForCompositeField "commitComments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

company :: SelectionSet Scope__User (Maybe String)
company = selectionForField "company" [] graphqlDefaultResponseScalarDecoder

companyHTML :: SelectionSet Scope__User Html
companyHTML = selectionForField "companyHTML" [] graphqlDefaultResponseScalarDecoder

type ContributionsCollectionInputRowOptional r = ( organizationID :: Optional Id
                                                 , from :: Optional DateTime
                                                 , to :: Optional DateTime
                                                 | r
                                                 )

type ContributionsCollectionInput = { | ContributionsCollectionInputRowOptional + () }

contributionsCollection :: forall r . ContributionsCollectionInput -> SelectionSet Scope__ContributionsCollection r -> SelectionSet Scope__User r
contributionsCollection input = selectionForCompositeField "contributionsCollection" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__User DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__User (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

email :: SelectionSet Scope__User String
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

type FollowersInputRowOptional r = ( after :: Optional String
                                   , before :: Optional String
                                   , first :: Optional Int
                                   , last :: Optional Int
                                   | r
                                   )

type FollowersInput = { | FollowersInputRowOptional + () }

followers :: forall r . FollowersInput -> SelectionSet Scope__FollowerConnection r -> SelectionSet Scope__User r
followers input = selectionForCompositeField "followers" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type FollowingInputRowOptional r = ( after :: Optional String
                                   , before :: Optional String
                                   , first :: Optional Int
                                   , last :: Optional Int
                                   | r
                                   )

type FollowingInput = { | FollowingInputRowOptional + () }

following :: forall r . FollowingInput -> SelectionSet Scope__FollowingConnection r -> SelectionSet Scope__User r
following input = selectionForCompositeField "following" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GistInputRowRequired r = ( name :: String
                              | r
                              )

type GistInput = { | GistInputRowRequired + () }

gist :: forall r . GistInput -> SelectionSet Scope__Gist r -> SelectionSet Scope__User (Maybe r)
gist input = selectionForCompositeField "gist" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GistCommentsInputRowOptional r = ( after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type GistCommentsInput = { | GistCommentsInputRowOptional + () }

gistComments :: forall r . GistCommentsInput -> SelectionSet Scope__GistCommentConnection r -> SelectionSet Scope__User r
gistComments input = selectionForCompositeField "gistComments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type GistsInputRowOptional r = ( privacy :: Optional GistPrivacy
                               , orderBy :: Optional Examples.Github.InputObject.GistOrder
                               , after :: Optional String
                               , before :: Optional String
                               , first :: Optional Int
                               , last :: Optional Int
                               | r
                               )

type GistsInput = { | GistsInputRowOptional + () }

gists :: forall r . GistsInput -> SelectionSet Scope__GistConnection r -> SelectionSet Scope__User r
gists input = selectionForCompositeField "gists" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HovercardInputRowOptional r = ( primarySubjectId :: Optional Id
                                   | r
                                   )

type HovercardInput = { | HovercardInputRowOptional + () }

hovercard :: forall r . HovercardInput -> SelectionSet Scope__Hovercard r -> SelectionSet Scope__User r
hovercard input = selectionForCompositeField "hovercard" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__User Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isBountyHunter :: SelectionSet Scope__User Boolean
isBountyHunter = selectionForField "isBountyHunter" [] graphqlDefaultResponseScalarDecoder

isCampusExpert :: SelectionSet Scope__User Boolean
isCampusExpert = selectionForField "isCampusExpert" [] graphqlDefaultResponseScalarDecoder

isDeveloperProgramMember :: SelectionSet Scope__User Boolean
isDeveloperProgramMember = selectionForField "isDeveloperProgramMember" [] graphqlDefaultResponseScalarDecoder

isEmployee :: SelectionSet Scope__User Boolean
isEmployee = selectionForField "isEmployee" [] graphqlDefaultResponseScalarDecoder

isHireable :: SelectionSet Scope__User Boolean
isHireable = selectionForField "isHireable" [] graphqlDefaultResponseScalarDecoder

isSiteAdmin :: SelectionSet Scope__User Boolean
isSiteAdmin = selectionForField "isSiteAdmin" [] graphqlDefaultResponseScalarDecoder

isViewer :: SelectionSet Scope__User Boolean
isViewer = selectionForField "isViewer" [] graphqlDefaultResponseScalarDecoder

type IssueCommentsInputRowOptional r = ( after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type IssueCommentsInput = { | IssueCommentsInputRowOptional + () }

issueComments :: forall r . IssueCommentsInput -> SelectionSet Scope__IssueCommentConnection r -> SelectionSet Scope__User r
issueComments input = selectionForCompositeField "issueComments" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type IssuesInputRowOptional r = ( orderBy :: Optional Examples.Github.InputObject.IssueOrder
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

issues :: forall r . IssuesInput -> SelectionSet Scope__IssueConnection r -> SelectionSet Scope__User r
issues input = selectionForCompositeField "issues" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

itemShowcase :: forall r . SelectionSet Scope__ProfileItemShowcase r -> SelectionSet Scope__User r
itemShowcase = selectionForCompositeField "itemShowcase" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

location :: SelectionSet Scope__User (Maybe String)
location = selectionForField "location" [] graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__User String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__User (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type OrganizationInputRowRequired r = ( login :: String
                                      | r
                                      )

type OrganizationInput = { | OrganizationInputRowRequired + () }

organization :: forall r . OrganizationInput -> SelectionSet Scope__Organization r -> SelectionSet Scope__User (Maybe r)
organization input = selectionForCompositeField "organization" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type OrganizationVerifiedDomainEmailsInputRowRequired r = ( login :: String
                                                          | r
                                                          )

type OrganizationVerifiedDomainEmailsInput = { | OrganizationVerifiedDomainEmailsInputRowRequired + () }

organizationVerifiedDomainEmails :: OrganizationVerifiedDomainEmailsInput -> SelectionSet Scope__User (Array String)
organizationVerifiedDomainEmails input = selectionForField "organizationVerifiedDomainEmails" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

type OrganizationsInputRowOptional r = ( after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type OrganizationsInput = { | OrganizationsInputRowOptional + () }

organizations :: forall r . OrganizationsInput -> SelectionSet Scope__OrganizationConnection r -> SelectionSet Scope__User r
organizations input = selectionForCompositeField "organizations" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PackagesInputRowOptional r = ( after :: Optional String
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

packages :: forall r . PackagesInput -> SelectionSet Scope__PackageConnection r -> SelectionSet Scope__User r
packages input = selectionForCompositeField "packages" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinnableItemsInputRowOptional r = ( types :: Optional (Array PinnableItemType)
                                       , after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type PinnableItemsInput = { | PinnableItemsInputRowOptional + () }

pinnableItems :: forall r . PinnableItemsInput -> SelectionSet Scope__PinnableItemConnection r -> SelectionSet Scope__User r
pinnableItems input = selectionForCompositeField "pinnableItems" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinnedItemsInputRowOptional r = ( types :: Optional (Array PinnableItemType)
                                     , after :: Optional String
                                     , before :: Optional String
                                     , first :: Optional Int
                                     , last :: Optional Int
                                     | r
                                     )

type PinnedItemsInput = { | PinnedItemsInputRowOptional + () }

pinnedItems :: forall r . PinnedItemsInput -> SelectionSet Scope__PinnableItemConnection r -> SelectionSet Scope__User r
pinnedItems input = selectionForCompositeField "pinnedItems" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pinnedItemsRemaining :: SelectionSet Scope__User Int
pinnedItemsRemaining = selectionForField "pinnedItemsRemaining" [] graphqlDefaultResponseScalarDecoder

type ProjectInputRowRequired r = ( number :: Int
                                 | r
                                 )

type ProjectInput = { | ProjectInputRowRequired + () }

project :: forall r . ProjectInput -> SelectionSet Scope__Project r -> SelectionSet Scope__User (Maybe r)
project input = selectionForCompositeField "project" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectsInputRowOptional r = ( orderBy :: Optional Examples.Github.InputObject.ProjectOrder
                                  , search :: Optional String
                                  , states :: Optional (Array ProjectState)
                                  , after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type ProjectsInput = { | ProjectsInputRowOptional + () }

projects :: forall r . ProjectsInput -> SelectionSet Scope__ProjectConnection r -> SelectionSet Scope__User r
projects input = selectionForCompositeField "projects" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

projectsResourcePath :: SelectionSet Scope__User Uri
projectsResourcePath = selectionForField "projectsResourcePath" [] graphqlDefaultResponseScalarDecoder

projectsUrl :: SelectionSet Scope__User Uri
projectsUrl = selectionForField "projectsUrl" [] graphqlDefaultResponseScalarDecoder

type PublicKeysInputRowOptional r = ( after :: Optional String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    | r
                                    )

type PublicKeysInput = { | PublicKeysInputRowOptional + () }

publicKeys :: forall r . PublicKeysInput -> SelectionSet Scope__PublicKeyConnection r -> SelectionSet Scope__User r
publicKeys input = selectionForCompositeField "publicKeys" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PullRequestsInputRowOptional r = ( states :: Optional (Array PullRequestState)
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

pullRequests :: forall r . PullRequestsInput -> SelectionSet Scope__PullRequestConnection r -> SelectionSet Scope__User r
pullRequests input = selectionForCompositeField "pullRequests" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoriesInputRowOptional r = ( privacy :: Optional RepositoryPrivacy
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

repositories :: forall r . RepositoriesInput -> SelectionSet Scope__RepositoryConnection r -> SelectionSet Scope__User r
repositories input = selectionForCompositeField "repositories" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoriesContributedToInputRowOptional r = ( privacy :: Optional RepositoryPrivacy
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

type RepositoriesContributedToInput = { | RepositoriesContributedToInputRowOptional + () }

repositoriesContributedTo :: forall r . RepositoriesContributedToInput -> SelectionSet Scope__RepositoryConnection r -> SelectionSet Scope__User r
repositoriesContributedTo input = selectionForCompositeField "repositoriesContributedTo" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryInputRowRequired r = ( name :: String
                                    | r
                                    )

type RepositoryInput = { | RepositoryInputRowRequired + () }

repository :: forall r . RepositoryInput -> SelectionSet Scope__Repository r -> SelectionSet Scope__User (Maybe r)
repository input = selectionForCompositeField "repository" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__User Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

type SavedRepliesInputRowOptional r = ( after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      , orderBy :: Optional Examples.Github.InputObject.SavedReplyOrder
                                      | r
                                      )

type SavedRepliesInput = { | SavedRepliesInputRowOptional + () }

savedReplies :: forall r . SavedRepliesInput -> SelectionSet Scope__SavedReplyConnection r -> SelectionSet Scope__User (Maybe r)
savedReplies input = selectionForCompositeField "savedReplies" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorsListing :: forall r . SelectionSet Scope__SponsorsListing r -> SelectionSet Scope__User (Maybe r)
sponsorsListing = selectionForCompositeField "sponsorsListing" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsMaintainerInputRowOptional r = ( after :: Optional String
                                                  , before :: Optional String
                                                  , first :: Optional Int
                                                  , last :: Optional Int
                                                  , includePrivate :: Optional Boolean
                                                  , orderBy :: Optional Examples.Github.InputObject.SponsorshipOrder
                                                  | r
                                                  )

type SponsorshipsAsMaintainerInput = { | SponsorshipsAsMaintainerInputRowOptional + () }

sponsorshipsAsMaintainer :: forall r . SponsorshipsAsMaintainerInput -> SelectionSet Scope__SponsorshipConnection r -> SelectionSet Scope__User r
sponsorshipsAsMaintainer input = selectionForCompositeField "sponsorshipsAsMaintainer" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsSponsorInputRowOptional r = ( after :: Optional String
                                               , before :: Optional String
                                               , first :: Optional Int
                                               , last :: Optional Int
                                               , orderBy :: Optional Examples.Github.InputObject.SponsorshipOrder
                                               | r
                                               )

type SponsorshipsAsSponsorInput = { | SponsorshipsAsSponsorInputRowOptional + () }

sponsorshipsAsSponsor :: forall r . SponsorshipsAsSponsorInput -> SelectionSet Scope__SponsorshipConnection r -> SelectionSet Scope__User r
sponsorshipsAsSponsor input = selectionForCompositeField "sponsorshipsAsSponsor" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type StarredRepositoriesInputRowOptional r = ( after :: Optional String
                                             , before :: Optional String
                                             , first :: Optional Int
                                             , last :: Optional Int
                                             , ownedByViewer :: Optional Boolean
                                             , orderBy :: Optional Examples.Github.InputObject.StarOrder
                                             | r
                                             )

type StarredRepositoriesInput = { | StarredRepositoriesInputRowOptional + () }

starredRepositories :: forall r . StarredRepositoriesInput -> SelectionSet Scope__StarredRepositoryConnection r -> SelectionSet Scope__User r
starredRepositories input = selectionForCompositeField "starredRepositories" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

status :: forall r . SelectionSet Scope__UserStatus r -> SelectionSet Scope__User (Maybe r)
status = selectionForCompositeField "status" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TopRepositoriesInputRowOptional r = ( after :: Optional String
                                         , before :: Optional String
                                         , first :: Optional Int
                                         , last :: Optional Int
                                         , since :: Optional DateTime
                                         | r
                                         )

type TopRepositoriesInputRowRequired r = ( orderBy :: Examples.Github.InputObject.RepositoryOrder
                                         | r
                                         )

type TopRepositoriesInput = { | TopRepositoriesInputRowOptional + TopRepositoriesInputRowRequired + () }

topRepositories :: forall r . TopRepositoriesInput -> SelectionSet Scope__RepositoryConnection r -> SelectionSet Scope__User r
topRepositories input = selectionForCompositeField "topRepositories" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

twitterUsername :: SelectionSet Scope__User (Maybe String)
twitterUsername = selectionForField "twitterUsername" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__User DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__User Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanChangePinnedItems :: SelectionSet Scope__User Boolean
viewerCanChangePinnedItems = selectionForField "viewerCanChangePinnedItems" [] graphqlDefaultResponseScalarDecoder

viewerCanCreateProjects :: SelectionSet Scope__User Boolean
viewerCanCreateProjects = selectionForField "viewerCanCreateProjects" [] graphqlDefaultResponseScalarDecoder

viewerCanFollow :: SelectionSet Scope__User Boolean
viewerCanFollow = selectionForField "viewerCanFollow" [] graphqlDefaultResponseScalarDecoder

viewerIsFollowing :: SelectionSet Scope__User Boolean
viewerIsFollowing = selectionForField "viewerIsFollowing" [] graphqlDefaultResponseScalarDecoder

type WatchingInputRowOptional r = ( privacy :: Optional RepositoryPrivacy
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

watching :: forall r . WatchingInput -> SelectionSet Scope__RepositoryConnection r -> SelectionSet Scope__User r
watching input = selectionForCompositeField "watching" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

websiteUrl :: SelectionSet Scope__User (Maybe Uri)
websiteUrl = selectionForField "websiteUrl" [] graphqlDefaultResponseScalarDecoder
