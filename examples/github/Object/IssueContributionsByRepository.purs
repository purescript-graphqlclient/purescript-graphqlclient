module Examples.Github.Object.IssueContributionsByRepository where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.InputObject (ContributionOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__CreatedIssueContributionConnection
  , Scope__IssueContributionsByRepository
  , Scope__Repository
  )

type ContributionsInputRowOptional r = ( after :: Optional
                                                  String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       , orderBy :: Optional
                                                    Examples.Github.InputObject.ContributionOrder
                                       | r
                                       )

type ContributionsInput = { | ContributionsInputRowOptional + () }

contributions :: forall r . ContributionsInput -> SelectionSet
                                                  Scope__CreatedIssueContributionConnection
                                                  r -> SelectionSet
                                                       Scope__IssueContributionsByRepository
                                                       r
contributions input = selectionForCompositeField
                      "contributions"
                      (toGraphqlArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__IssueContributionsByRepository
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
