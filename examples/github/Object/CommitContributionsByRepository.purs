module Examples.Github.Object.CommitContributionsByRepository where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.InputObject (CommitContributionOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__CreatedCommitContributionConnection
  , Scope__CommitContributionsByRepository
  , Scope__Repository
  )
import Examples.Github.Scalars (Uri)

type ContributionsInputRowOptional r = ( after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       , orderBy :: Optional
                                                    Examples.Github.InputObject.CommitContributionOrder
                                       | r
                                       )

type ContributionsInput = { | ContributionsInputRowOptional + () }

contributions :: forall r . ContributionsInput -> SelectionSet
                                                  Scope__CreatedCommitContributionConnection
                                                  r -> SelectionSet
                                                       Scope__CommitContributionsByRepository
                                                       r
contributions input = selectionForCompositeField
                      "contributions"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__CommitContributionsByRepository
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

resourcePath :: SelectionSet Scope__CommitContributionsByRepository Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__CommitContributionsByRepository Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
