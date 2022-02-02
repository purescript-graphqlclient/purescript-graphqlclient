module Examples.Github.Object.EnterpriseOwnerInfo where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Enum.EnterpriseAdministratorRole
  (EnterpriseAdministratorRole)
import Examples.Github.InputObject
  ( EnterpriseMemberOrder
  , OrganizationOrder
  , VerifiableDomainOrder
  , EnterpriseServerInstallationOrder
  , IpAllowListEntryOrder
  , EnterpriseAdministratorInvitationOrder
  , RepositoryInvitationOrder
  ) as Examples.Github.InputObject
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__EnterpriseAdministratorConnection
  , Scope__EnterpriseOwnerInfo
  , Scope__UserConnection
  , Scope__OrganizationConnection
  , Scope__VerifiableDomainConnection
  , Scope__EnterpriseServerInstallationConnection
  , Scope__IpAllowListEntryConnection
  , Scope__OidcProvider
  , Scope__EnterpriseOutsideCollaboratorConnection
  , Scope__EnterpriseAdministratorInvitationConnection
  , Scope__RepositoryInvitationConnection
  , Scope__EnterprisePendingCollaboratorConnection
  , Scope__EnterprisePendingMemberInvitationConnection
  , Scope__EnterpriseIdentityProvider
  , Scope__EnterpriseMemberConnection
  )
import Examples.Github.Enum.EnterpriseEnabledDisabledSettingValue
  (EnterpriseEnabledDisabledSettingValue)
import Examples.Github.Enum.EnterpriseDefaultRepositoryPermissionSettingValue
  (EnterpriseDefaultRepositoryPermissionSettingValue)
import Examples.Github.Enum.DefaultRepositoryPermissionField
  (DefaultRepositoryPermissionField)
import Examples.Github.Enum.IpAllowListEnabledSettingValue
  (IpAllowListEnabledSettingValue)
import Examples.Github.Enum.IpAllowListForInstalledAppsEnabledSettingValue
  (IpAllowListForInstalledAppsEnabledSettingValue)
import Data.Maybe (Maybe)
import Examples.Github.Enum.EnterpriseMembersCanCreateRepositoriesSettingValue
  (EnterpriseMembersCanCreateRepositoriesSettingValue)
import Examples.Github.Enum.OrganizationMembersCanCreateRepositoriesSettingValue
  (OrganizationMembersCanCreateRepositoriesSettingValue)
import Examples.Github.Enum.EnterpriseMembersCanMakePurchasesSettingValue
  (EnterpriseMembersCanMakePurchasesSettingValue)
import Examples.Github.Enum.NotificationRestrictionSettingValue
  (NotificationRestrictionSettingValue)
import Examples.Github.Enum.RepositoryVisibility (RepositoryVisibility)
import Examples.Github.Enum.IdentityProviderConfigurationState
  (IdentityProviderConfigurationState)
import Examples.Github.Enum.EnterpriseEnabledSettingValue
  (EnterpriseEnabledSettingValue)

