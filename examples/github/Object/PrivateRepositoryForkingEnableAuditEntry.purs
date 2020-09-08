module Examples.Github.Object.PrivateRepositoryForkingEnableAuditEntry where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__PrivateRepositoryForkingEnableAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__Repository
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Examples.Github.Enum.OperationType (OperationType)

action :: SelectionSet Scope__PrivateRepositoryForkingEnableAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet
                    Scope__AuditEntryActor
                    r -> SelectionSet
                         Scope__PrivateRepositoryForkingEnableAuditEntry
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet
           Scope__PrivateRepositoryForkingEnableAuditEntry
           (Maybe
            String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet
                            Scope__ActorLocation
                            r -> SelectionSet
                                 Scope__PrivateRepositoryForkingEnableAuditEntry
                                 (Maybe
                                  r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet
              Scope__PrivateRepositoryForkingEnableAuditEntry
              (Maybe
               String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet
                     Scope__PrivateRepositoryForkingEnableAuditEntry
                     (Maybe
                      Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet
            Scope__PrivateRepositoryForkingEnableAuditEntry
            (Maybe
             Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet
             Scope__PrivateRepositoryForkingEnableAuditEntry
             PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

enterpriseResourcePath :: SelectionSet
                          Scope__PrivateRepositoryForkingEnableAuditEntry
                          (Maybe
                           Uri)
enterpriseResourcePath = selectionForField
                         "enterpriseResourcePath"
                         []
                         graphqlDefaultResponseScalarDecoder

enterpriseSlug :: SelectionSet
                  Scope__PrivateRepositoryForkingEnableAuditEntry
                  (Maybe
                   String)
enterpriseSlug = selectionForField
                 "enterpriseSlug"
                 []
                 graphqlDefaultResponseScalarDecoder

enterpriseUrl :: SelectionSet
                 Scope__PrivateRepositoryForkingEnableAuditEntry
                 (Maybe
                  Uri)
enterpriseUrl = selectionForField
                "enterpriseUrl"
                []
                graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__PrivateRepositoryForkingEnableAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet
                 Scope__PrivateRepositoryForkingEnableAuditEntry
                 (Maybe
                  OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet
                           Scope__Organization
                           r -> SelectionSet
                                Scope__PrivateRepositoryForkingEnableAuditEntry
                                (Maybe
                                 r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet
                    Scope__PrivateRepositoryForkingEnableAuditEntry
                    (Maybe
                     String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet
                            Scope__PrivateRepositoryForkingEnableAuditEntry
                            (Maybe
                             Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet
                   Scope__PrivateRepositoryForkingEnableAuditEntry
                   (Maybe
                    Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__PrivateRepositoryForkingEnableAuditEntry
                              (Maybe
                               r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryName :: SelectionSet
                  Scope__PrivateRepositoryForkingEnableAuditEntry
                  (Maybe
                   String)
repositoryName = selectionForField
                 "repositoryName"
                 []
                 graphqlDefaultResponseScalarDecoder

repositoryResourcePath :: SelectionSet
                          Scope__PrivateRepositoryForkingEnableAuditEntry
                          (Maybe
                           Uri)
repositoryResourcePath = selectionForField
                         "repositoryResourcePath"
                         []
                         graphqlDefaultResponseScalarDecoder

repositoryUrl :: SelectionSet
                 Scope__PrivateRepositoryForkingEnableAuditEntry
                 (Maybe
                  Uri)
repositoryUrl = selectionForField
                "repositoryUrl"
                []
                graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet
                   Scope__User
                   r -> SelectionSet
                        Scope__PrivateRepositoryForkingEnableAuditEntry
                        (Maybe
                         r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet
             Scope__PrivateRepositoryForkingEnableAuditEntry
             (Maybe
              String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet
                    Scope__PrivateRepositoryForkingEnableAuditEntry
                    (Maybe
                     Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet
           Scope__PrivateRepositoryForkingEnableAuditEntry
           (Maybe
            Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
