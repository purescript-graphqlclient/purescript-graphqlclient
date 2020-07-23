module Examples.Github.Object.OrgUnblockUserAuditEntry where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrgUnblockUserAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__User
  , Scope__Organization
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

action :: SelectionSet Scope__OrgUnblockUserAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet Scope__AuditEntryActor r -> SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet Scope__ActorLocation r -> SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe r)
actorLocation = selectionForCompositeField "actorLocation" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe String)
actorLogin = selectionForField "actorLogin" [] graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe Uri)
actorResourcePath = selectionForField "actorResourcePath" [] graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

blockedUser :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe r)
blockedUser = selectionForCompositeField "blockedUser" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

blockedUserName :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe String)
blockedUserName = selectionForField "blockedUserName" [] graphqlDefaultResponseScalarDecoder

blockedUserResourcePath :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe Uri)
blockedUserResourcePath = selectionForField "blockedUserResourcePath" [] graphqlDefaultResponseScalarDecoder

blockedUserUrl :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe Uri)
blockedUserUrl = selectionForField "blockedUserUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__OrgUnblockUserAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrgUnblockUserAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe OperationType)
operationType = selectionForField "operationType" [] graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe r)
organization = selectionForCompositeField "organization" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe String)
organizationName = selectionForField "organizationName" [] graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe Uri)
organizationResourcePath = selectionForField "organizationResourcePath" [] graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe Uri)
organizationUrl = selectionForField "organizationUrl" [] graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe r)
user = selectionForCompositeField "user" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe Uri)
userResourcePath = selectionForField "userResourcePath" [] graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__OrgUnblockUserAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
