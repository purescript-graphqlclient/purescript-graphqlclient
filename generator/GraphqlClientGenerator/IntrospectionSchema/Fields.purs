module GraphqlClientGenerator.IntrospectionSchema.Fields where

import Data.Identity
import GraphqlClient.Implementation
import Protolude

import GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue as GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue
import GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef as GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef
import GraphqlClientGenerator.IntrospectionSchema.TypeKind

data InstorpectionQueryResult_Schema
data InstorpectionQueryResult_QueryType
data InstorpectionQueryResult_MutationType
data InstorpectionQueryResult_SubscriptionType
data InstorpectionQueryResult_Types
data InstorpectionQueryResult_EnumValues
data InstorpectionQueryResult_PossibleTypes
data InstorpectionQueryResult_Fields

type IsDeprecatedInput = { includeDeprecated :: Boolean }

__schema :: ∀ r . SelectionSet InstorpectionQueryResult_Schema r -> SelectionSet Scope__RootQuery r
__schema = selectionForCompositeField "__schema" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

queryType :: ∀ r . SelectionSet InstorpectionQueryResult_QueryType r -> SelectionSet InstorpectionQueryResult_Schema r
queryType = selectionForCompositeField "queryType" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

queryType_name :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

queryType_description :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

mutationType :: ∀ r . SelectionSet InstorpectionQueryResult_MutationType r -> SelectionSet InstorpectionQueryResult_Schema (Maybe r)
mutationType = selectionForCompositeField "mutationType" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

mutationType_name :: SelectionSet InstorpectionQueryResult_MutationType String
mutationType_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

subscriptionType :: ∀ r . SelectionSet InstorpectionQueryResult_SubscriptionType r -> SelectionSet InstorpectionQueryResult_Schema (Maybe r)
subscriptionType = selectionForCompositeField "subscriptionType" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

subscriptionType_name :: SelectionSet InstorpectionQueryResult_SubscriptionType String
subscriptionType_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

types :: ∀ r . SelectionSet InstorpectionQueryResult_Types r -> SelectionSet InstorpectionQueryResult_Schema (Array r)
types = selectionForCompositeField "types" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_kind :: SelectionSet InstorpectionQueryResult_Types TypeKind
types_kind = selectionForField "kind" [] graphqlDefaultResponseScalarDecoder

types_name :: SelectionSet InstorpectionQueryResult_Types String
types_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

types_description :: SelectionSet InstorpectionQueryResult_Types (Maybe String)
types_description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

types_fields :: ∀ r . IsDeprecatedInput -> SelectionSet InstorpectionQueryResult_Fields r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_fields inputRecord = selectionForCompositeField "fields" (toGraphqlArguments inputRecord) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_fields_name :: SelectionSet InstorpectionQueryResult_Fields String
types_fields_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

types_fields_description :: SelectionSet InstorpectionQueryResult_Fields (Maybe String)
types_fields_description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

types_fields_args :: ∀ r . SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.InstorpectionQueryResult_InputValue r -> SelectionSet InstorpectionQueryResult_Fields (Array r)
types_fields_args = selectionForCompositeField "args" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_fields_type :: ∀ r . SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Fields r
types_fields_type = selectionForCompositeField "type" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_fields_isDeprecated :: SelectionSet InstorpectionQueryResult_Fields Boolean
types_fields_isDeprecated = selectionForField "isDeprecated" [] graphqlDefaultResponseScalarDecoder

types_fields_deprecationReason :: SelectionSet InstorpectionQueryResult_Fields (Maybe String)
types_fields_deprecationReason = selectionForField "deprecationReason" [] graphqlDefaultResponseScalarDecoder

types_inputFields :: ∀ r . SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.InstorpectionQueryResult_InputValue r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_inputFields = selectionForCompositeField "inputFields" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_interfaces :: ∀ r . SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_interfaces = selectionForCompositeField "interfaces" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_enumValues :: ∀ r . IsDeprecatedInput -> SelectionSet InstorpectionQueryResult_EnumValues r -> SelectionSet InstorpectionQueryResult_Types (Maybe <<< Array $ r)
types_enumValues inputRecord = selectionForCompositeField "enumValues" (toGraphqlArguments inputRecord) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

types_enumValues_name :: SelectionSet InstorpectionQueryResult_EnumValues String
types_enumValues_name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

types_enumValues_description :: SelectionSet InstorpectionQueryResult_EnumValues (Maybe String)
types_enumValues_description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

types_enumValues_isDeprecated :: SelectionSet InstorpectionQueryResult_EnumValues Boolean
types_enumValues_isDeprecated = selectionForField "isDeprecated" [] graphqlDefaultResponseScalarDecoder

types_enumValues_deprecationReason :: SelectionSet InstorpectionQueryResult_EnumValues (Maybe String)
types_enumValues_deprecationReason = selectionForField "deprecationReason" [] graphqlDefaultResponseScalarDecoder

types_possibleTypes :: ∀ r . SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Types (Maybe <<< Array $ r)
types_possibleTypes = selectionForCompositeField "possibleTypes" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
