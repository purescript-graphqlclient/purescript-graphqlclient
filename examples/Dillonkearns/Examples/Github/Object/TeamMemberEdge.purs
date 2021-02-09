module Dillonkearns.Examples.Github.Object.TeamMemberEdge where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes (Scope__TeamMemberEdge, Scope__User)
import Dillonkearns.Examples.Github.Scalars (Uri)
import Dillonkearns.Examples.Github.Enum.TeamMemberRole (TeamMemberRole)

cursor :: SelectionSet Scope__TeamMemberEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

memberAccessResourcePath :: SelectionSet Scope__TeamMemberEdge Uri
memberAccessResourcePath = selectionForField
                           "memberAccessResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

memberAccessUrl :: SelectionSet Scope__TeamMemberEdge Uri
memberAccessUrl = selectionForField
                  "memberAccessUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

node
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__TeamMemberEdge r
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

role :: SelectionSet Scope__TeamMemberEdge TeamMemberRole
role = selectionForField "role" [] graphqlDefaultResponseScalarDecoder
