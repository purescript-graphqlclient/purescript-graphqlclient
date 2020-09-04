module Examples.Github.Object.TeamChangeParentTeamAuditEntry where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__TeamChangeParentTeamAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__Team
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

action :: SelectionSet Scope__TeamChangeParentTeamAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet Scope__AuditEntryActor r -> SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet Scope__ActorLocation r -> SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe r)
actorLocation = selectionForCompositeField "actorLocation" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe String)
actorLogin = selectionForField "actorLogin" [] graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
actorResourcePath = selectionForField "actorResourcePath" [] graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__TeamChangeParentTeamAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__TeamChangeParentTeamAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isLdapMapped :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Boolean)
isLdapMapped = selectionForField "isLdapMapped" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe OperationType)
operationType = selectionForField "operationType" [] graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe r)
organization = selectionForCompositeField "organization" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe String)
organizationName = selectionForField "organizationName" [] graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
organizationResourcePath = selectionForField "organizationResourcePath" [] graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
organizationUrl = selectionForField "organizationUrl" [] graphqlDefaultResponseScalarDecoder

parentTeam :: forall r . SelectionSet Scope__Team r -> SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe r)
parentTeam = selectionForCompositeField "parentTeam" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

parentTeamName :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe String)
parentTeamName = selectionForField "parentTeamName" [] graphqlDefaultResponseScalarDecoder

parentTeamNameWas :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe String)
parentTeamNameWas = selectionForField "parentTeamNameWas" [] graphqlDefaultResponseScalarDecoder

parentTeamResourcePath :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
parentTeamResourcePath = selectionForField "parentTeamResourcePath" [] graphqlDefaultResponseScalarDecoder

parentTeamUrl :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
parentTeamUrl = selectionForField "parentTeamUrl" [] graphqlDefaultResponseScalarDecoder

parentTeamWas :: forall r . SelectionSet Scope__Team r -> SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe r)
parentTeamWas = selectionForCompositeField "parentTeamWas" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

parentTeamWasResourcePath :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
parentTeamWasResourcePath = selectionForField "parentTeamWasResourcePath" [] graphqlDefaultResponseScalarDecoder

parentTeamWasUrl :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
parentTeamWasUrl = selectionForField "parentTeamWasUrl" [] graphqlDefaultResponseScalarDecoder

team :: forall r . SelectionSet Scope__Team r -> SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe r)
team = selectionForCompositeField "team" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

teamName :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe String)
teamName = selectionForField "teamName" [] graphqlDefaultResponseScalarDecoder

teamResourcePath :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
teamResourcePath = selectionForField "teamResourcePath" [] graphqlDefaultResponseScalarDecoder

teamUrl :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
teamUrl = selectionForField "teamUrl" [] graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe r)
user = selectionForCompositeField "user" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
userResourcePath = selectionForField "userResourcePath" [] graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__TeamChangeParentTeamAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
