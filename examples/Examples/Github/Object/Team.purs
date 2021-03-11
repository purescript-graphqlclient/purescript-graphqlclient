module Examples.Github.Object.Team where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__TeamConnection
  , Scope__Team
  , Scope__TeamDiscussion
  , Scope__TeamDiscussionConnection
  , Scope__OrganizationInvitationConnection
  , Scope__UserStatusConnection
  , Scope__TeamMemberConnection
  , Scope__Organization
  , Scope__TeamRepositoryConnection
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, DateTime, Id)
import Examples.Github.InputObject
  ( TeamOrder
  , TeamDiscussionOrder
  , UserStatusOrder
  , TeamMemberOrder
  , TeamRepositoryOrder
  ) as Examples.Github.InputObject
import Examples.Github.Enum.TeamMembershipType (TeamMembershipType)
import Examples.Github.Enum.TeamMemberRole (TeamMemberRole)
import Examples.Github.Enum.TeamPrivacy (TeamPrivacy)
import Examples.Github.Enum.SubscriptionState (SubscriptionState)

type AncestorsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type AncestorsInput = { | AncestorsInputRowOptional + () }

ancestors
  :: forall r
   . AncestorsInput
  -> SelectionSet Scope__TeamConnection r
  -> SelectionSet Scope__Team r
ancestors input = selectionForCompositeField
                  "ancestors"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type AvatarUrlInputRowOptional r = ( size :: Optional Int | r )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__Team (Maybe Uri)
avatarUrl input = selectionForField
                  "avatarUrl"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseScalarDecoder

type ChildTeamsInputRowOptional r
  = ( orderBy :: Optional Examples.Github.InputObject.TeamOrder
    , userLogins :: Optional (Array String)
    , immediateOnly :: Optional Boolean
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type ChildTeamsInput = { | ChildTeamsInputRowOptional + () }

childTeams
  :: forall r
   . ChildTeamsInput
  -> SelectionSet Scope__TeamConnection r
  -> SelectionSet Scope__Team r
childTeams input = selectionForCompositeField
                   "childTeams"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

combinedSlug :: SelectionSet Scope__Team String
combinedSlug = selectionForField
               "combinedSlug"
               []
               graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Team DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__Team (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Team (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

type DiscussionInputRowRequired r = ( number :: Int | r )

type DiscussionInput = { | DiscussionInputRowRequired + () }

discussion
  :: forall r
   . DiscussionInput
  -> SelectionSet Scope__TeamDiscussion r
  -> SelectionSet Scope__Team (Maybe r)
discussion input = selectionForCompositeField
                   "discussion"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type DiscussionsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , isPinned :: Optional Boolean
    , orderBy
      :: Optional
         Examples.Github.InputObject.TeamDiscussionOrder
    | r
    )

type DiscussionsInput = { | DiscussionsInputRowOptional + () }

discussions
  :: forall r
   . DiscussionsInput
  -> SelectionSet Scope__TeamDiscussionConnection r
  -> SelectionSet Scope__Team r
discussions input = selectionForCompositeField
                    "discussions"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

discussionsResourcePath :: SelectionSet Scope__Team Uri
discussionsResourcePath = selectionForField
                          "discussionsResourcePath"
                          []
                          graphqlDefaultResponseScalarDecoder

discussionsUrl :: SelectionSet Scope__Team Uri
discussionsUrl = selectionForField
                 "discussionsUrl"
                 []
                 graphqlDefaultResponseScalarDecoder

editTeamResourcePath :: SelectionSet Scope__Team Uri
editTeamResourcePath = selectionForField
                       "editTeamResourcePath"
                       []
                       graphqlDefaultResponseScalarDecoder

editTeamUrl :: SelectionSet Scope__Team Uri
editTeamUrl = selectionForField
              "editTeamUrl"
              []
              graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Team Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type InvitationsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type InvitationsInput = { | InvitationsInputRowOptional + () }

invitations
  :: forall r
   . InvitationsInput
  -> SelectionSet Scope__OrganizationInvitationConnection r
  -> SelectionSet Scope__Team (Maybe r)
invitations input = selectionForCompositeField
                    "invitations"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MemberStatusesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy
      :: Optional
         Examples.Github.InputObject.UserStatusOrder
    | r
    )

type MemberStatusesInput = { | MemberStatusesInputRowOptional + () }

memberStatuses
  :: forall r
   . MemberStatusesInput
  -> SelectionSet Scope__UserStatusConnection r
  -> SelectionSet Scope__Team r
memberStatuses input = selectionForCompositeField
                       "memberStatuses"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MembersInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , query :: Optional String
    , membership :: Optional TeamMembershipType
    , role :: Optional TeamMemberRole
    , orderBy
      :: Optional
         Examples.Github.InputObject.TeamMemberOrder
    | r
    )

