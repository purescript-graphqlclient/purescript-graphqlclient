module Examples.Github.Object.TeamAddRepositoryAuditEntry where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__TeamAddRepositoryAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__Repository
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

action :: SelectionSet Scope__TeamAddRepositoryAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet Scope__AuditEntryActor r -> SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet Scope__ActorLocation r -> SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe r)
actorLocation = selectionForCompositeField "actorLocation" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe String)
actorLogin = selectionForField "actorLogin" [] graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe Uri)
actorResourcePath = selectionForField "actorResourcePath" [] graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__TeamAddRepositoryAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__TeamAddRepositoryAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isLdapMapped :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe Boolean)
isLdapMapped = selectionForField "isLdapMapped" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe OperationType)
operationType = selectionForField "operationType" [] graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet Scope__Organization r -> SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe r)
organization = selectionForCompositeField "organization" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe String)
organizationName = selectionForField "organizationName" [] graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe Uri)
organizationResourcePath = selectionForField "organizationResourcePath" [] graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe Uri)
organizationUrl = selectionForField "organizationUrl" [] graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe r)
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryName :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe String)
repositoryName = selectionForField "repositoryName" [] graphqlDefaultResponseScalarDecoder

repositoryResourcePath :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe Uri)
repositoryResourcePath = selectionForField "repositoryResourcePath" [] graphqlDefaultResponseScalarDecoder

repositoryUrl :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe Uri)
repositoryUrl = selectionForField "repositoryUrl" [] graphqlDefaultResponseScalarDecoder

team :: forall r . SelectionSet Scope__Team r -> SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe r)
team = selectionForCompositeField "team" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

teamName :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe String)
teamName = selectionForField "teamName" [] graphqlDefaultResponseScalarDecoder

teamResourcePath :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe Uri)
teamResourcePath = selectionForField "teamResourcePath" [] graphqlDefaultResponseScalarDecoder

teamUrl :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe Uri)
teamUrl = selectionForField "teamUrl" [] graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe r)
user = selectionForCompositeField "user" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe Uri)
userResourcePath = selectionForField "userResourcePath" [] graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__TeamAddRepositoryAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