type AdminsInputRowOptional r
  = ( query :: Optional String
    , role :: Optional EnterpriseAdministratorRole
    , orderBy :: Optional Examples.Github.InputObject.EnterpriseMemberOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type AdminsInput = { | AdminsInputRowOptional + () }

admins
  :: forall r
   . AdminsInput
  -> SelectionSet Scope__EnterpriseAdministratorConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
admins input = selectionForCompositeField
               "admins"
               (toGraphQLArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AffiliatedUsersWithTwoFactorDisabledInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type AffiliatedUsersWithTwoFactorDisabledInput
  = { | AffiliatedUsersWithTwoFactorDisabledInputRowOptional + () }

affiliatedUsersWithTwoFactorDisabled
  :: forall r
   . AffiliatedUsersWithTwoFactorDisabledInput
  -> SelectionSet Scope__UserConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
affiliatedUsersWithTwoFactorDisabled input = selectionForCompositeField
                                             "affiliatedUsersWithTwoFactorDisabled"
                                             (toGraphQLArguments
                                              input)
                                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

affiliatedUsersWithTwoFactorDisabledExist
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     Boolean
affiliatedUsersWithTwoFactorDisabledExist = selectionForField
                                            "affiliatedUsersWithTwoFactorDisabledExist"
                                            []
                                            graphqlDefaultResponseScalarDecoder

allowPrivateRepositoryForkingSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseEnabledDisabledSettingValue
allowPrivateRepositoryForkingSetting = selectionForField
                                       "allowPrivateRepositoryForkingSetting"
                                       []
                                       graphqlDefaultResponseScalarDecoder

type AllowPrivateRepositoryForkingSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type AllowPrivateRepositoryForkingSettingOrganizationsInputRowRequired r
  = ( value :: Boolean | r )

type AllowPrivateRepositoryForkingSettingOrganizationsInput
  = { | AllowPrivateRepositoryForkingSettingOrganizationsInputRowOptional
      + AllowPrivateRepositoryForkingSettingOrganizationsInputRowRequired
      + ()
    }

allowPrivateRepositoryForkingSettingOrganizations
  :: forall r
   . AllowPrivateRepositoryForkingSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
allowPrivateRepositoryForkingSettingOrganizations input = selectionForCompositeField
                                                          "allowPrivateRepositoryForkingSettingOrganizations"
                                                          (toGraphQLArguments
                                                           input)
                                                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

defaultRepositoryPermissionSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseDefaultRepositoryPermissionSettingValue
defaultRepositoryPermissionSetting = selectionForField
                                     "defaultRepositoryPermissionSetting"
                                     []
                                     graphqlDefaultResponseScalarDecoder

type DefaultRepositoryPermissionSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type DefaultRepositoryPermissionSettingOrganizationsInputRowRequired r
  = ( value :: DefaultRepositoryPermissionField | r )

type DefaultRepositoryPermissionSettingOrganizationsInput
  = { | DefaultRepositoryPermissionSettingOrganizationsInputRowOptional
      + DefaultRepositoryPermissionSettingOrganizationsInputRowRequired
      + ()
    }

defaultRepositoryPermissionSettingOrganizations
  :: forall r
   . DefaultRepositoryPermissionSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
defaultRepositoryPermissionSettingOrganizations input = selectionForCompositeField
                                                        "defaultRepositoryPermissionSettingOrganizations"
                                                        (toGraphQLArguments
                                                         input)
                                                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

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
  -> SelectionSet Scope__EnterpriseOwnerInfo r
domains input = selectionForCompositeField
                "domains"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type EnterpriseServerInstallationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , connectedOnly :: Optional Boolean
    , orderBy
      :: Optional
         Examples.Github.InputObject.EnterpriseServerInstallationOrder
    | r
    )

type EnterpriseServerInstallationsInput
  = { | EnterpriseServerInstallationsInputRowOptional + () }

enterpriseServerInstallations
  :: forall r
   . EnterpriseServerInstallationsInput
  -> SelectionSet Scope__EnterpriseServerInstallationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
enterpriseServerInstallations input = selectionForCompositeField
                                      "enterpriseServerInstallations"
                                      (toGraphQLArguments
                                       input)
                                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ipAllowListEnabledSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
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
  -> SelectionSet Scope__EnterpriseOwnerInfo r
ipAllowListEntries input = selectionForCompositeField
                           "ipAllowListEntries"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

ipAllowListForInstalledAppsEnabledSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     IpAllowListForInstalledAppsEnabledSettingValue
ipAllowListForInstalledAppsEnabledSetting = selectionForField
                                            "ipAllowListForInstalledAppsEnabledSetting"
                                            []
                                            graphqlDefaultResponseScalarDecoder

isUpdatingDefaultRepositoryPermission
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     Boolean
isUpdatingDefaultRepositoryPermission = selectionForField
                                        "isUpdatingDefaultRepositoryPermission"
                                        []
                                        graphqlDefaultResponseScalarDecoder

isUpdatingTwoFactorRequirement
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     Boolean
isUpdatingTwoFactorRequirement = selectionForField
                                 "isUpdatingTwoFactorRequirement"
                                 []
                                 graphqlDefaultResponseScalarDecoder

membersCanChangeRepositoryVisibilitySetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseEnabledDisabledSettingValue
membersCanChangeRepositoryVisibilitySetting = selectionForField
                                              "membersCanChangeRepositoryVisibilitySetting"
                                              []
                                              graphqlDefaultResponseScalarDecoder

type MembersCanChangeRepositoryVisibilitySettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type MembersCanChangeRepositoryVisibilitySettingOrganizationsInputRowRequired r
  = ( value :: Boolean | r )

type MembersCanChangeRepositoryVisibilitySettingOrganizationsInput
  = { | MembersCanChangeRepositoryVisibilitySettingOrganizationsInputRowOptional
      + MembersCanChangeRepositoryVisibilitySettingOrganizationsInputRowRequired
      + ()
    }

membersCanChangeRepositoryVisibilitySettingOrganizations
  :: forall r
   . MembersCanChangeRepositoryVisibilitySettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanChangeRepositoryVisibilitySettingOrganizations input = selectionForCompositeField
                                                                 "membersCanChangeRepositoryVisibilitySettingOrganizations"
                                                                 (toGraphQLArguments
                                                                  input)
                                                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanCreateInternalRepositoriesSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     (Maybe Boolean)
membersCanCreateInternalRepositoriesSetting = selectionForField
                                              "membersCanCreateInternalRepositoriesSetting"
                                              []
                                              graphqlDefaultResponseScalarDecoder

membersCanCreatePrivateRepositoriesSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     (Maybe Boolean)
membersCanCreatePrivateRepositoriesSetting = selectionForField
                                             "membersCanCreatePrivateRepositoriesSetting"
                                             []
                                             graphqlDefaultResponseScalarDecoder

membersCanCreatePublicRepositoriesSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     (Maybe Boolean)
membersCanCreatePublicRepositoriesSetting = selectionForField
                                            "membersCanCreatePublicRepositoriesSetting"
                                            []
                                            graphqlDefaultResponseScalarDecoder

membersCanCreateRepositoriesSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     (Maybe EnterpriseMembersCanCreateRepositoriesSettingValue)
membersCanCreateRepositoriesSetting = selectionForField
                                      "membersCanCreateRepositoriesSetting"
                                      []
                                      graphqlDefaultResponseScalarDecoder

type MembersCanCreateRepositoriesSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type MembersCanCreateRepositoriesSettingOrganizationsInputRowRequired r
  = ( value :: OrganizationMembersCanCreateRepositoriesSettingValue | r )

type MembersCanCreateRepositoriesSettingOrganizationsInput
  = { | MembersCanCreateRepositoriesSettingOrganizationsInputRowOptional
      + MembersCanCreateRepositoriesSettingOrganizationsInputRowRequired
      + ()
    }

membersCanCreateRepositoriesSettingOrganizations
  :: forall r
   . MembersCanCreateRepositoriesSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanCreateRepositoriesSettingOrganizations input = selectionForCompositeField
                                                         "membersCanCreateRepositoriesSettingOrganizations"
                                                         (toGraphQLArguments
                                                          input)
                                                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanDeleteIssuesSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseEnabledDisabledSettingValue
membersCanDeleteIssuesSetting = selectionForField
                                "membersCanDeleteIssuesSetting"
                                []
                                graphqlDefaultResponseScalarDecoder

type MembersCanDeleteIssuesSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type MembersCanDeleteIssuesSettingOrganizationsInputRowRequired r
  = ( value :: Boolean | r )

type MembersCanDeleteIssuesSettingOrganizationsInput
  = { | MembersCanDeleteIssuesSettingOrganizationsInputRowOptional
      + MembersCanDeleteIssuesSettingOrganizationsInputRowRequired
      + ()
    }

membersCanDeleteIssuesSettingOrganizations
  :: forall r
   . MembersCanDeleteIssuesSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanDeleteIssuesSettingOrganizations input = selectionForCompositeField
                                                   "membersCanDeleteIssuesSettingOrganizations"
                                                   (toGraphQLArguments
                                                    input)
                                                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanDeleteRepositoriesSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseEnabledDisabledSettingValue
membersCanDeleteRepositoriesSetting = selectionForField
                                      "membersCanDeleteRepositoriesSetting"
                                      []
                                      graphqlDefaultResponseScalarDecoder

type MembersCanDeleteRepositoriesSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type MembersCanDeleteRepositoriesSettingOrganizationsInputRowRequired r
  = ( value :: Boolean | r )

type MembersCanDeleteRepositoriesSettingOrganizationsInput
  = { | MembersCanDeleteRepositoriesSettingOrganizationsInputRowOptional
      + MembersCanDeleteRepositoriesSettingOrganizationsInputRowRequired
      + ()
    }

membersCanDeleteRepositoriesSettingOrganizations
  :: forall r
   . MembersCanDeleteRepositoriesSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanDeleteRepositoriesSettingOrganizations input = selectionForCompositeField
                                                         "membersCanDeleteRepositoriesSettingOrganizations"
                                                         (toGraphQLArguments
                                                          input)
                                                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanInviteCollaboratorsSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseEnabledDisabledSettingValue
membersCanInviteCollaboratorsSetting = selectionForField
                                       "membersCanInviteCollaboratorsSetting"
                                       []
                                       graphqlDefaultResponseScalarDecoder

type MembersCanInviteCollaboratorsSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type MembersCanInviteCollaboratorsSettingOrganizationsInputRowRequired r
  = ( value :: Boolean | r )

type MembersCanInviteCollaboratorsSettingOrganizationsInput
  = { | MembersCanInviteCollaboratorsSettingOrganizationsInputRowOptional
      + MembersCanInviteCollaboratorsSettingOrganizationsInputRowRequired
      + ()
    }

membersCanInviteCollaboratorsSettingOrganizations
  :: forall r
   . MembersCanInviteCollaboratorsSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanInviteCollaboratorsSettingOrganizations input = selectionForCompositeField
                                                          "membersCanInviteCollaboratorsSettingOrganizations"
                                                          (toGraphQLArguments
                                                           input)
                                                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanMakePurchasesSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseMembersCanMakePurchasesSettingValue
membersCanMakePurchasesSetting = selectionForField
                                 "membersCanMakePurchasesSetting"
                                 []
                                 graphqlDefaultResponseScalarDecoder

membersCanUpdateProtectedBranchesSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseEnabledDisabledSettingValue
membersCanUpdateProtectedBranchesSetting = selectionForField
                                           "membersCanUpdateProtectedBranchesSetting"
                                           []
                                           graphqlDefaultResponseScalarDecoder

type MembersCanUpdateProtectedBranchesSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type MembersCanUpdateProtectedBranchesSettingOrganizationsInputRowRequired r
  = ( value :: Boolean | r )

type MembersCanUpdateProtectedBranchesSettingOrganizationsInput
  = { | MembersCanUpdateProtectedBranchesSettingOrganizationsInputRowOptional
      + MembersCanUpdateProtectedBranchesSettingOrganizationsInputRowRequired
      + ()
    }

membersCanUpdateProtectedBranchesSettingOrganizations
  :: forall r
   . MembersCanUpdateProtectedBranchesSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanUpdateProtectedBranchesSettingOrganizations input = selectionForCompositeField
                                                              "membersCanUpdateProtectedBranchesSettingOrganizations"
                                                              (toGraphQLArguments
                                                               input)
                                                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersCanViewDependencyInsightsSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseEnabledDisabledSettingValue
membersCanViewDependencyInsightsSetting = selectionForField
                                          "membersCanViewDependencyInsightsSetting"
                                          []
                                          graphqlDefaultResponseScalarDecoder

type MembersCanViewDependencyInsightsSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type MembersCanViewDependencyInsightsSettingOrganizationsInputRowRequired r
  = ( value :: Boolean | r )

type MembersCanViewDependencyInsightsSettingOrganizationsInput
  = { | MembersCanViewDependencyInsightsSettingOrganizationsInputRowOptional
      + MembersCanViewDependencyInsightsSettingOrganizationsInputRowRequired
      + ()
    }

membersCanViewDependencyInsightsSettingOrganizations
  :: forall r
   . MembersCanViewDependencyInsightsSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
membersCanViewDependencyInsightsSettingOrganizations input = selectionForCompositeField
                                                             "membersCanViewDependencyInsightsSettingOrganizations"
                                                             (toGraphQLArguments
                                                              input)
                                                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

notificationDeliveryRestrictionEnabledSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     NotificationRestrictionSettingValue
notificationDeliveryRestrictionEnabledSetting = selectionForField
                                                "notificationDeliveryRestrictionEnabledSetting"
                                                []
                                                graphqlDefaultResponseScalarDecoder

oidcProvider
  :: forall r
   . SelectionSet Scope__OidcProvider r
  -> SelectionSet Scope__EnterpriseOwnerInfo (Maybe r)
oidcProvider = selectionForCompositeField
               "oidcProvider"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationProjectsSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseEnabledDisabledSettingValue
organizationProjectsSetting = selectionForField
                              "organizationProjectsSetting"
                              []
                              graphqlDefaultResponseScalarDecoder

type OrganizationProjectsSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type OrganizationProjectsSettingOrganizationsInputRowRequired r
  = ( value :: Boolean | r )

type OrganizationProjectsSettingOrganizationsInput
  = { | OrganizationProjectsSettingOrganizationsInputRowOptional
      + OrganizationProjectsSettingOrganizationsInputRowRequired
      + ()
    }

organizationProjectsSettingOrganizations
  :: forall r
   . OrganizationProjectsSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
organizationProjectsSettingOrganizations input = selectionForCompositeField
                                                 "organizationProjectsSettingOrganizations"
                                                 (toGraphQLArguments
                                                  input)
                                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type OutsideCollaboratorsInputRowOptional r
  = ( login :: Optional String
    , query :: Optional String
    , orderBy :: Optional Examples.Github.InputObject.EnterpriseMemberOrder
    , visibility :: Optional RepositoryVisibility
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type OutsideCollaboratorsInput = { | OutsideCollaboratorsInputRowOptional + () }

outsideCollaborators
  :: forall r
   . OutsideCollaboratorsInput
  -> SelectionSet Scope__EnterpriseOutsideCollaboratorConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
outsideCollaborators input = selectionForCompositeField
                             "outsideCollaborators"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingAdminInvitationsInputRowOptional r
  = ( query :: Optional String
    , orderBy
      :: Optional
         Examples.Github.InputObject.EnterpriseAdministratorInvitationOrder
    , role :: Optional EnterpriseAdministratorRole
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type PendingAdminInvitationsInput
  = { | PendingAdminInvitationsInputRowOptional + () }

pendingAdminInvitations
  :: forall r
   . PendingAdminInvitationsInput
  -> SelectionSet Scope__EnterpriseAdministratorInvitationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
pendingAdminInvitations input = selectionForCompositeField
                                "pendingAdminInvitations"
                                (toGraphQLArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingCollaboratorInvitationsInputRowOptional r
  = ( query :: Optional String
    , orderBy :: Optional Examples.Github.InputObject.RepositoryInvitationOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type PendingCollaboratorInvitationsInput
  = { | PendingCollaboratorInvitationsInputRowOptional + () }

pendingCollaboratorInvitations
  :: forall r
   . PendingCollaboratorInvitationsInput
  -> SelectionSet Scope__RepositoryInvitationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
pendingCollaboratorInvitations input = selectionForCompositeField
                                       "pendingCollaboratorInvitations"
                                       (toGraphQLArguments
                                        input)
                                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingCollaboratorsInputRowOptional r
  = ( query :: Optional String
    , orderBy :: Optional Examples.Github.InputObject.RepositoryInvitationOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type PendingCollaboratorsInput = { | PendingCollaboratorsInputRowOptional + () }

pendingCollaborators
  :: forall r
   . PendingCollaboratorsInput
  -> SelectionSet Scope__EnterprisePendingCollaboratorConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
pendingCollaborators input = selectionForCompositeField
                             "pendingCollaborators"
                             (toGraphQLArguments
                              input)
                             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PendingMemberInvitationsInputRowOptional r
  = ( query :: Optional String
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type PendingMemberInvitationsInput
  = { | PendingMemberInvitationsInputRowOptional + () }

pendingMemberInvitations
  :: forall r
   . PendingMemberInvitationsInput
  -> SelectionSet Scope__EnterprisePendingMemberInvitationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
pendingMemberInvitations input = selectionForCompositeField
                                 "pendingMemberInvitations"
                                 (toGraphQLArguments
                                  input)
                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryProjectsSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseEnabledDisabledSettingValue
repositoryProjectsSetting = selectionForField
                            "repositoryProjectsSetting"
                            []
                            graphqlDefaultResponseScalarDecoder

type RepositoryProjectsSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type RepositoryProjectsSettingOrganizationsInputRowRequired r
  = ( value :: Boolean | r )

type RepositoryProjectsSettingOrganizationsInput
  = { | RepositoryProjectsSettingOrganizationsInputRowOptional
      + RepositoryProjectsSettingOrganizationsInputRowRequired
      + ()
    }

repositoryProjectsSettingOrganizations
  :: forall r
   . RepositoryProjectsSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
repositoryProjectsSettingOrganizations input = selectionForCompositeField
                                               "repositoryProjectsSettingOrganizations"
                                               (toGraphQLArguments
                                                input)
                                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

samlIdentityProvider
  :: forall r
   . SelectionSet Scope__EnterpriseIdentityProvider r
  -> SelectionSet Scope__EnterpriseOwnerInfo (Maybe r)
samlIdentityProvider = selectionForCompositeField
                       "samlIdentityProvider"
                       []
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SamlIdentityProviderSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type SamlIdentityProviderSettingOrganizationsInputRowRequired r
  = ( value :: IdentityProviderConfigurationState | r )

type SamlIdentityProviderSettingOrganizationsInput
  = { | SamlIdentityProviderSettingOrganizationsInputRowOptional
      + SamlIdentityProviderSettingOrganizationsInputRowRequired
      + ()
    }

samlIdentityProviderSettingOrganizations
  :: forall r
   . SamlIdentityProviderSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
samlIdentityProviderSettingOrganizations input = selectionForCompositeField
                                                 "samlIdentityProviderSettingOrganizations"
                                                 (toGraphQLArguments
                                                  input)
                                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SupportEntitlementsInputRowOptional r
  = ( orderBy :: Optional Examples.Github.InputObject.EnterpriseMemberOrder
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type SupportEntitlementsInput = { | SupportEntitlementsInputRowOptional + () }

supportEntitlements
  :: forall r
   . SupportEntitlementsInput
  -> SelectionSet Scope__EnterpriseMemberConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
supportEntitlements input = selectionForCompositeField
                            "supportEntitlements"
                            (toGraphQLArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

teamDiscussionsSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseEnabledDisabledSettingValue
teamDiscussionsSetting = selectionForField
                         "teamDiscussionsSetting"
                         []
                         graphqlDefaultResponseScalarDecoder

type TeamDiscussionsSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type TeamDiscussionsSettingOrganizationsInputRowRequired r
  = ( value :: Boolean | r )

type TeamDiscussionsSettingOrganizationsInput
  = { | TeamDiscussionsSettingOrganizationsInputRowOptional
      + TeamDiscussionsSettingOrganizationsInputRowRequired
      + ()
    }

teamDiscussionsSettingOrganizations
  :: forall r
   . TeamDiscussionsSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
teamDiscussionsSettingOrganizations input = selectionForCompositeField
                                            "teamDiscussionsSettingOrganizations"
                                            (toGraphQLArguments
                                             input)
                                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

twoFactorRequiredSetting
  :: SelectionSet
     Scope__EnterpriseOwnerInfo
     EnterpriseEnabledSettingValue
twoFactorRequiredSetting = selectionForField
                           "twoFactorRequiredSetting"
                           []
                           graphqlDefaultResponseScalarDecoder

type TwoFactorRequiredSettingOrganizationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.OrganizationOrder
    | r
    )

type TwoFactorRequiredSettingOrganizationsInputRowRequired r
  = ( value :: Boolean | r )

type TwoFactorRequiredSettingOrganizationsInput
  = { | TwoFactorRequiredSettingOrganizationsInputRowOptional
      + TwoFactorRequiredSettingOrganizationsInputRowRequired
      + ()
    }

twoFactorRequiredSettingOrganizations
  :: forall r
   . TwoFactorRequiredSettingOrganizationsInput
  -> SelectionSet Scope__OrganizationConnection r
  -> SelectionSet Scope__EnterpriseOwnerInfo r
twoFactorRequiredSettingOrganizations input = selectionForCompositeField
                                              "twoFactorRequiredSettingOrganizations"
                                              (toGraphQLArguments
                                               input)
                                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
