module Examples.Github.Object.DiscussionCategory where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__DiscussionCategory, Scope__Repository)
import Examples.Github.Scalars (DateTime, Html, Id)
import Data.Maybe (Maybe)

createdAt :: SelectionSet Scope__DiscussionCategory DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__DiscussionCategory (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

emoji :: SelectionSet Scope__DiscussionCategory String
emoji = selectionForField "emoji" [] graphqlDefaultResponseScalarDecoder

emojiHTML :: SelectionSet Scope__DiscussionCategory Html
emojiHTML = selectionForField "emojiHTML" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__DiscussionCategory Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isAnswerable :: SelectionSet Scope__DiscussionCategory Boolean
isAnswerable = selectionForField
               "isAnswerable"
               []
               graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__DiscussionCategory String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__DiscussionCategory r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

updatedAt :: SelectionSet Scope__DiscussionCategory DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
