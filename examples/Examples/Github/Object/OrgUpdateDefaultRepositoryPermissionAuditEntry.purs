module Examples.Github.Object.OrgUpdateDefaultRepositoryPermissionAuditEntry where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Examples.Github.Enum.OperationType (OperationType)
import Examples.Github.Enum.OrgUpdateDefaultRepositoryPermissionAuditEntryPermission
  (OrgUpdateDefaultRepositoryPermissionAuditEntryPermission)

action
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor
  :: forall r
   . SelectionSet Scope__AuditEntryActor r
  -> SelectionSet
        Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
        (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation
  :: forall r
   . SelectionSet Scope__ActorLocation r
  -> SelectionSet
        Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
        (Maybe r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet
        Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
        (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

permission
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe OrgUpdateDefaultRepositoryPermissionAuditEntryPermission)
permission = selectionForField
             "permission"
             []
             graphqlDefaultResponseScalarDecoder

permissionWas
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe OrgUpdateDefaultRepositoryPermissionAuditEntryPermission)
permissionWas = selectionForField
                "permissionWas"
                []
                graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet
        Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
        (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl
  :: SelectionSet
     Scope__OrgUpdateDefaultRepositoryPermissionAuditEntry
     (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
