module Examples.Github.Object.App where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__App, Scope__IpAllowListEntryConnection)
import Examples.Github.Scalars (DateTime, Id, Uri)
import Data.Maybe (Maybe)
import Examples.Github.InputObject (IpAllowListEntryOrder) as Examples.Github.InputObject
import Type.Row (type (+))

createdAt :: SelectionSet Scope__App DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__App (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__App (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__App Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type IpAllowListEntriesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.IpAllowListEntryOrder
    | r
    )

type IpAllowListEntriesInput = { | IpAllowListEntriesInputRowOptional + () }

ipAllowListEntries
  :: forall r
   . IpAllowListEntriesInput
  -> SelectionSet Scope__IpAllowListEntryConnection r
  -> SelectionSet Scope__App r
ipAllowListEntries input = selectionForCompositeField
                           "ipAllowListEntries"
                           (toGraphQLArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

logoBackgroundColor :: SelectionSet Scope__App String
logoBackgroundColor = selectionForField
                      "logoBackgroundColor"
                      []
                      graphqlDefaultResponseScalarDecoder

type LogoUrlInputRowOptional r = ( size :: Optional Int | r )

type LogoUrlInput = { | LogoUrlInputRowOptional + () }

logoUrl :: LogoUrlInput -> SelectionSet Scope__App Uri
logoUrl input = selectionForField
                "logoUrl"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__App String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

slug :: SelectionSet Scope__App String
slug = selectionForField "slug" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__App DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__App Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
