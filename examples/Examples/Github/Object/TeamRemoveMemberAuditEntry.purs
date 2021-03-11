module Examples.Github.Object.TeamRemoveMemberAuditEntry where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__TeamRemoveMemberAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__Team
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Examples.Github.Enum.OperationType (OperationType)

action :: SelectionSet Scope__TeamRemoveMemberAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor
  :: forall r
   . SelectionSet Scope__AuditEntryActor r
  -> SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation
  :: forall r
   . SelectionSet Scope__ActorLocation r
  -> SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__TeamRemoveMemberAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__TeamRemoveMemberAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isLdapMapped :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe Boolean)
isLdapMapped = selectionForField
               "isLdapMapped"
               []
               graphqlDefaultResponseScalarDecoder

operationType
  :: SelectionSet
     Scope__TeamRemoveMemberAuditEntry
     (Maybe OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName
  :: SelectionSet
     Scope__TeamRemoveMemberAuditEntry
     (Maybe String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath
  :: SelectionSet
     Scope__TeamRemoveMemberAuditEntry
     (Maybe Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

team
  :: forall r
   . SelectionSet Scope__Team r
  -> SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe r)
team = selectionForCompositeField
       "team"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

teamName :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe String)
teamName = selectionForField "teamName" [] graphqlDefaultResponseScalarDecoder

teamResourcePath :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe Uri)
teamResourcePath = selectionForField
                   "teamResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

teamUrl :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe Uri)
teamUrl = selectionForField "teamUrl" [] graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__TeamRemoveMemberAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
