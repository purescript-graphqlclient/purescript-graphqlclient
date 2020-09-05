module GraphqlClientGenerator.IntrospectionSchema.Fields where

import GraphqlClient.Implementation (Scope__RootQuery, SelectionSet, graphqlDefaultResponseFunctorOrScalarDecoderTransformer, graphqlDefaultResponseScalarDecoder, selectionForCompositeFieldImplementation, selectionForFieldImplementation)
import GraphqlClient.WriteGraphqlHash (Cache)
import GraphqlClient.Argument (toGraphqlArguments)

import Protolude (type ($), type (<<<), Maybe)

import GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue as GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue
import GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef as GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef
import GraphqlClientGenerator.IntrospectionSchema.TypeKind (TypeKind)

data InstorpectionQueryResult_Schema
data InstorpectionQueryResult_QueryType
data InstorpectionQueryResult_MutationType
data InstorpectionQueryResult_SubscriptionType
data InstorpectionQueryResult_Types
data InstorpectionQueryResult_EnumValues
data InstorpectionQueryResult_PossibleTypes
data InstorpectionQueryResult_Fields

type IsDeprecatedInput = { includeDeprecated :: Boolean }

__schema :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_Schema r -> SelectionSet Scope__RootQuery r
__schema fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "__schema" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

queryType :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_QueryType r -> SelectionSet InstorpectionQueryResult_Schema r
queryType fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "queryType" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

queryType_name :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_QueryType String
queryType_name fieldNameFn = selectionForFieldImplementation fieldNameFn "name" [] graphqlDefaultResponseScalarDecoder

queryType_description :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_QueryType String
queryType_description fieldNameFn = selectionForFieldImplementation fieldNameFn "description" [] graphqlDefaultResponseScalarDecoder

mutationType :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_MutationType r -> SelectionSet InstorpectionQueryResult_Schema (Maybe r)
mutationType fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "mutationType" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mutationType_name :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_MutationType String
mutationType_name fieldNameFn = selectionForFieldImplementation fieldNameFn "name" [] graphqlDefaultResponseScalarDecoder

subscriptionType :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_SubscriptionType r -> SelectionSet InstorpectionQueryResult_Schema (Maybe r)
subscriptionType fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "subscriptionType" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

subscriptionType_name :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_SubscriptionType String
subscriptionType_name fieldNameFn = selectionForFieldImplementation fieldNameFn "name" [] graphqlDefaultResponseScalarDecoder

types :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_Types r -> SelectionSet InstorpectionQueryResult_Schema (Array r)
types fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "types" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_kind :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_Types TypeKind
types_kind fieldNameFn = selectionForFieldImplementation fieldNameFn "kind" [] graphqlDefaultResponseScalarDecoder

types_name :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_Types String
types_name fieldNameFn = selectionForFieldImplementation fieldNameFn "name" [] graphqlDefaultResponseScalarDecoder

types_description :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_Types (Maybe String)
types_description fieldNameFn = selectionForFieldImplementation fieldNameFn "description" [] graphqlDefaultResponseScalarDecoder

types_fields :: ∀ r . (Maybe Cache -> String -> String) -> IsDeprecatedInput -> SelectionSet InstorpectionQueryResult_Fields r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_fields fieldNameFn inputRecord = selectionForCompositeFieldImplementation fieldNameFn "fields" (toGraphqlArguments inputRecord) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_fields_name :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_Fields String
types_fields_name fieldNameFn = selectionForFieldImplementation fieldNameFn "name" [] graphqlDefaultResponseScalarDecoder

types_fields_description :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_Fields (Maybe String)
types_fields_description fieldNameFn = selectionForFieldImplementation fieldNameFn "description" [] graphqlDefaultResponseScalarDecoder

types_fields_args :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.InstorpectionQueryResult_InputValue r -> SelectionSet InstorpectionQueryResult_Fields (Array r)
types_fields_args fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "args" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_fields_type :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Fields r
types_fields_type fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "type" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_fields_isDeprecated :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_Fields Boolean
types_fields_isDeprecated fieldNameFn = selectionForFieldImplementation fieldNameFn "isDeprecated" [] graphqlDefaultResponseScalarDecoder

types_fields_deprecationReason :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_Fields (Maybe String)
types_fields_deprecationReason fieldNameFn = selectionForFieldImplementation fieldNameFn "deprecationReason" [] graphqlDefaultResponseScalarDecoder

types_inputFields :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.InstorpectionQueryResult_InputValue r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_inputFields fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "inputFields" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_interfaces :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_interfaces fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "interfaces" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_enumValues :: ∀ r . (Maybe Cache -> String -> String) -> IsDeprecatedInput -> SelectionSet InstorpectionQueryResult_EnumValues r -> SelectionSet InstorpectionQueryResult_Types (Maybe <<< Array $ r)
types_enumValues fieldNameFn inputRecord = selectionForCompositeFieldImplementation fieldNameFn "enumValues" (toGraphqlArguments inputRecord) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_enumValues_name :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_EnumValues String
types_enumValues_name fieldNameFn = selectionForFieldImplementation fieldNameFn "name" [] graphqlDefaultResponseScalarDecoder

types_enumValues_description :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_EnumValues (Maybe String)
types_enumValues_description fieldNameFn = selectionForFieldImplementation fieldNameFn "description" [] graphqlDefaultResponseScalarDecoder

types_enumValues_isDeprecated :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_EnumValues Boolean
types_enumValues_isDeprecated fieldNameFn = selectionForFieldImplementation fieldNameFn "isDeprecated" [] graphqlDefaultResponseScalarDecoder

types_enumValues_deprecationReason :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_EnumValues (Maybe String)
types_enumValues_deprecationReason fieldNameFn = selectionForFieldImplementation fieldNameFn "deprecationReason" [] graphqlDefaultResponseScalarDecoder

types_possibleTypes :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Types (Maybe <<< Array $ r)
types_possibleTypes fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "possibleTypes" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
