module Examples.Github.Object.ReactionGroup where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphqlArguments
  )
import Examples.Github.Scopes
  (Scope__ReactionGroup, Scope__Reactable, Scope__ReactingUserConnection)
import Examples.Github.Enum.ReactionContent (ReactionContent)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime)
import Type.Row (type (+))

content :: SelectionSet Scope__ReactionGroup ReactionContent
content = selectionForField "content" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__ReactionGroup (Maybe DateTime)
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

subject :: forall r . SelectionSet
                      Scope__Reactable
                      r -> SelectionSet
                           Scope__ReactionGroup
                           r
subject = selectionForCompositeField
          "subject"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UsersInputRowOptional r = ( after :: Optional
                                          String
                               , before :: Optional String
                               , first :: Optional Int
                               , last :: Optional Int
                               | r
                               )

type UsersInput = { | UsersInputRowOptional + () }

users :: forall r . UsersInput -> SelectionSet
                                  Scope__ReactingUserConnection
                                  r -> SelectionSet
                                       Scope__ReactionGroup
                                       r
users input = selectionForCompositeField
              "users"
              (toGraphqlArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewerHasReacted :: SelectionSet Scope__ReactionGroup Boolean
viewerHasReacted = selectionForField
                   "viewerHasReacted"
                   []
                   graphqlDefaultResponseScalarDecoder
