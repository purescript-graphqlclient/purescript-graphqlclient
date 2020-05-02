module Fernet.Introspection.Schema.Fields where

import Data.Identity
import Fernet.Graphql.SelectionSet
import Protolude

import Fernet.Introspection.Schema.Fields.InputValue as Fernet.Introspection.Schema.Fields.InputValue
import Fernet.Introspection.Schema.Fields.TypeRef as Fernet.Introspection.Schema.Fields.TypeRef

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
__schema = selectionForCompositeField "__schema" []

queryType :: ∀ r . SelectionSet InstorpectionQueryResult_QueryType r -> SelectionSet InstorpectionQueryResult_Schema r
queryType = selectionForCompositeField "queryType" []

queryType_name :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_name = selectionForField "name"

queryType_description :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_description = selectionForField "description"

mutationType :: ∀ r . SelectionSet InstorpectionQueryResult_MutationType r -> SelectionSet InstorpectionQueryResult_Schema (Maybe r)
mutationType = selectionForCompositeField "mutationType" []

mutationType_name :: SelectionSet InstorpectionQueryResult_MutationType String
mutationType_name = selectionForField "name"

subscriptionType :: ∀ r . SelectionSet InstorpectionQueryResult_SubscriptionType r -> SelectionSet InstorpectionQueryResult_Schema (Maybe r)
subscriptionType = selectionForCompositeField "subscriptionType" []

subscriptionType_name :: SelectionSet InstorpectionQueryResult_SubscriptionType String
subscriptionType_name = selectionForField "name"

types :: ∀ r . SelectionSet InstorpectionQueryResult_Types r -> SelectionSet InstorpectionQueryResult_Schema (Array r)
types = selectionForCompositeField "types" []

types_kind :: SelectionSet InstorpectionQueryResult_Types String
types_kind = selectionForField "kind"

types_name :: SelectionSet InstorpectionQueryResult_Types String
types_name = selectionForField "name"

types_description :: SelectionSet InstorpectionQueryResult_Types (Maybe String)
types_description = selectionForField "description"

types_fields :: ∀ r . IsDeprecatedInput -> SelectionSet InstorpectionQueryResult_Fields r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_fields inputRecord = selectionForCompositeField "fields" (toGraphqlArguments inputRecord)

types_fields_name :: SelectionSet InstorpectionQueryResult_Fields String
types_fields_name = selectionForField "name"

types_fields_description :: SelectionSet InstorpectionQueryResult_Fields (Maybe String)
types_fields_description = selectionForField "description"

types_fields_args :: ∀ r . SelectionSet Fernet.Introspection.Schema.Fields.InputValue.InstorpectionQueryResult_InputValue r -> SelectionSet InstorpectionQueryResult_Fields (Array r)
types_fields_args = selectionForCompositeField "args" []

types_fields_type :: ∀ r . SelectionSet Fernet.Introspection.Schema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Fields r
types_fields_type = selectionForCompositeField "type" []

types_fields_isDeprecated :: SelectionSet InstorpectionQueryResult_Fields Boolean
types_fields_isDeprecated = selectionForField "isDeprecated"

types_fields_deprecationReason :: SelectionSet InstorpectionQueryResult_Fields (Maybe String)
types_fields_deprecationReason = selectionForField "deprecationReason"

types_inputFields :: ∀ r . SelectionSet Fernet.Introspection.Schema.Fields.InputValue.InstorpectionQueryResult_InputValue r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_inputFields = selectionForCompositeField "inputFields" []

types_interfaces :: ∀ r . SelectionSet Fernet.Introspection.Schema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Types (Maybe $ Array r)
types_interfaces = selectionForCompositeField "interfaces" []

types_enumValues :: ∀ r . IsDeprecatedInput -> SelectionSet InstorpectionQueryResult_EnumValues r -> SelectionSet InstorpectionQueryResult_Types (Maybe <<< Array $ r)
types_enumValues inputRecord = selectionForCompositeField "enumValues" (toGraphqlArguments inputRecord)

types_enumValues_name :: SelectionSet InstorpectionQueryResult_EnumValues String
types_enumValues_name = selectionForField "name"

types_enumValues_description :: SelectionSet InstorpectionQueryResult_EnumValues String
types_enumValues_description = selectionForField "description"

types_enumValues_isDeprecated :: SelectionSet InstorpectionQueryResult_EnumValues Boolean
types_enumValues_isDeprecated = selectionForField "isDeprecated"

types_enumValues_deprecationReason :: SelectionSet InstorpectionQueryResult_EnumValues (Maybe String)
types_enumValues_deprecationReason = selectionForField "deprecationReason"

types_possibleTypes :: ∀ r . SelectionSet Fernet.Introspection.Schema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_Types (Maybe <<< Array $ r)
types_possibleTypes = selectionForCompositeField "possibleTypes" []
