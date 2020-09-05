module Examples.Github.Object.Ref where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Enum.PullRequestState (PullRequestState)
import Examples.Github.InputObject (IssueOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__PullRequestConnection
  , Scope__Ref
  , Scope__Repository
  , Scope__GitObject
  )
import Examples.Github.Scalars (Id)
import Data.Maybe (Maybe)

type AssociatedPullRequestsInputRowOptional r = ( states :: Optional
                                                            (Array
                                                             PullRequestState)
                                                , labels :: Optional
                                                            (Array
                                                             String)
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

type AssociatedPullRequestsInput = {
| AssociatedPullRequestsInputRowOptional + ()
}

associatedPullRequests :: forall r . AssociatedPullRequestsInput -> SelectionSet
                                                                    Scope__PullRequestConnection
                                                                    r -> SelectionSet
                                                                         Scope__Ref
                                                                         r
associatedPullRequests input = selectionForCompositeField
                               "associatedPullRequests"
                               (toGraphqlArguments
                                input)
                               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Ref Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Ref String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

prefix :: SelectionSet Scope__Ref String
prefix = selectionForField "prefix" [] graphqlDefaultResponseScalarDecoder

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__Ref
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

target :: forall r . SelectionSet
                     Scope__GitObject
                     r -> SelectionSet
                          Scope__Ref
                          (Maybe
                           r)
target = selectionForCompositeField
         "target"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
