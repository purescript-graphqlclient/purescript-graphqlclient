module Examples.Github.Object.OrgBlockUserAuditEntry where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrgBlockUserAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__User
  , Scope__Organization
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Examples.Github.Enum.OperationType (OperationType)

action :: SelectionSet Scope__OrgBlockUserAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet
                    Scope__AuditEntryActor
                    r -> SelectionSet
                         Scope__OrgBlockUserAuditEntry
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__OrgBlockUserAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet
                            Scope__ActorLocation
                            r -> SelectionSet
                                 Scope__OrgBlockUserAuditEntry
                                 (Maybe
                                  r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__OrgBlockUserAuditEntry (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__OrgBlockUserAuditEntry (Maybe Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__OrgBlockUserAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

blockedUser :: forall r . SelectionSet
                          Scope__User
                          r -> SelectionSet
                               Scope__OrgBlockUserAuditEntry
                               (Maybe
                                r)
blockedUser = selectionForCompositeField
              "blockedUser"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

blockedUserName :: SelectionSet Scope__OrgBlockUserAuditEntry (Maybe String)
blockedUserName = selectionForField
                  "blockedUserName"
                  []
                  graphqlDefaultResponseScalarDecoder

blockedUserResourcePath :: SelectionSet
                           Scope__OrgBlockUserAuditEntry
                           (Maybe
                            Uri)
blockedUserResourcePath = selectionForField
                          "blockedUserResourcePath"
                          []
                          graphqlDefaultResponseScalarDecoder

blockedUserUrl :: SelectionSet Scope__OrgBlockUserAuditEntry (Maybe Uri)
blockedUserUrl = selectionForField
                 "blockedUserUrl"
                 []
                 graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__OrgBlockUserAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrgBlockUserAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet
                 Scope__OrgBlockUserAuditEntry
                 (Maybe
                  OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet
                           Scope__Organization
                           r -> SelectionSet
                                Scope__OrgBlockUserAuditEntry
                                (Maybe
                                 r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__OrgBlockUserAuditEntry (Maybe String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet
                            Scope__OrgBlockUserAuditEntry
                            (Maybe
                             Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__OrgBlockUserAuditEntry (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet
                   Scope__User
                   r -> SelectionSet
                        Scope__OrgBlockUserAuditEntry
                        (Maybe
                         r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__OrgBlockUserAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__OrgBlockUserAuditEntry (Maybe Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__OrgBlockUserAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
