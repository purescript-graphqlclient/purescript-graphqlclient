module Examples.Github.Object.EnterpriseServerUserAccountEmailEdge where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__EnterpriseServerUserAccountEmailEdge
  , Scope__EnterpriseServerUserAccountEmail
  )
import Data.Maybe (Maybe)

cursor :: SelectionSet Scope__EnterpriseServerUserAccountEmailEdge String
cursor = selectionForField "cursor" [] graphqlDefaultResponseScalarDecoder

node :: forall r . SelectionSet
                   Scope__EnterpriseServerUserAccountEmail
                   r -> SelectionSet
                        Scope__EnterpriseServerUserAccountEmailEdge
                        (Maybe
                         r)
node = selectionForCompositeField
       "node"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
