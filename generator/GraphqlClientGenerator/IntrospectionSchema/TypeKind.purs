module GraphqlClientGenerator.IntrospectionSchema.TypeKind where

import Prelude

import Data.Generic.Rep (class Generic) as GenericRep
import Data.Generic.Rep.Show (genericShow) as GenericRep
import GraphqlClient.GraphqlEnum as GraphqlClient.GraphqlEnum
import GraphqlClient.Implementation as GraphqlClient.Implementation

data TypeKind
  = Scalar
  | Object
  | Interface
  | Union
  | Enum
  | InputObject
  | List
  | NonNull

derive instance eqTypeKind :: Eq TypeKind

derive instance genericTypeKind :: GenericRep.Generic TypeKind _

instance showTypeKind :: Show TypeKind where show = GenericRep.genericShow

instance typeKindGraphqlDefaultResponseScalarDecoder :: GraphqlClient.Implementation.GraphqlDefaultResponseScalarDecoder TypeKind where
  graphqlDefaultResponseScalarDecoder = GraphqlClient.GraphqlEnum.genericDecodeGraphqlEnum