type MembersInput = { | MembersInputRowOptional + () }

members
  :: forall r
   . MembersInput
  -> SelectionSet Scope__TeamMemberConnection r
  -> SelectionSet Scope__Team r
members input = selectionForCompositeField
                "members"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

membersResourcePath :: SelectionSet Scope__Team Uri
membersResourcePath = selectionForField
                      "membersResourcePath"
                      []
                      graphqlDefaultResponseScalarDecoder

membersUrl :: SelectionSet Scope__Team Uri
membersUrl = selectionForField
             "membersUrl"
             []
             graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Team String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

newTeamResourcePath :: SelectionSet Scope__Team Uri
newTeamResourcePath = selectionForField
                      "newTeamResourcePath"
                      []
                      graphqlDefaultResponseScalarDecoder

newTeamUrl :: SelectionSet Scope__Team Uri
newTeamUrl = selectionForField
             "newTeamUrl"
             []
             graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__Team r
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

parentTeam
  :: forall r
   . SelectionSet Scope__Team r
  -> SelectionSet Scope__Team (Maybe r)
parentTeam = selectionForCompositeField
             "parentTeam"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

privacy :: SelectionSet Scope__Team TeamPrivacy
privacy = selectionForField "privacy" [] graphqlDefaultResponseScalarDecoder

type RepositoriesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , query :: Optional String
    , orderBy
      :: Optional
         Examples.Github.InputObject.TeamRepositoryOrder
    | r
    )

type RepositoriesInput = { | RepositoriesInputRowOptional + () }

repositories
  :: forall r
   . RepositoriesInput
  -> SelectionSet Scope__TeamRepositoryConnection r
  -> SelectionSet Scope__Team r
repositories input = selectionForCompositeField
                     "repositories"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repositoriesResourcePath :: SelectionSet Scope__Team Uri
repositoriesResourcePath = selectionForField
                           "repositoriesResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

repositoriesUrl :: SelectionSet Scope__Team Uri
repositoriesUrl = selectionForField
                  "repositoriesUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__Team Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

slug :: SelectionSet Scope__Team String
slug = selectionForField "slug" [] graphqlDefaultResponseScalarDecoder

teamsResourcePath :: SelectionSet Scope__Team Uri
teamsResourcePath = selectionForField
                    "teamsResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

teamsUrl :: SelectionSet Scope__Team Uri
teamsUrl = selectionForField "teamsUrl" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Team DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Team Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

viewerCanAdminister :: SelectionSet Scope__Team Boolean
viewerCanAdminister = selectionForField
                      "viewerCanAdminister"
                      []
                      graphqlDefaultResponseScalarDecoder

viewerCanSubscribe :: SelectionSet Scope__Team Boolean
viewerCanSubscribe = selectionForField
                     "viewerCanSubscribe"
                     []
                     graphqlDefaultResponseScalarDecoder

viewerSubscription :: SelectionSet Scope__Team (Maybe SubscriptionState)
viewerSubscription = selectionForField
                     "viewerSubscription"
                     []
                     graphqlDefaultResponseScalarDecoder
