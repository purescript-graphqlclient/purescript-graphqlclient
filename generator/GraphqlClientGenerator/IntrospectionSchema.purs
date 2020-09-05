module GraphqlClientGenerator.IntrospectionSchema where

import GraphqlClient.Implementation (Scope__RootQuery, SelectionSet, bindSelectionSet)
import GraphqlClient.WriteGraphqlHash (Cache)

import GraphqlClientGenerator.IntrospectionSchema.TypeKindWithNull (InstorpectionQueryResult__TypeRef, InstorpectionQueryResult__TypeRef_shared, TypeKindWithNull, collectTypeRefInfo)
import Protolude (type ($), type (<<<), Maybe, apply, map, note, (#), ($), (<$>), (<*>))

import Data.Argonaut.Decode (JsonDecodeError(..))
import GraphqlClientGenerator.IntrospectionSchema.Fields (__schema, mutationType, mutationType_name, queryType, queryType_name, subscriptionType, subscriptionType_name, types, types_description, types_enumValues, types_enumValues_deprecationReason, types_enumValues_description, types_enumValues_isDeprecated, types_enumValues_name, types_fields, types_fields_args, types_fields_deprecationReason, types_fields_description, types_fields_isDeprecated, types_fields_name, types_fields_type, types_inputFields, types_interfaces, types_kind, types_name, types_possibleTypes)
import GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue as GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue
import GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef as GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef
import GraphqlClientGenerator.IntrospectionSchema.TypeKind (TypeKind)
import Unsafe.Coerce (unsafeCoerce)

type InstorpectionQueryResult
  = { __schema ::
      { queryType :: { name :: String }
      , mutationType :: Maybe { name :: String }
      , subscriptionType :: Maybe { name :: String }
      , types :: Array InstorpectionQueryResult__FullType
      }
    }

type InstorpectionQueryResult__Field =
  { name :: String
  , description :: Maybe String
  , args :: Array InstorpectionQueryResult__InputValue
  , type :: TypeKindWithNull
  , isDeprecated :: Boolean
  , deprecationReason :: Maybe String
  }

type InstorpectionQueryResult__EnumValue =
  { name :: String
  , description :: Maybe String
  , isDeprecated :: Boolean
  , deprecationReason :: Maybe String
  }

type InstorpectionQueryResult__FullType
  = { kind :: TypeKind
    , name :: String
    , description :: Maybe String
    , fields :: Maybe (Array InstorpectionQueryResult__Field)
    , inputFields :: Maybe (Array InstorpectionQueryResult__InputValue)
    , interfaces :: Maybe (Array TypeKindWithNull)
    , enumValues :: Maybe <<< Array $ InstorpectionQueryResult__EnumValue
    , possibleTypes :: Maybe <<< Array $ TypeKindWithNull
    }

type InstorpectionQueryResult__InputValue
  = { name :: String
    , description :: Maybe String
    , type :: TypeKindWithNull
    , defaultValue :: Maybe String
    }

typeRefFragment :: (Maybe Cache -> String -> String) -> SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef InstorpectionQueryResult__TypeRef
typeRefFragment fieldNameFn = ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest ofTypeStop
  where
    ofTypeStop :: SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef (Record (InstorpectionQueryResult__TypeRef_shared ()))
    ofTypeStop =
      { kind: _, name: _ }
      <$> GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.kind fieldNameFn
      <*> GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.name fieldNameFn

    ofTypeNest
      :: ∀ r
       . SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r
      -> SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef (Record (InstorpectionQueryResult__TypeRef_shared (ofType :: Maybe r)))
    ofTypeNest other =
      { kind: _, name: _, ofType: _ }
      <$> GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.kind fieldNameFn
      <*> GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.name fieldNameFn
      <*> GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.ofType fieldNameFn other

typeKindWithNullFragment :: (Maybe Cache -> String -> String) -> SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef TypeKindWithNull
typeKindWithNullFragment fieldNameFn = bindSelectionSet (\typeRef -> collectTypeRefInfo typeRef # note (Named "TypeKindWithNull" $ UnexpectedValue $ unsafeCoerce typeRef)) (typeRefFragment fieldNameFn)

inputValueFragment :: (Maybe Cache -> String -> String) -> SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.InstorpectionQueryResult_InputValue InstorpectionQueryResult__InputValue
inputValueFragment fieldNameFn = { name: _ , description: _ , type: _ , defaultValue: _ }
  <$> GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.name fieldNameFn
  <*> GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.description fieldNameFn
  <*> GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.type_ fieldNameFn (typeKindWithNullFragment fieldNameFn)
  <*> GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.defaultValue fieldNameFn

introspectionQuery :: (Maybe Cache -> String -> String) -> Boolean -> SelectionSet Scope__RootQuery InstorpectionQueryResult
introspectionQuery fieldNameFn includeDeprecated =
  __schema fieldNameFn ado
    queryType'        <- queryType fieldNameFn $ { name: _ } <$> queryType_name fieldNameFn
    mutationType'     <- mutationType fieldNameFn $ { name: _ } <$> mutationType_name fieldNameFn
    subscriptionType' <- subscriptionType fieldNameFn $ { name: _ } <$> subscriptionType_name fieldNameFn
    types'            <- types fieldNameFn ado
      types_kind'          <- types_kind fieldNameFn
      types_name'          <- types_name fieldNameFn
      types_description'   <- types_description fieldNameFn
      types_fields'        <- types_fields fieldNameFn ({ includeDeprecated }) $
        { name: _
        , description: _
        , args: _
        , type: _
        , isDeprecated: _
        , deprecationReason: _
        } <$> types_fields_name fieldNameFn
          <*> types_fields_description fieldNameFn
          <*> types_fields_args fieldNameFn (inputValueFragment fieldNameFn)
          <*> types_fields_type fieldNameFn (typeKindWithNullFragment fieldNameFn)
          <*> types_fields_isDeprecated fieldNameFn
          <*> types_fields_deprecationReason fieldNameFn
      types_inputFields' <- types_inputFields fieldNameFn (inputValueFragment fieldNameFn)
      types_interfaces' <- types_interfaces fieldNameFn (typeKindWithNullFragment fieldNameFn)
      types_enumValues' <- types_enumValues fieldNameFn ({ includeDeprecated }) $
        { name: _
        , description: _
        , isDeprecated: _
        , deprecationReason: _
        } <$> types_enumValues_name fieldNameFn
          <*> types_enumValues_description fieldNameFn
          <*> types_enumValues_isDeprecated fieldNameFn
          <*> types_enumValues_deprecationReason fieldNameFn
      types_possibleTypes' <- types_possibleTypes fieldNameFn (typeKindWithNullFragment fieldNameFn)
      in { kind: types_kind'
         , name: types_name'
         , description: types_description'
         , fields: types_fields'
         , inputFields: types_inputFields'
         , interfaces: types_interfaces'
         , enumValues: types_enumValues'
         , possibleTypes: types_possibleTypes'
         }
    in { __schema:
          { queryType: queryType'
          , mutationType: mutationType'
          , subscriptionType: subscriptionType'
          , types: types'
          }
       }
