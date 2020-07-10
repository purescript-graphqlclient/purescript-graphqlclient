module GraphqlClientGenerator.Introspection.Schema.Fields where

import Data.Identity
import GraphqlClient.Implementation
import Protolude

import GraphqlClientGenerator.Introspection.Schema.Fields.InputValue as GraphqlClientGenerator.Introspection.Schema.Fields.InputValue
import GraphqlClientGenerator.Introspection.Schema.Fields.TypeRef as GraphqlClientGenerator.Introspection.Schema.Fields.TypeRef
import GraphqlClientGenerator.Introspection.Schema.TypeKind

data InstorpectionQueryResult_Schema
data InstorpectionQueryResult_QueryType
data InstorpectionQueryResult_MutationType
data InstorpectionQueryResult_SubscriptionType
data InstorpectionQueryResult_Types
data InstorpectionQueryResult_EnumValues
data InstorpectionQueryResult_PossibleTypes
data InstorpectionQueryResult_Fields

type IsDeprecatedInput = { includeDeprecated :: Boolean }

__schema :: ∀ r . SelectionSet InstorpectionQueryResult_Schema r -> SelectionSet RootQuery r
__schema = selectionForCompositeField "__schema" [] graphqlDefaultResponseDecoderTransformer

queryType :: ∀ r . SelectionSet InstorpectionQueryResult_QueryType r -> SelectionSet InstorpectionQueryResult_Schema r
queryType = selectionForCompositeField "queryType" [] graphqlDefaultResponseDecoderTransformer

queryType_name :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

queryType_description :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

mutationType :: ∀ r . SelectionSet InstorpectionQueryResult_MutationType r -> SelectionSet InstorpectionQueryResult_Schema (Maybe r)
mutationType = selectionForCompositeField "mutationType" [] graphqlDefaultResponseDecoderTransformer

mutationType_name :: SelectionSet InstorpectionQueryResult_MutationType String
mutationType_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

subscriptionType :: ∀ r . SelectionSet InstorpectionQueryResult_SubscriptionType r -> SelectionSet InstorpectionQueryResult_Schema (Maybe r)
subscriptionType = selectionForCompositeField "subscriptionType" [] graphqlDefaultResponseDecoderTransformer

subscriptionType_name :: SelectionSet InstorpectionQueryResult_SubscriptionType String
subscriptionType_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

types :: ∀ r . SelectionSet InstorpectionQueryResult_Types r -> SelectionSet InstorpectionQueryResult_Schema (Array r)
types = selectionForCompositeField "types" [] graphqlDefaultResponseDecoderTransformer

types_kind :: SelectionSet InstorpectionQueryResult_Types TypeKind
types_kind = selectionForField "kind" [] graphqlDefaultResponseScalarDecoder

types_name :: SelectionSet InstorpectionQueryResult_Types String
types_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

types_description :: SelectionSet InstorpectionQueryResult_Types (Maybe String)
types_description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

types_fields :: ∀ r . IsDeprecatedInput -> SelectionSet InstorpectionQueryResult_Fields r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_fields inputRecord = selectionForCompositeField "fields" (toGraphqlArguments inputRecord) graphqlDefaultResponseDecoderTransformer

types_fields_name :: SelectionSet InstorpectionQueryResult_Fields String
types_fields_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

types_fields_description :: SelectionSet InstorpectionQueryResult_Fields (Maybe String)
types_fields_description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

types_fields_args :: ∀ r . SelectionSet GraphqlClientGenerator.Introspection.Schema.Fields.InputValue.InstorpectionQueryResult_InputValue r -> SelectionSet InstorpectionQueryResult_Fields (Array r)
types_fields_args = selectionForCompositeField "args" [] graphqlDefaultResponseDecoderTransformer

types_fields_type :: ∀ r . SelectionSet GraphqlClientGenerator.Introspection.Schema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Fields r
types_fields_type = selectionForCompositeField "type" [] graphqlDefaultResponseDecoderTransformer

types_fields_isDeprecated :: SelectionSet InstorpectionQueryResult_Fields Boolean
types_fields_isDeprecated = selectionForField "isDeprecated" [] graphqlDefaultResponseScalarDecoder

types_fields_deprecationReason :: SelectionSet InstorpectionQueryResult_Fields (Maybe String)
types_fields_deprecationReason = selectionForField "deprecationReason" [] graphqlDefaultResponseScalarDecoder

types_inputFields :: ∀ r . SelectionSet GraphqlClientGenerator.Introspection.Schema.Fields.InputValue.InstorpectionQueryResult_InputValue r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_inputFields = selectionForCompositeField "inputFields" [] graphqlDefaultResponseDecoderTransformer

types_interfaces :: ∀ r . SelectionSet GraphqlClientGenerator.Introspection.Schema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_interfaces = selectionForCompositeField "interfaces" [] graphqlDefaultResponseDecoderTransformer

types_enumValues :: ∀ r . IsDeprecatedInput -> SelectionSet InstorpectionQueryResult_EnumValues r -> SelectionSet InstorpectionQueryResult_Types (Maybe <<< Array $ r)
types_enumValues inputRecord = selectionForCompositeField "enumValues" (toGraphqlArguments inputRecord) graphqlDefaultResponseDecoderTransformer

types_enumValues_name :: SelectionSet InstorpectionQueryResult_EnumValues String
types_enumValues_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

types_enumValues_description :: SelectionSet InstorpectionQueryResult_EnumValues (Maybe String)
types_enumValues_description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

types_enumValues_isDeprecated :: SelectionSet InstorpectionQueryResult_EnumValues Boolean
types_enumValues_isDeprecated = selectionForField "isDeprecated" [] graphqlDefaultResponseScalarDecoder

types_enumValues_deprecationReason :: SelectionSet InstorpectionQueryResult_EnumValues (Maybe String)
types_enumValues_deprecationReason = selectionForField "deprecationReason" [] graphqlDefaultResponseScalarDecoder

types_possibleTypes :: ∀ r . SelectionSet GraphqlClientGenerator.Introspection.Schema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Types (Maybe <<< Array $ r)
types_possibleTypes = selectionForCompositeField "possibleTypes" [] graphqlDefaultResponseDecoderTransformer
