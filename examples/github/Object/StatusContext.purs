module Examples.Github.Object.StatusContext where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphQLArguments
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Type.Row (type (+))
import Examples.Github.Scopes
  (Scope__StatusContext, Scope__Commit, Scope__Actor)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, DateTime, Id)
import Examples.Github.Enum.StatusState (StatusState)

type AvatarUrlInputRowOptional r = ( size :: Optional Int | r )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__StatusContext (Maybe Uri)
avatarUrl input = selectionForField
                  "avatarUrl"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseScalarDecoder

commit
  :: forall r
   . SelectionSet Scope__Commit r
  -> SelectionSet Scope__StatusContext (Maybe r)
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

context :: SelectionSet Scope__StatusContext String
context = selectionForField "context" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__StatusContext DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

creator
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__StatusContext (Maybe r)
creator = selectionForCompositeField
          "creator"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

description :: SelectionSet Scope__StatusContext (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__StatusContext Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__StatusContext StatusState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

targetUrl :: SelectionSet Scope__StatusContext (Maybe Uri)
targetUrl = selectionForField "targetUrl" [] graphqlDefaultResponseScalarDecoder
