module GraphQLClientGenerator.IntrospectionSchema.TypeKind where

import Prelude

import Data.Generic.Rep (class Generic) as GenericRep
import Data.Generic.Rep.Show (genericShow) as GenericRep
import GraphQLClient.GraphQLEnum as GraphQLClient.GraphQLEnum
import GraphQLClient.Implementation as GraphQLClient.Implementation

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

instance typeKindGraphQLDefaultResponseScalarDecoder :: GraphQLClient.Implementation.GraphQLDefaultResponseScalarDecoder TypeKind where
  graphqlDefaultResponseScalarDecoder = GraphQLClient.GraphQLEnum.genericDecodeGraphQLEnum
