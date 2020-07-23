module Examples.Github.Object.OrgUpdateMemberAuditEntry where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrgUpdateMemberAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( Uri
  , PreciseDateTime
  , Id
  )
import Examples.Github.Enum.OperationType
  ( OperationType
  )
import Examples.Github.Enum.OrgUpdateMemberAuditEntryPermission
  ( OrgUpdateMemberAuditEntryPermission
  )

action :: SelectionSet Scope__OrgUpdateMemberAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet Scope__AuditEntryActor r -> SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet Scope__ActorLocation r -> SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe r)
actorLocation = selectionForCompositeField "actorLocation" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe String)
actorLogin = selectionForField "actorLogin" [] graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe Uri)
actorResourcePath = selectionForField "actorResourcePath" [] graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__OrgUpdateMemberAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrgUpdateMemberAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe OperationType)
operationType = selectionForField "operationType" [] graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe r)
organization = selectionForCompositeField "organization" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe String)
organizationName = selectionForField "organizationName" [] graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe Uri)
organizationResourcePath = selectionForField "organizationResourcePath" [] graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe Uri)
organizationUrl = selectionForField "organizationUrl" [] graphqlDefaultResponseScalarDecoder

permission :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe OrgUpdateMemberAuditEntryPermission)
permission = selectionForField "permission" [] graphqlDefaultResponseScalarDecoder

permissionWas :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe OrgUpdateMemberAuditEntryPermission)
permissionWas = selectionForField "permissionWas" [] graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe r)
user = selectionForCompositeField "user" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe Uri)
userResourcePath = selectionForField "userResourcePath" [] graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__OrgUpdateMemberAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
