module Examples.Github.Object.Topic where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__Topic, Scope__StargazerConnection)
import Examples.Github.Scalars (Id)
import Type.Row (type (+))
import Examples.Github.InputObject (StarOrder) as Examples.Github.InputObject

id :: SelectionSet Scope__Topic Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Topic String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type RelatedTopicsInputRowOptional r = ( first :: Optional Int | r )

type RelatedTopicsInput = { | RelatedTopicsInputRowOptional + () }

relatedTopics :: forall r . RelatedTopicsInput -> SelectionSet
                                                  Scope__Topic
                                                  r -> SelectionSet
                                                       Scope__Topic
                                                       (Array
                                                        r)
relatedTopics input = selectionForCompositeField
                      "relatedTopics"
                      (toGraphqlArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type StargazersInputRowOptional r = ( after :: Optional
                                               String
                                    , before :: Optional String
                                    , first :: Optional Int
                                    , last :: Optional Int
                                    , orderBy :: Optional
                                                 Examples.Github.InputObject.StarOrder
                                    | r
                                    )

type StargazersInput = { | StargazersInputRowOptional + () }

stargazers :: forall r . StargazersInput -> SelectionSet
                                            Scope__StargazerConnection
                                            r -> SelectionSet
                                                 Scope__Topic
                                                 r
stargazers input = selectionForCompositeField
                   "stargazers"
                   (toGraphqlArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerHasStarred :: SelectionSet Scope__Topic Boolean
viewerHasStarred = selectionForField
                   "viewerHasStarred"
                   []
                   graphqlDefaultResponseScalarDecoder
