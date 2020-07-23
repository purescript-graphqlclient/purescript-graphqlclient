module Examples.Github.Object.Label where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__Label
  , Scope__IssueConnection
  , Scope__PullRequestConnection
  , Scope__Repository
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  , Uri
  )
import Examples.Github.InputObject
  ( IssueOrder
  , IssueFilters
  ) as Examples.Github.InputObject
import Examples.Github.Enum.IssueState
  ( IssueState
  )
import Type.Row
  ( type (+)
  )
import Examples.Github.Enum.PullRequestState
  ( PullRequestState
  )

color :: SelectionSet Scope__Label String
color = selectionForField "color" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__Label (Maybe DateTime)
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__Label (Maybe String)
description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Label Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isDefault :: SelectionSet Scope__Label Boolean
isDefault = selectionForField "isDefault" [] graphqlDefaultResponseScalarDecoder

type IssuesInputRowOptional r = ( orderBy :: Optional Examples.Github.InputObject.IssueOrder
                                , labels :: Optional (Array String)
                                , states :: Optional (Array IssueState)
                                , filterBy :: Optional Examples.Github.InputObject.IssueFilters
                                , after :: Optional String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                | r
                                )

type IssuesInput = { | IssuesInputRowOptional + () }

issues :: forall r . IssuesInput -> SelectionSet Scope__IssueConnection r -> SelectionSet Scope__Label r
issues input = selectionForCompositeField "issues" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

name :: SelectionSet Scope__Label String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type PullRequestsInputRowOptional r = ( states :: Optional (Array PullRequestState)
                                      , labels :: Optional (Array String)
                                      , headRefName :: Optional String
                                      , baseRefName :: Optional String
                                      , orderBy :: Optional Examples.Github.InputObject.IssueOrder
                                      , after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type PullRequestsInput = { | PullRequestsInputRowOptional + () }

pullRequests :: forall r . PullRequestsInput -> SelectionSet Scope__PullRequestConnection r -> SelectionSet Scope__Label r
pullRequests input = selectionForCompositeField "pullRequests" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet Scope__Repository r -> SelectionSet Scope__Label r
repository = selectionForCompositeField "repository" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__Label Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__Label (Maybe DateTime)
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Label Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
