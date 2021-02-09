module Dillonkearns.Examples.Github.Object.PullRequestReviewContributionsByRepository where

import Dillonkearns.GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.InputObject (ContributionOrder) as Dillonkearns.Examples.Github.InputObject
import Type.Row (type (+))
import Dillonkearns.Examples.Github.Scopes
  ( Scope__CreatedPullRequestReviewContributionConnection
  , Scope__PullRequestReviewContributionsByRepository
  , Scope__Repository
  )

type ContributionsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy
      :: Optional
         Dillonkearns.Examples.Github.InputObject.ContributionOrder
    | r
    )

type ContributionsInput = { | ContributionsInputRowOptional + () }

contributions
  :: forall r
   . ContributionsInput
  -> SelectionSet Scope__CreatedPullRequestReviewContributionConnection r
  -> SelectionSet Scope__PullRequestReviewContributionsByRepository r
contributions input = selectionForCompositeField
                      "contributions"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__PullRequestReviewContributionsByRepository r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
