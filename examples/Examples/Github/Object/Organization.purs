module Examples.Github.Object.Organization where

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
  ( Scope__Organization
  , Scope__OrganizationAuditEntryConnection
  , Scope__VerifiableDomainConnection
  , Scope__OrganizationEnterpriseOwnerConnection
  , Scope__RepositoryInteractionAbility
  , Scope__IpAllowListEntryConnection
  , Scope__ProfileItemShowcase
  , Scope__UserStatusConnection
  , Scope__OrganizationMemberConnection
  , Scope__PackageConnection
  , Scope__UserConnection
  , Scope__PinnableItemConnection
  , Scope__Project
  , Scope__ProjectNext
  , Scope__ProjectConnection
  , Scope__ProjectNextConnection
  , Scope__RepositoryConnection
  , Scope__Repository
  , Scope__DiscussionCommentConnection
  , Scope__DiscussionConnection
  , Scope__RepositoryMigrationConnection
  , Scope__OrganizationIdentityProvider
  , Scope__SponsorConnection
  , Scope__SponsorsActivityConnection
  , Scope__SponsorsListing
  , Scope__Sponsorship
  , Scope__SponsorshipNewsletterConnection
  , Scope__SponsorshipConnection
  , Scope__Team
  , Scope__TeamConnection
  )
import Examples.Github.InputObject
  ( AuditLogOrder
  , VerifiableDomainOrder
  , OrgEnterpriseOwnerOrder
  , IpAllowListEntryOrder
  , UserStatusOrder
  , PackageOrder
  , ProjectOrder
  , RepositoryOrder
  , DiscussionOrder
  , RepositoryMigrationOrder
  , SponsorOrder
  , SponsorsActivityOrder
  , SponsorshipNewsletterOrder
  , SponsorshipOrder
  , TeamOrder
  ) as Examples.Github.InputObject
import Examples.Github.Scalars (Uri, DateTime, Id)
import Data.Maybe (Maybe)
import Examples.Github.Enum.RoleInOrganization (RoleInOrganization)
import Examples.Github.Enum.IpAllowListEnabledSettingValue
  (IpAllowListEnabledSettingValue)
import Examples.Github.Enum.IpAllowListForInstalledAppsEnabledSettingValue
  (IpAllowListForInstalledAppsEnabledSettingValue)
import Examples.Github.Enum.NotificationRestrictionSettingValue
  (NotificationRestrictionSettingValue)
import Examples.Github.Enum.PackageType (PackageType)
import Examples.Github.Enum.ProjectState (ProjectState)
import Examples.Github.Enum.ProjectNextOrderField (ProjectNextOrderField)
import Examples.Github.Enum.RepositoryPrivacy (RepositoryPrivacy)
import Examples.Github.Enum.RepositoryAffiliation (RepositoryAffiliation)
import Examples.Github.Enum.MigrationState (MigrationState)
import Examples.Github.Enum.SponsorsActivityPeriod (SponsorsActivityPeriod)
import Examples.Github.Enum.TeamPrivacy (TeamPrivacy)
import Examples.Github.Enum.TeamRole (TeamRole)

type AnyPinnableItemsInputRowOptional r
  = ( "type" :: Optional PinnableItemType | r )

type AnyPinnableItemsInput = { | AnyPinnableItemsInputRowOptional + () }

anyPinnableItems
  :: AnyPinnableItemsInput
  -> SelectionSet Scope__Organization Boolean
anyPinnableItems input = selectionForField
                         "anyPinnableItems"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseScalarDecoder

type AuditLogInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , query :: Optional String
    , orderBy :: Optional Examples.Github.InputObject.AuditLogOrder
    | r
    )

type AuditLogInput = { | AuditLogInputRowOptional + () }

auditLog
  :: forall r
   . AuditLogInput
  -> SelectionSet Scope__OrganizationAuditEntryConnection r
  -> SelectionSet Scope__Organization r
auditLog input = selectionForCompositeField
                 "auditLog"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AvatarUrlInputRowOptional r = ( size :: Optional Int | r )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__Organization Uri
