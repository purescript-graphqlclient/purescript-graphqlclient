module Examples.Github.Object.RepositoryTopic where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__RepositoryTopic, Scope__Topic)
import Examples.Github.Scalars (Id, Uri)

id :: SelectionSet Scope__RepositoryTopic Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__RepositoryTopic Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

topic :: forall r . SelectionSet
                    Scope__Topic
                    r -> SelectionSet
                         Scope__RepositoryTopic
                         r
topic = selectionForCompositeField
        "topic"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

url :: SelectionSet Scope__RepositoryTopic Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
