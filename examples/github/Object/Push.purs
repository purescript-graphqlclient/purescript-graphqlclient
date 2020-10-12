module Examples.Github.Object.Push where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__Push, Scope__User, Scope__Repository)
import Examples.Github.Scalars (Id, GitObjectId, Uri)
import Data.Maybe (Maybe)

id :: SelectionSet Scope__Push Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

nextSha :: SelectionSet Scope__Push (Maybe GitObjectId)
nextSha = selectionForField "nextSha" [] graphqlDefaultResponseScalarDecoder

permalink :: SelectionSet Scope__Push Uri
permalink = selectionForField "permalink" [] graphqlDefaultResponseScalarDecoder

previousSha :: SelectionSet Scope__Push (Maybe GitObjectId)
previousSha = selectionForField
              "previousSha"
              []
              graphqlDefaultResponseScalarDecoder

pusher :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__Push r
pusher = selectionForCompositeField
         "pusher"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__Push
                              r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer
