module Examples.Github.Object.IpAllowListEntry where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__IpAllowListEntry, Scope__IpAllowListOwner)
import Examples.Github.Scalars (DateTime, Id)
import Data.Maybe (Maybe)

allowListValue :: SelectionSet Scope__IpAllowListEntry String
allowListValue = selectionForField
                 "allowListValue"
                 []
                 graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__IpAllowListEntry DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__IpAllowListEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isActive :: SelectionSet Scope__IpAllowListEntry Boolean
isActive = selectionForField "isActive" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__IpAllowListEntry (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

owner :: forall r . SelectionSet
                    Scope__IpAllowListOwner
                    r -> SelectionSet
                         Scope__IpAllowListEntry
                         r
owner = selectionForCompositeField
        "owner"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

updatedAt :: SelectionSet Scope__IpAllowListEntry DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
