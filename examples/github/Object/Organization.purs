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
  , Scope__IpAllowListEntryConnection
  , Scope__ProfileItemShowcase
  , Scope__UserStatusConnection
  , Scope__OrganizationMemberConnection
  , Scope__PackageConnection
  , Scope__UserConnection
  , Scope__PinnableItemConnection
  , Scope__Project
  , Scope__ProjectConnection
  , Scope__RepositoryConnection
  , Scope__Repository
  , Scope__OrganizationIdentityProvider
  , Scope__SponsorsListing
  , Scope__SponsorshipConnection
  , Scope__Team
  , Scope__TeamConnection
  )
import Examples.Github.InputObject
  ( AuditLogOrder
  , IpAllowListEntryOrder
  , UserStatusOrder
  , PackageOrder
  , ProjectOrder
  , RepositoryOrder
  , SponsorshipOrder
  , TeamOrder
  ) as Examples.Github.InputObject
import Examples.Github.Scalars (Uri, DateTime, Id)
import Data.Maybe (Maybe)
import Examples.Github.Enum.IpAllowListEnabledSettingValue
  (IpAllowListEnabledSettingValue)
import Examples.Github.Enum.PackageType (PackageType)
import Examples.Github.Enum.ProjectState (ProjectState)
import Examples.Github.Enum.RepositoryPrivacy (RepositoryPrivacy)
import Examples.Github.Enum.RepositoryAffiliation (RepositoryAffiliation)
import Examples.Github.Enum.TeamPrivacy (TeamPrivacy)
import Examples.Github.Enum.TeamRole (TeamRole)

type AnyPinnableItemsInputRowOptional r = ( "type" :: Optional PinnableItemType
                                          | r
                                          )

type AnyPinnableItemsInput = { | AnyPinnableItemsInputRowOptional + () }

anyPinnableItems :: AnyPinnableItemsInput -> SelectionSet
                                             Scope__Organization
                                             Boolean
anyPinnableItems input = selectionForField
                         "anyPinnableItems"
                         (toGraphQLArguments
                          input)
                         graphqlDefaultResponseScalarDecoder

type AuditLogInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  , query :: Optional String
                                  , orderBy :: Optional
                                               Examples.Github.InputObject.AuditLogOrder
                                  | r
                                  )

type AuditLogInput = { | AuditLogInputRowOptional + () }

auditLog :: forall r . AuditLogInput -> SelectionSet
                                        Scope__OrganizationAuditEntryConnection
                                        r -> SelectionSet
                                             Scope__Organization
                                             r
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

email :: SelectionSet Scope__Organization (Maybe String)
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Organization Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

ipAllowListEnabledSetting :: SelectionSet
                             Scope__Organization
                             IpAllowListEnabledSettingValue
ipAllowListEnabledSetting = selectionForField
                            "ipAllowListEnabledSetting"
                            []
                            graphqlDefaultResponseScalarDecoder

type IpAllowListEntriesInputRowOptional r = ( after :: Optional String
                                            , before :: Optional String
                                            , first :: Optional Int
                                            , last :: Optional Int
                                            , orderBy :: Optional
                                                         Examples.Github.InputObject.IpAllowListEntryOrder
                                            | r
                                            )

type IpAllowListEntriesInput = { | IpAllowListEntriesInputRowOptional + () }

ipAllowListEntries :: forall r . IpAllowListEntriesInput -> SelectionSet
                                                            Scope__IpAllowListEntryConnection
                                                            r -> SelectionSet
                                                                 Scope__Organization
                                                                 r
ipAllowListEntries input = selectionForCompositeField
                           "ipAllowListEntries"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

isVerified :: SelectionSet Scope__Organization Boolean
isVerified = selectionForField
             "isVerified"
             []
             graphqlDefaultResponseScalarDecoder

itemShowcase :: forall r . SelectionSet
                           Scope__ProfileItemShowcase
                           r -> SelectionSet
                                Scope__Organization
                                r
itemShowcase = selectionForCompositeField
               "itemShowcase"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

location :: SelectionSet Scope__Organization (Maybe String)
location = selectionForField "location" [] graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__Organization String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

type MemberStatusesInputRowOptional r = ( after :: Optional String
                                        , before :: Optional String
                                        , first :: Optional Int
                                        , last :: Optional Int
                                        , orderBy :: Optional
                                                     Examples.Github.InputObject.UserStatusOrder
                                        | r
                                        )

type MemberStatusesInput = { | MemberStatusesInputRowOptional + () }

memberStatuses :: forall r . MemberStatusesInput -> SelectionSet
                                                    Scope__UserStatusConnection
                                                    r -> SelectionSet
                                                         Scope__Organization
                                                         r
memberStatuses input = selectionForCompositeField
                       "memberStatuses"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MembersWithRoleInputRowOptional r = ( after :: Optional String
                                         , before :: Optional String
                                         , first :: Optional Int
                                         , last :: Optional Int
                                         | r
                                         )

type MembersWithRoleInput = { | MembersWithRoleInputRowOptional + () }

membersWithRole :: forall r . MembersWithRoleInput -> SelectionSet
                                                      Scope__OrganizationMemberConnection
                                                      r -> SelectionSet
                                                           Scope__Organization
                                                           r
membersWithRole input = selectionForCompositeField
                        "membersWithRole"
                        (toGraphQLArguments
                         input)
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

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

organizationBillingEmail :: SelectionSet Scope__Organization (Maybe String)
organizationBillingEmail = selectionForField
                           "organizationBillingEmail"
                           []
                           graphqlDefaultResponseScalarDecoder

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
                                             Scope__Organization
                                             r
packages input = selectionForCompositeField
                 "packages"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingMembersInputRowOptional r = ( after :: Optional String
                                        , before :: Optional String
                                        , first :: Optional Int
                                        , last :: Optional Int
                                        | r
                                        )

type PendingMembersInput = { | PendingMembersInputRowOptional + () }

pendingMembers :: forall r . PendingMembersInput -> SelectionSet
                                                    Scope__UserConnection
                                                    r -> SelectionSet
                                                         Scope__Organization
                                                         r