avatarUrl input = selectionForField
                  "avatarUrl"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Organization DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Organization (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Organization (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

descriptionHTML :: SelectionSet Scope__Organization (Maybe String)
descriptionHTML = selectionForField
                  "descriptionHTML"
                  []
                  graphqlDefaultResponseScalarDecoder

type DomainsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , isVerified :: Optional Boolean
    , isApproved :: Optional Boolean
    , orderBy :: Optional Examples.Github.InputObject.VerifiableDomainOrder
    | r
    )

type DomainsInput = { | DomainsInputRowOptional + () }

domains
  :: forall r
   . DomainsInput
  -> SelectionSet Scope__VerifiableDomainConnection r
  -> SelectionSet Scope__Organization (Maybe r)
domains input = selectionForCompositeField
                "domains"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

email :: SelectionSet Scope__Organization (Maybe String)
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

type EnterpriseOwnersInputRowOptional r
  = ( query :: Optional String
    , organizationRole :: Optional RoleInOrganization
    , orderBy :: Optional Examples.Github.InputObject.OrgEnterpriseOwnerOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type EnterpriseOwnersInput = { | EnterpriseOwnersInputRowOptional + () }

enterpriseOwners
  :: forall r
   . EnterpriseOwnersInput
  -> SelectionSet Scope__OrganizationEnterpriseOwnerConnection r
  -> SelectionSet Scope__Organization r
enterpriseOwners input = selectionForCompositeField
                         "enterpriseOwners"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

estimatedNextSponsorsPayoutInCents :: SelectionSet Scope__Organization Int
estimatedNextSponsorsPayoutInCents = selectionForField
                                     "estimatedNextSponsorsPayoutInCents"
                                     []
                                     graphqlDefaultResponseScalarDecoder

hasSponsorsListing :: SelectionSet Scope__Organization Boolean
hasSponsorsListing = selectionForField
                     "hasSponsorsListing"
                     []
                     graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Organization Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

interactionAbility
  :: forall r
   . SelectionSet Scope__RepositoryInteractionAbility r
  -> SelectionSet Scope__Organization (Maybe r)
interactionAbility = selectionForCompositeField
                     "interactionAbility"
                     []
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ipAllowListEnabledSetting
  :: SelectionSet
     Scope__Organization
     IpAllowListEnabledSettingValue
ipAllowListEnabledSetting = selectionForField
                            "ipAllowListEnabledSetting"
                            []
                            graphqlDefaultResponseScalarDecoder

type IpAllowListEntriesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.IpAllowListEntryOrder
    | r
    )

type IpAllowListEntriesInput = { | IpAllowListEntriesInputRowOptional + () }

ipAllowListEntries
  :: forall r
   . IpAllowListEntriesInput
  -> SelectionSet Scope__IpAllowListEntryConnection r
  -> SelectionSet Scope__Organization r
ipAllowListEntries input = selectionForCompositeField
                           "ipAllowListEntries"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ipAllowListForInstalledAppsEnabledSetting
  :: SelectionSet
     Scope__Organization
     IpAllowListForInstalledAppsEnabledSettingValue
ipAllowListForInstalledAppsEnabledSetting = selectionForField
                                            "ipAllowListForInstalledAppsEnabledSetting"
                                            []
                                            graphqlDefaultResponseScalarDecoder

type IsSponsoredByInputRowRequired r = ( accountLogin :: String | r )

type IsSponsoredByInput = { | IsSponsoredByInputRowRequired + () }

isSponsoredBy :: IsSponsoredByInput -> SelectionSet Scope__Organization Boolean
isSponsoredBy input = selectionForField
                      "isSponsoredBy"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseScalarDecoder

isSponsoringViewer :: SelectionSet Scope__Organization Boolean
isSponsoringViewer = selectionForField
                     "isSponsoringViewer"
                     []
                     graphqlDefaultResponseScalarDecoder

isVerified :: SelectionSet Scope__Organization Boolean
isVerified = selectionForField
             "isVerified"
             []
             graphqlDefaultResponseScalarDecoder

itemShowcase
  :: forall r
   . SelectionSet Scope__ProfileItemShowcase r
  -> SelectionSet Scope__Organization r
itemShowcase = selectionForCompositeField
               "itemShowcase"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

location :: SelectionSet Scope__Organization (Maybe String)
location = selectionForField "location" [] graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__Organization String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

type MemberStatusesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.UserStatusOrder
    | r
    )

type MemberStatusesInput = { | MemberStatusesInputRowOptional + () }

memberStatuses
  :: forall r
   . MemberStatusesInput
  -> SelectionSet Scope__UserStatusConnection r
  -> SelectionSet Scope__Organization r
memberStatuses input = selectionForCompositeField
                       "memberStatuses"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanForkPrivateRepositories :: SelectionSet Scope__Organization Boolean
membersCanForkPrivateRepositories = selectionForField
                                    "membersCanForkPrivateRepositories"
                                    []
                                    graphqlDefaultResponseScalarDecoder

type MembersWithRoleInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type MembersWithRoleInput = { | MembersWithRoleInputRowOptional + () }

membersWithRole
  :: forall r
   . MembersWithRoleInput
  -> SelectionSet Scope__OrganizationMemberConnection r
  -> SelectionSet Scope__Organization r
membersWithRole input = selectionForCompositeField
                        "membersWithRole"
                        (toGraphQLArguments
                         input)
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

monthlyEstimatedSponsorsIncomeInCents :: SelectionSet Scope__Organization Int
monthlyEstimatedSponsorsIncomeInCents = selectionForField
                                        "monthlyEstimatedSponsorsIncomeInCents"
                                        []
                                        graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Organization (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

newTeamResourcePath :: SelectionSet Scope__Organization Uri
newTeamResourcePath = selectionForField
                      "newTeamResourcePath"
                      []
                      graphqlDefaultResponseScalarDecoder

newTeamUrl :: SelectionSet Scope__Organization Uri
newTeamUrl = selectionForField
             "newTeamUrl"
             []
             graphqlDefaultResponseScalarDecoder

notificationDeliveryRestrictionEnabledSetting
  :: SelectionSet
     Scope__Organization
     NotificationRestrictionSettingValue
notificationDeliveryRestrictionEnabledSetting = selectionForField
                                                "notificationDeliveryRestrictionEnabledSetting"
                                                []
                                                graphqlDefaultResponseScalarDecoder

organizationBillingEmail :: SelectionSet Scope__Organization (Maybe String)
organizationBillingEmail = selectionForField
                           "organizationBillingEmail"
                           []
                           graphqlDefaultResponseScalarDecoder

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
  -> SelectionSet Scope__Organization r
packages input = selectionForCompositeField
                 "packages"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingMembersInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type PendingMembersInput = { | PendingMembersInputRowOptional + () }

pendingMembers
  :: forall r
   . PendingMembersInput
  -> SelectionSet Scope__UserConnection r
  -> SelectionSet Scope__Organization r
pendingMembers input = selectionForCompositeField
                       "pendingMembers"
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
  -> SelectionSet Scope__Organization r
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
  -> SelectionSet Scope__Organization r
pinnedItems input = selectionForCompositeField
                    "pinnedItems"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pinnedItemsRemaining :: SelectionSet Scope__Organization Int
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
  -> SelectionSet Scope__Organization (Maybe r)
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
  -> SelectionSet Scope__Organization (Maybe r)
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
  -> SelectionSet Scope__Organization r
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
  -> SelectionSet Scope__Organization r
projectsNext input = selectionForCompositeField
                     "projectsNext"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

projectsResourcePath :: SelectionSet Scope__Organization Uri
projectsResourcePath = selectionForField
                       "projectsResourcePath"
                       []
                       graphqlDefaultResponseScalarDecoder

projectsUrl :: SelectionSet Scope__Organization Uri
projectsUrl = selectionForField
              "projectsUrl"
              []
              graphqlDefaultResponseScalarDecoder

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
  -> SelectionSet Scope__Organization r
repositories input = selectionForCompositeField
                     "repositories"
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
  -> SelectionSet Scope__Organization (Maybe r)
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
  -> SelectionSet Scope__Organization r
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
  -> SelectionSet Scope__Organization r
repositoryDiscussions input = selectionForCompositeField
                              "repositoryDiscussions"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryMigrationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , state :: Optional MigrationState
    , orderBy :: Optional Examples.Github.InputObject.RepositoryMigrationOrder
    | r
    )

type RepositoryMigrationsInput = { | RepositoryMigrationsInputRowOptional + () }

repositoryMigrations
  :: forall r
   . RepositoryMigrationsInput
  -> SelectionSet Scope__RepositoryMigrationConnection r
  -> SelectionSet Scope__Organization r
repositoryMigrations input = selectionForCompositeField
                             "repositoryMigrations"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

requiresTwoFactorAuthentication
  :: SelectionSet
     Scope__Organization
     (Maybe Boolean)
requiresTwoFactorAuthentication = selectionForField
                                  "requiresTwoFactorAuthentication"
                                  []
                                  graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__Organization Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

samlIdentityProvider
  :: forall r
   . SelectionSet Scope__OrganizationIdentityProvider r
  -> SelectionSet Scope__Organization (Maybe r)
samlIdentityProvider = selectionForCompositeField
                       "samlIdentityProvider"
                       []
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
  -> SelectionSet Scope__Organization r
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
  -> SelectionSet Scope__Organization r
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
  -> SelectionSet Scope__Organization r
