module Examples.Github.Object.ProfileItemShowcase where

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
  (Scope__ProfileItemShowcase, Scope__PinnableItemConnection)
import Type.Row (type (+))

hasPinnedItems :: SelectionSet Scope__ProfileItemShowcase Boolean
hasPinnedItems = selectionForField
                 "hasPinnedItems"
                 []
                 graphqlDefaultResponseScalarDecoder

type ItemsInputRowOptional r = ( after :: Optional String
                               , before :: Optional String
                               , first :: Optional Int
                               , last :: Optional Int
                               | r
                               )

type ItemsInput = { | ItemsInputRowOptional + () }

items :: forall r . ItemsInput -> SelectionSet
                                  Scope__PinnableItemConnection
                                  r -> SelectionSet
                                       Scope__ProfileItemShowcase
                                       r
items input = selectionForCompositeField
              "items"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
