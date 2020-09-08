module Examples.Github.Object.Milestone where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphQLArguments
  )
import Examples.Github.Scopes
  ( Scope__Milestone
  , Scope__Actor
  , Scope__IssueConnection
  , Scope__PullRequestConnection
  , Scope__Repository
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id, Uri)
import Examples.Github.InputObject (IssueOrder, IssueFilters) as Examples.Github.InputObject
import Examples.Github.Enum.IssueState (IssueState)
import Type.Row (type (+))
import Examples.Github.Enum.PullRequestState (PullRequestState)
import Examples.Github.Enum.MilestoneState (MilestoneState)

closed :: SelectionSet Scope__Milestone Boolean
closed = selectionForField "closed" [] graphqlDefaultResponseScalarDecoder

closedAt :: SelectionSet Scope__Milestone (Maybe DateTime)
closedAt = selectionForField "closedAt" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Milestone DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

creator :: forall r . SelectionSet
                      Scope__Actor
                      r -> SelectionSet
                           Scope__Milestone
                           (Maybe
                            r)
creator = selectionForCompositeField
          "creator"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

description :: SelectionSet Scope__Milestone (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

dueOn :: SelectionSet Scope__Milestone (Maybe DateTime)
dueOn = selectionForField "dueOn" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Milestone Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

issuePrioritiesDebug :: SelectionSet Scope__Milestone String
issuePrioritiesDebug = selectionForField
                       "issuePrioritiesDebug"
                       []
                       graphqlDefaultResponseScalarDecoder

type IssuesInputRowOptional r = ( orderBy :: Optional
                                             Examples.Github.InputObject.IssueOrder
                                , labels :: Optional (Array String)
                                , states :: Optional (Array IssueState)
                                , filterBy :: Optional
                                              Examples.Github.InputObject.IssueFilters
                                , after :: Optional String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                | r
                                )

type IssuesInput = { | IssuesInputRowOptional + () }

issues :: forall r . IssuesInput -> SelectionSet
                                    Scope__IssueConnection
                                    r -> SelectionSet
                                         Scope__Milestone
                                         r
issues input = selectionForCompositeField
               "issues"
               (toGraphQLArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

number :: SelectionSet Scope__Milestone Int
number = selectionForField "number" [] graphqlDefaultResponseScalarDecoder

type PullRequestsInputRowOptional r = ( states :: Optional
                                                  (Array
                                                   PullRequestState)
                                      , labels :: Optional (Array String)
                                      , headRefName :: Optional String
                                      , baseRefName :: Optional String
                                      , orderBy :: Optional
                                                   Examples.Github.InputObject.IssueOrder
                                      , after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type PullRequestsInput = { | PullRequestsInputRowOptional + () }

pullRequests :: forall r . PullRequestsInput -> SelectionSet
                                                Scope__PullRequestConnection
                                                r -> SelectionSet
                                                     Scope__Milestone
                                                     r
pullRequests input = selectionForCompositeField
                     "pullRequests"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__Milestone
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Milestone Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__Milestone MilestoneState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

title :: SelectionSet Scope__Milestone String
title = selectionForField "title" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Milestone DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Milestone Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