sponsorsActivities input = selectionForCompositeField
                           "sponsorsActivities"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorsListing
  :: forall r
   . SelectionSet Scope__SponsorsListing r
  -> SelectionSet Scope__Organization (Maybe r)
sponsorsListing = selectionForCompositeField
                  "sponsorsListing"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorshipForViewerAsSponsor
  :: forall r
   . SelectionSet Scope__Sponsorship r
  -> SelectionSet Scope__Organization (Maybe r)
sponsorshipForViewerAsSponsor = selectionForCompositeField
                                "sponsorshipForViewerAsSponsor"
                                []
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorshipForViewerAsSponsorable
  :: forall r
   . SelectionSet Scope__Sponsorship r
  -> SelectionSet Scope__Organization (Maybe r)
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
  -> SelectionSet Scope__Organization r
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
  -> SelectionSet Scope__Organization r
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
  -> SelectionSet Scope__Organization r
sponsorshipsAsSponsor input = selectionForCompositeField
                              "sponsorshipsAsSponsor"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TeamInputRowRequired r = ( slug :: String | r )

type TeamInput = { | TeamInputRowRequired + () }

team
  :: forall r
   . TeamInput
  -> SelectionSet Scope__Team r
  -> SelectionSet Scope__Organization (Maybe r)
team input = selectionForCompositeField
             "team"
             (toGraphQLArguments
              input)
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TeamsInputRowOptional r
  = ( privacy :: Optional TeamPrivacy
    , role :: Optional TeamRole
    , query :: Optional String
    , userLogins :: Optional (Array String)
    , orderBy :: Optional Examples.Github.InputObject.TeamOrder
    , ldapMapped :: Optional Boolean
    , rootTeamsOnly :: Optional Boolean
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type TeamsInput = { | TeamsInputRowOptional + () }

teams
  :: forall r
   . TeamsInput
  -> SelectionSet Scope__TeamConnection r
  -> SelectionSet Scope__Organization r
teams input = selectionForCompositeField
              "teams"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

teamsResourcePath :: SelectionSet Scope__Organization Uri
teamsResourcePath = selectionForField
                    "teamsResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

teamsUrl :: SelectionSet Scope__Organization Uri
teamsUrl = selectionForField "teamsUrl" [] graphqlDefaultResponseScalarDecoder

twitterUsername :: SelectionSet Scope__Organization (Maybe String)
twitterUsername = selectionForField
                  "twitterUsername"
                  []
                  graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Organization DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Organization Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanAdminister :: SelectionSet Scope__Organization Boolean
viewerCanAdminister = selectionForField
                      "viewerCanAdminister"
                      []
                      graphqlDefaultResponseScalarDecoder

viewerCanChangePinnedItems :: SelectionSet Scope__Organization Boolean
viewerCanChangePinnedItems = selectionForField
                             "viewerCanChangePinnedItems"
                             []
                             graphqlDefaultResponseScalarDecoder

viewerCanCreateProjects :: SelectionSet Scope__Organization Boolean
viewerCanCreateProjects = selectionForField
                          "viewerCanCreateProjects"
                          []
                          graphqlDefaultResponseScalarDecoder

viewerCanCreateRepositories :: SelectionSet Scope__Organization Boolean
viewerCanCreateRepositories = selectionForField
                              "viewerCanCreateRepositories"
                              []
                              graphqlDefaultResponseScalarDecoder

viewerCanCreateTeams :: SelectionSet Scope__Organization Boolean
viewerCanCreateTeams = selectionForField
                       "viewerCanCreateTeams"
                       []
                       graphqlDefaultResponseScalarDecoder

viewerCanSponsor :: SelectionSet Scope__Organization Boolean
viewerCanSponsor = selectionForField
                   "viewerCanSponsor"
                   []
                   graphqlDefaultResponseScalarDecoder

viewerIsAMember :: SelectionSet Scope__Organization Boolean
viewerIsAMember = selectionForField
                  "viewerIsAMember"
                  []
                  graphqlDefaultResponseScalarDecoder

viewerIsSponsoring :: SelectionSet Scope__Organization Boolean
viewerIsSponsoring = selectionForField
                     "viewerIsSponsoring"
                     []
                     graphqlDefaultResponseScalarDecoder

websiteUrl :: SelectionSet Scope__Organization (Maybe Uri)
websiteUrl = selectionForField
             "websiteUrl"
             []
             graphqlDefaultResponseScalarDecoder
