module Examples.Github.Object.OrgUpdateMemberRepositoryInvitationPermissionAuditEntry where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Examples.Github.Enum.OperationType (OperationType)

action
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor
  :: forall r
   . SelectionSet Scope__AuditEntryActor r
  -> SelectionSet
        Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
        (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation
  :: forall r
   . SelectionSet Scope__ActorLocation r
  -> SelectionSet
        Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
        (Maybe r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

canInviteOutsideCollaboratorsToRepositories
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe Boolean)
canInviteOutsideCollaboratorsToRepositories = selectionForField
                                              "canInviteOutsideCollaboratorsToRepositories"
                                              []
                                              graphqlDefaultResponseScalarDecoder

createdAt
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet
        Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
        (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet
        Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
        (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl
  :: SelectionSet
     Scope__OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
     (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
