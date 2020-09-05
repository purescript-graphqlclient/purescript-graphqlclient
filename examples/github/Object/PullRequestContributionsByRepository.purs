module Examples.Github.Object.PullRequestContributionsByRepository where

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
  ( Scope__CreatedPullRequestContributionConnection
  , Scope__PullRequestContributionsByRepository
  , Scope__Repository
  )

type ContributionsInputRowOptional r = ( after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       , orderBy :: Optional
                                                    Examples.Github.InputObject.ContributionOrder
                                       | r
                                       )

type ContributionsInput = { | ContributionsInputRowOptional + () }

contributions :: forall r . ContributionsInput -> SelectionSet
                                                  Scope__CreatedPullRequestContributionConnection
                                                  r -> SelectionSet
                                                       Scope__PullRequestContributionsByRepository
                                                       r
contributions input = selectionForCompositeField
                      "contributions"
                      (toGraphqlArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__PullRequestContributionsByRepository
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
