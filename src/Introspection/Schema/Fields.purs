module Fernet.Introspection.Schema.Fields where

import Protolude
import Data.Identity
import Fernet.Graphql.SelectionSet

data InstorpectionQueryResult_Schema
data InstorpectionQueryResult_QueryType
data InstorpectionQueryResult_MutationType
data InstorpectionQueryResult_SubscriptionType
data InstorpectionQueryResult_Types
data InstorpectionQueryResult_EnumValues
data InstorpectionQueryResult_PossibleTypes

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

type Types_EnumValues_Input = { includeDeprecated :: Boolean }

types_enumValues :: ∀ r . Types_EnumValues_Input -> SelectionSet InstorpectionQueryResult_EnumValues r -> SelectionSet InstorpectionQueryResult_Types (Maybe <<< Array $ r)
types_enumValues inputRecord = selectionForCompositeField "enumValues" (toGraphqlArguments inputRecord)

types_enumValues_name :: SelectionSet InstorpectionQueryResult_EnumValues String
types_enumValues_name = selectionForField "name"

types_enumValues_description :: SelectionSet InstorpectionQueryResult_EnumValues String
types_enumValues_description = selectionForField "description"

types_enumValues_isDeprecated :: SelectionSet InstorpectionQueryResult_EnumValues Boolean
types_enumValues_isDeprecated = selectionForField "isDeprecated"

types_enumValues_deprecationReason :: SelectionSet InstorpectionQueryResult_EnumValues (Maybe String)
types_enumValues_deprecationReason = selectionForField "deprecationReason"

types_possibleTypes :: ∀ r . SelectionSet InstorpectionQueryResult_PossibleTypes r -> SelectionSet InstorpectionQueryResult_Types (Maybe <<< Array $ r)
types_possibleTypes = selectionForCompositeField "possibleTypes" []

types_possibleTypes_kind :: SelectionSet InstorpectionQueryResult_PossibleTypes String
types_possibleTypes_kind = selectionForField "kind"

types_possibleTypes_name :: SelectionSet InstorpectionQueryResult_PossibleTypes String
types_possibleTypes_name = selectionForField "name"

types_possibleTypes_ofType :: ∀ r . SelectionSet InstorpectionQueryResult_PossibleTypes r -> SelectionSet InstorpectionQueryResult_PossibleTypes (Maybe r)
types_possibleTypes_ofType = selectionForCompositeField "ofType" []
