module Examples.Github.Object.Topic where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__Topic, Scope__RepositoryConnection, Scope__StargazerConnection)
import Examples.Github.Scalars (Id)
import Type.Row (type (+))
import Examples.Github.Enum.RepositoryPrivacy (RepositoryPrivacy)
import Examples.Github.InputObject (RepositoryOrder, StarOrder) as Examples.Github.InputObject
import Data.Maybe (Maybe)
import Examples.Github.Enum.RepositoryAffiliation (RepositoryAffiliation)

id :: SelectionSet Scope__Topic Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Topic String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type RelatedTopicsInputRowOptional r = ( first :: Optional Int | r )

type RelatedTopicsInput = { | RelatedTopicsInputRowOptional + () }

relatedTopics
  :: forall r
   . RelatedTopicsInput
  -> SelectionSet Scope__Topic r
  -> SelectionSet Scope__Topic (Array r)
relatedTopics input = selectionForCompositeField
                      "relatedTopics"
                      (toGraphQLArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoriesInputRowOptional r
  = ( privacy :: Optional RepositoryPrivacy
    , orderBy :: Optional Examples.Github.InputObject.RepositoryOrder
    , affiliations :: Optional (Array (Maybe RepositoryAffiliation))
    , ownerAffiliations :: Optional (Array (Maybe RepositoryAffiliation))
    , isLocked :: Optional Boolean
    , after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , sponsorableOnly :: Optional Boolean
    | r
    )

type RepositoriesInput = { | RepositoriesInputRowOptional + () }

repositories
  :: forall r
   . RepositoriesInput
  -> SelectionSet Scope__RepositoryConnection r
  -> SelectionSet Scope__Topic r
repositories input = selectionForCompositeField
                     "repositories"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

stargazerCount :: SelectionSet Scope__Topic Int
stargazerCount = selectionForField
                 "stargazerCount"
                 []
                 graphqlDefaultResponseScalarDecoder

type StargazersInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.StarOrder
    | r
    )

type StargazersInput = { | StargazersInputRowOptional + () }

stargazers
  :: forall r
   . StargazersInput
  -> SelectionSet Scope__StargazerConnection r
  -> SelectionSet Scope__Topic r
stargazers input = selectionForCompositeField
                   "stargazers"
                   (toGraphQLArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerHasStarred :: SelectionSet Scope__Topic Boolean
viewerHasStarred = selectionForField
                   "viewerHasStarred"
                   []
                   graphqlDefaultResponseScalarDecoder
