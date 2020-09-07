module Examples.Github.Interface.ProfileOwner where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphqlArguments
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Enum.PinnableItemType (PinnableItemType)
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__ProfileOwner
  , Scope__ProfileItemShowcase
  , Scope__PinnableItemConnection
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe(..))
import Examples.Github.Scalars (Id, Uri)
import Prelude (pure)

type AnyPinnableItemsInputRowOptional r = ( "type" :: Optional PinnableItemType
                                          | r
                                          )

type AnyPinnableItemsInput = { | AnyPinnableItemsInputRowOptional + () }

anyPinnableItems :: AnyPinnableItemsInput -> SelectionSet
                                             Scope__ProfileOwner
                                             Boolean
anyPinnableItems input = selectionForField
                         "anyPinnableItems"
                         (toGraphqlArguments
                          input)
                         graphqlDefaultResponseScalarDecoder

email :: SelectionSet Scope__ProfileOwner (Maybe String)
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__ProfileOwner Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

itemShowcase :: forall r . SelectionSet
                           Scope__ProfileItemShowcase
                           r -> SelectionSet
                                Scope__ProfileOwner
                                r
itemShowcase = selectionForCompositeField
               "itemShowcase"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

location :: SelectionSet Scope__ProfileOwner (Maybe String)
location = selectionForField "location" [] graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__ProfileOwner String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__ProfileOwner (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type PinnableItemsInputRowOptional r = ( types :: Optional
                                                  (Array
                                                   PinnableItemType)
                                       , after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type PinnableItemsInput = { | PinnableItemsInputRowOptional + () }

pinnableItems :: forall r . PinnableItemsInput -> SelectionSet
                                                  Scope__PinnableItemConnection
                                                  r -> SelectionSet
                                                       Scope__ProfileOwner
                                                       r
pinnableItems input = selectionForCompositeField
                      "pinnableItems"
                      (toGraphqlArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type PinnedItemsInputRowOptional r = ( types :: Optional
                                                (Array
                                                 PinnableItemType)
                                     , after :: Optional String
                                     , before :: Optional String
                                     , first :: Optional Int
                                     , last :: Optional Int
                                     | r
                                     )

type PinnedItemsInput = { | PinnedItemsInputRowOptional + () }

pinnedItems :: forall r . PinnedItemsInput -> SelectionSet
                                              Scope__PinnableItemConnection
                                              r -> SelectionSet
                                                   Scope__ProfileOwner
                                                   r
pinnedItems input = selectionForCompositeField
                    "pinnedItems"
                    (toGraphqlArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pinnedItemsRemaining :: SelectionSet Scope__ProfileOwner Int
pinnedItemsRemaining = selectionForField
                       "pinnedItemsRemaining"
                       []
                       graphqlDefaultResponseScalarDecoder

viewerCanChangePinnedItems :: SelectionSet Scope__ProfileOwner Boolean
viewerCanChangePinnedItems = selectionForField
                             "viewerCanChangePinnedItems"
                             []
                             graphqlDefaultResponseScalarDecoder

websiteUrl :: SelectionSet Scope__ProfileOwner (Maybe Uri)
websiteUrl = selectionForField
             "websiteUrl"
             []
             graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onOrganization :: SelectionSet
                                               Scope__Organization
                                               decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__ProfileOwner
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Organization" selections.onOrganization
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure Nothing, onUser: pure Nothing }
