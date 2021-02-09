module Dillonkearns.Examples.Github.Object.OrganizationMemberEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__OrganizationMemberEdge, Scope__User)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Enum.OrganizationMemberRole
  (OrganizationMemberRole)

cursor :: SelectionSet Scope__OrganizationMemberEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

hasTwoFactorEnabled
  :: SelectionSet
     Scope__OrganizationMemberEdge
     (Maybe Boolean)
hasTwoFactorEnabled = selectionForField
                      "hasTwoFactorEnabled"
                      []
                      graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__OrganizationMemberEdge (Maybe r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

role
  :: SelectionSet
     Scope__OrganizationMemberEdge
     (Maybe OrganizationMemberRole)
role = selectionForField "role" [] graphqlDefaultResponseScalarDecoder
