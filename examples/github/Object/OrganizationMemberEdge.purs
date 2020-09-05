module Examples.Github.Object.OrganizationMemberEdge where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__OrganizationMemberEdge, Scope__User)
import Data.Maybe (Maybe)
import Examples.Github.Enum.OrganizationMemberRole (OrganizationMemberRole)

cursor :: SelectionSet Scope__OrganizationMemberEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

hasTwoFactorEnabled :: SelectionSet
                       Scope__OrganizationMemberEdge
                       (Maybe
                        Boolean)
hasTwoFactorEnabled = selectionForField
                      "hasTwoFactorEnabled"
                      []
                      graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__User
                   r -> SelectionSet
                        Scope__OrganizationMemberEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

role :: SelectionSet
        Scope__OrganizationMemberEdge
        (Maybe
         OrganizationMemberRole)
role = selectionForField "role" [] graphqlDefaultResponseScalarDecoder
