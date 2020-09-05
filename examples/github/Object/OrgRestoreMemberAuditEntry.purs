module Examples.Github.Object.OrgRestoreMemberAuditEntry where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__OrgRestoreMemberAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__OrgRestoreMemberAuditEntryMembership
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Examples.Github.Enum.OperationType (OperationType)

action :: SelectionSet Scope__OrgRestoreMemberAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet
                    Scope__AuditEntryActor
                    r -> SelectionSet
                         Scope__OrgRestoreMemberAuditEntry
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__OrgRestoreMemberAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet
                            Scope__ActorLocation
                            r -> SelectionSet
                                 Scope__OrgRestoreMemberAuditEntry
                                 (Maybe
                                  r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__OrgRestoreMemberAuditEntry (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__OrgRestoreMemberAuditEntry (Maybe Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__OrgRestoreMemberAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__OrgRestoreMemberAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__OrgRestoreMemberAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet
                 Scope__OrgRestoreMemberAuditEntry
                 (Maybe
                  OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet
                           Scope__Organization
                           r -> SelectionSet
                                Scope__OrgRestoreMemberAuditEntry
                                (Maybe
                                 r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet
                    Scope__OrgRestoreMemberAuditEntry
                    (Maybe
                     String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet
                            Scope__OrgRestoreMemberAuditEntry
                            (Maybe
                             Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__OrgRestoreMemberAuditEntry (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

restoredCustomEmailRoutingsCount :: SelectionSet
                                    Scope__OrgRestoreMemberAuditEntry
                                    (Maybe
                                     Int)
restoredCustomEmailRoutingsCount = selectionForField
                                   "restoredCustomEmailRoutingsCount"
                                   []
                                   graphqlDefaultResponseScalarDecoder

restoredIssueAssignmentsCount :: SelectionSet
                                 Scope__OrgRestoreMemberAuditEntry
                                 (Maybe
                                  Int)
restoredIssueAssignmentsCount = selectionForField
                                "restoredIssueAssignmentsCount"
                                []
                                graphqlDefaultResponseScalarDecoder

restoredMemberships :: forall r . SelectionSet
                                  Scope__OrgRestoreMemberAuditEntryMembership
                                  r -> SelectionSet
                                       Scope__OrgRestoreMemberAuditEntry
                                       (Maybe
                                        (Array
                                         r))
restoredMemberships = selectionForCompositeField
                      "restoredMemberships"
                      []
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

restoredMembershipsCount :: SelectionSet
                            Scope__OrgRestoreMemberAuditEntry
                            (Maybe
                             Int)
restoredMembershipsCount = selectionForField
                           "restoredMembershipsCount"
                           []
                           graphqlDefaultResponseScalarDecoder

restoredRepositoriesCount :: SelectionSet
                             Scope__OrgRestoreMemberAuditEntry
                             (Maybe
                              Int)
restoredRepositoriesCount = selectionForField
                            "restoredRepositoriesCount"
                            []
                            graphqlDefaultResponseScalarDecoder

restoredRepositoryStarsCount :: SelectionSet
                                Scope__OrgRestoreMemberAuditEntry
                                (Maybe
                                 Int)
restoredRepositoryStarsCount = selectionForField
                               "restoredRepositoryStarsCount"
                               []
                               graphqlDefaultResponseScalarDecoder

restoredRepositoryWatchesCount :: SelectionSet
                                  Scope__OrgRestoreMemberAuditEntry
                                  (Maybe
                                   Int)
restoredRepositoryWatchesCount = selectionForField
                                 "restoredRepositoryWatchesCount"
                                 []
                                 graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet
                   Scope__User
                   r -> SelectionSet
                        Scope__OrgRestoreMemberAuditEntry
                        (Maybe
                         r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__OrgRestoreMemberAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__OrgRestoreMemberAuditEntry (Maybe Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__OrgRestoreMemberAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
