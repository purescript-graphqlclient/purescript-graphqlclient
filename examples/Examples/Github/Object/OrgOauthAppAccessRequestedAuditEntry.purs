module Examples.Github.Object.OrgOauthAppAccessRequestedAuditEntry where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrgOauthAppAccessRequestedAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Examples.Github.Enum.OperationType (OperationType)

action :: SelectionSet Scope__OrgOauthAppAccessRequestedAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor
  :: forall r
   . SelectionSet Scope__AuditEntryActor r
  -> SelectionSet Scope__OrgOauthAppAccessRequestedAuditEntry (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation
  :: forall r
   . SelectionSet Scope__ActorLocation r
  -> SelectionSet Scope__OrgOauthAppAccessRequestedAuditEntry (Maybe r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__OrgOauthAppAccessRequestedAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrgOauthAppAccessRequestedAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

oauthApplicationName
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe String)
oauthApplicationName = selectionForField
                       "oauthApplicationName"
                       []
                       graphqlDefaultResponseScalarDecoder

oauthApplicationResourcePath
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe Uri)
oauthApplicationResourcePath = selectionForField
                               "oauthApplicationResourcePath"
                               []
                               graphqlDefaultResponseScalarDecoder

oauthApplicationUrl
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe Uri)
oauthApplicationUrl = selectionForField
                      "oauthApplicationUrl"
                      []
                      graphqlDefaultResponseScalarDecoder

operationType
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__OrgOauthAppAccessRequestedAuditEntry (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__OrgOauthAppAccessRequestedAuditEntry (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath
  :: SelectionSet
     Scope__OrgOauthAppAccessRequestedAuditEntry
     (Maybe Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__OrgOauthAppAccessRequestedAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