pendingMembers input = selectionForCompositeField
                       "pendingMembers"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinnableItemsInputRowOptional r = ( types :: Optional
                                                  (Array
                                                   PinnableItemType)
                                       , after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type PinnableItemsInput = { | PinnableItemsInputRowOptional + () }

pinnableItems :: forall r . PinnableItemsInput -> SelectionSet
                                                  Scope__PinnableItemConnection
                                                  r -> SelectionSet
                                                       Scope__Organization
                                                       r
pinnableItems input = selectionForCompositeField
                      "pinnableItems"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinnedItemsInputRowOptional r = ( types :: Optional
                                                (Array
                                                 PinnableItemType)
                                     , after :: Optional String
                                     , before :: Optional String
                                     , first :: Optional Int
                                     , last :: Optional Int
                                     | r
                                     )

type PinnedItemsInput = { | PinnedItemsInputRowOptional + () }

pinnedItems :: forall r . PinnedItemsInput -> SelectionSet
                                              Scope__PinnableItemConnection
                                              r -> SelectionSet
                                                   Scope__Organization
                                                   r
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

project :: forall r . ProjectInput -> SelectionSet
                                      Scope__Project
                                      r -> SelectionSet
                                           Scope__Organization
                                           (Maybe
                                            r)
project input = selectionForCompositeField
                "project"
                (toGraphQLArguments
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
                                             Scope__Organization
                                             r
projects input = selectionForCompositeField
                 "projects"
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

type RepositoriesInputRowOptional r = ( privacy :: Optional RepositoryPrivacy
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
                                      , isFork :: Optional Boolean
                                      | r
                                      )

type RepositoriesInput = { | RepositoriesInputRowOptional + () }

repositories :: forall r . RepositoriesInput -> SelectionSet
                                                Scope__RepositoryConnection
                                                r -> SelectionSet
                                                     Scope__Organization
                                                     r
repositories input = selectionForCompositeField
                     "repositories"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryInputRowRequired r = ( name :: String | r )

type RepositoryInput = { | RepositoryInputRowRequired + () }

repository :: forall r . RepositoryInput -> SelectionSet
                                            Scope__Repository
                                            r -> SelectionSet
                                                 Scope__Organization
                                                 (Maybe
                                                  r)
repository input = selectionForCompositeField
                   "repository"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

requiresTwoFactorAuthentication :: SelectionSet
                                   Scope__Organization
                                   (Maybe
                                    Boolean)
requiresTwoFactorAuthentication = selectionForField
                                  "requiresTwoFactorAuthentication"
                                  []
                                  graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__Organization Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

samlIdentityProvider :: forall r . SelectionSet
                                   Scope__OrganizationIdentityProvider
                                   r -> SelectionSet
                                        Scope__Organization
                                        (Maybe
                                         r)
samlIdentityProvider = selectionForCompositeField
                       "samlIdentityProvider"
                       []
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

sponsorsListing :: forall r . SelectionSet
                              Scope__SponsorsListing
                              r -> SelectionSet
                                   Scope__Organization
                                   (Maybe
                                    r)
sponsorsListing = selectionForCompositeField
                  "sponsorsListing"
                  []
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsMaintainerInputRowOptional r = ( after :: Optional String
                                                  , before :: Optional String
                                                  , first :: Optional Int
                                                  , last :: Optional Int
                                                  , includePrivate :: Optional
                                                                      Boolean
                                                  , orderBy :: Optional
                                                               Examples.Github.InputObject.SponsorshipOrder
                                                  | r
                                                  )

type SponsorshipsAsMaintainerInput = {
| SponsorshipsAsMaintainerInputRowOptional + ()
}

sponsorshipsAsMaintainer :: forall r . SponsorshipsAsMaintainerInput -> SelectionSet
                                                                        Scope__SponsorshipConnection
                                                                        r -> SelectionSet
                                                                             Scope__Organization
                                                                             r
sponsorshipsAsMaintainer input = selectionForCompositeField
                                 "sponsorshipsAsMaintainer"
                                 (toGraphQLArguments
                                  input)
                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorshipsAsSponsorInputRowOptional r = ( after :: Optional String
                                               , before :: Optional String
                                               , first :: Optional Int
                                               , last :: Optional Int
                                               , orderBy :: Optional
                                                            Examples.Github.InputObject.SponsorshipOrder
                                               | r
                                               )

type SponsorshipsAsSponsorInput = {
| SponsorshipsAsSponsorInputRowOptional + ()
}

sponsorshipsAsSponsor :: forall r . SponsorshipsAsSponsorInput -> SelectionSet
                                                                  Scope__SponsorshipConnection
                                                                  r -> SelectionSet
                                                                       Scope__Organization
                                                                       r
sponsorshipsAsSponsor input = selectionForCompositeField
                              "sponsorshipsAsSponsor"
                              (toGraphQLArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TeamInputRowRequired r = ( slug :: String | r )

type TeamInput = { | TeamInputRowRequired + () }

team :: forall r . TeamInput -> SelectionSet
                                Scope__Team
                                r -> SelectionSet
                                     Scope__Organization
                                     (Maybe
                                      r)
team input = selectionForCompositeField
             "team"
             (toGraphQLArguments
              input)
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TeamsInputRowOptional r = ( privacy :: Optional TeamPrivacy
                               , role :: Optional TeamRole
                               , query :: Optional String
                               , userLogins :: Optional (Array String)
                               , orderBy :: Optional
                                            Examples.Github.InputObject.TeamOrder
                               , ldapMapped :: Optional Boolean
                               , rootTeamsOnly :: Optional Boolean
                               , after :: Optional String
                               , before :: Optional String
                               , first :: Optional Int
                               , last :: Optional Int
                               | r
                               )

type TeamsInput = { | TeamsInputRowOptional + () }

teams :: forall r . TeamsInput -> SelectionSet
                                  Scope__TeamConnection
                                  r -> SelectionSet
                                       Scope__Organization
                                       r
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

viewerIsAMember :: SelectionSet Scope__Organization Boolean
viewerIsAMember = selectionForField
                  "viewerIsAMember"
                  []
                  graphqlDefaultResponseScalarDecoder

websiteUrl :: SelectionSet Scope__Organization (Maybe Uri)
websiteUrl = selectionForField
             "websiteUrl"
             []
             graphqlDefaultResponseScalarDecoder
