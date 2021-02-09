module Dillonkearns.Examples.Github.Object.RepoAddTopicAuditEntry where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  ( Scope__RepoAddTopicAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__Repository
  , Scope__Topic
  , Scope__User
  )
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Dillonkearns.Examples.Github.Enum.OperationType (OperationType)

action :: SelectionSet Scope__RepoAddTopicAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor
  :: forall r
   . SelectionSet Scope__AuditEntryActor r
  -> SelectionSet Scope__RepoAddTopicAuditEntry (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation
  :: forall r
   . SelectionSet Scope__ActorLocation r
  -> SelectionSet Scope__RepoAddTopicAuditEntry (Maybe r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__RepoAddTopicAuditEntry PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__RepoAddTopicAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType
  :: SelectionSet
     Scope__RepoAddTopicAuditEntry
     (Maybe OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__RepoAddTopicAuditEntry (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath
  :: SelectionSet
     Scope__RepoAddTopicAuditEntry
     (Maybe Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__RepoAddTopicAuditEntry (Maybe r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoryName :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe String)
repositoryName = selectionForField
                 "repositoryName"
                 []
                 graphqlDefaultResponseScalarDecoder

repositoryResourcePath :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe Uri)
repositoryResourcePath = selectionForField
                         "repositoryResourcePath"
                         []
                         graphqlDefaultResponseScalarDecoder

repositoryUrl :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe Uri)
repositoryUrl = selectionForField
                "repositoryUrl"
                []
                graphqlDefaultResponseScalarDecoder

topic
  :: forall r
   . SelectionSet Scope__Topic r
  -> SelectionSet Scope__RepoAddTopicAuditEntry (Maybe r)
topic = selectionForCompositeField
        "topic"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

topicName :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe String)
topicName = selectionForField "topicName" [] graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__RepoAddTopicAuditEntry (Maybe r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet Scope__RepoAddTopicAuditEntry (Maybe Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
