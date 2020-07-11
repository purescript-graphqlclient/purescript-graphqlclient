module GraphqlClientGenerator.IntrospectionSchema where

import GraphqlClient
import GraphqlClientGenerator.IntrospectionSchema.Fields
import GraphqlClientGenerator.IntrospectionSchema.TypeKind
import Protolude
import Type.Row

import GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue as GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue
import GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef as GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef

type InstorpectionQueryResult
  = { __schema ::
      { queryType :: { name :: String }
      , mutationType :: Maybe { name :: String }
      , subscriptionType :: Maybe { name :: String }
      , types :: Array InstorpectionQueryResult__FullType
      }
    }

type InstorpectionQueryResult__FullType
  = { kind :: TypeKind
    , name :: String
    , description :: Maybe String
    , fields :: Maybe $ Array
      { name :: String
      , description :: Maybe String
      , args :: Array InstorpectionQueryResult__InputValue
      , type :: InstorpectionQueryResult__TypeRef
      , isDeprecated :: Boolean
      , deprecationReason :: Maybe String
      }
    , inputFields :: Maybe $ Array InstorpectionQueryResult__InputValue
    , interfaces :: Maybe $ Array InstorpectionQueryResult__TypeRef
    , enumValues :: Maybe <<< Array $
      { name :: String
      , description :: Maybe String
      , isDeprecated :: Boolean
      , deprecationReason :: Maybe String
      }
    , possibleTypes :: Maybe <<< Array $ InstorpectionQueryResult__TypeRef
    }

type InstorpectionQueryResult__InputValue
  = { name :: String
    , description :: Maybe String
    , type :: InstorpectionQueryResult__TypeRef
    , defaultValue :: Maybe String
    }

type InstorpectionQueryResult__TypeRef_shared r = ( kind :: String, name :: Maybe String | r )

-- 7 ofType's
type InstorpectionQueryResult__TypeRef
  = Record
    (InstorpectionQueryResult__TypeRef_shared
    + (ofType :: Maybe $ Record
        (InstorpectionQueryResult__TypeRef_shared
        + (ofType :: Maybe $ Record
            (InstorpectionQueryResult__TypeRef_shared
            + (ofType :: Maybe $ Record
                (InstorpectionQueryResult__TypeRef_shared
                + (ofType :: Maybe $ Record
                    (InstorpectionQueryResult__TypeRef_shared
                    + (ofType :: Maybe $ Record
                        (InstorpectionQueryResult__TypeRef_shared
                        + (ofType :: Maybe $ Record
                            (InstorpectionQueryResult__TypeRef_shared
                            + (ofType :: Maybe $ Record (InstorpectionQueryResult__TypeRef_shared + ())
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )

ofTypeStop :: SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef (Record (InstorpectionQueryResult__TypeRef_shared ()))
ofTypeStop = { kind: _, name: _ } <$> GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.kind <*> GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.name

ofTypeNest
  :: ∀ r
   . SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r
  -> SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef (Record (InstorpectionQueryResult__TypeRef_shared (ofType :: Maybe r)))
ofTypeNest other = { kind: _, name: _, ofType: _ } <$> GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.kind <*> GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.name <*> GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.ofType other

typeRefFragment :: SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef InstorpectionQueryResult__TypeRef
typeRefFragment = ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest ofTypeStop

inputValueFragment :: SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.InstorpectionQueryResult_InputValue InstorpectionQueryResult__InputValue
inputValueFragment = { name: _ , description: _ , type: _ , defaultValue: _ }
  <$> GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.name
  <*> GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.description
  <*> GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.type_ typeRefFragment
  <*> GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue.defaultValue

introspectionQuery :: Boolean -> SelectionSet Scope__RootQuery InstorpectionQueryResult
introspectionQuery includeDeprecated =
  __schema ado
    queryType'        <- queryType $ { name: _ } <$> queryType_name
    mutationType'     <- mutationType $ { name: _ } <$> mutationType_name
    subscriptionType' <- subscriptionType $ { name: _ } <$> subscriptionType_name
    types'            <- types ado
      types_kind'          <- types_kind
      types_name'          <- types_name
      types_description'   <- types_description
      types_fields'        <- types_fields ({ includeDeprecated }) $
        { name: _
        , description: _
        , args: _
        , type: _
        , isDeprecated: _
        , deprecationReason: _
        } <$> types_fields_name
          <*> types_fields_description
          <*> types_fields_args inputValueFragment
          <*> types_fields_type typeRefFragment
          <*> types_fields_isDeprecated
          <*> types_fields_deprecationReason
      types_inputFields' <- types_inputFields inputValueFragment
      types_interfaces' <- types_interfaces typeRefFragment
      types_enumValues' <- types_enumValues ({ includeDeprecated }) $
        { name: _
        , description: _
        , isDeprecated: _
        , deprecationReason: _
        } <$> types_enumValues_name
          <*> types_enumValues_description
          <*> types_enumValues_isDeprecated
          <*> types_enumValues_deprecationReason
      types_possibleTypes' <- types_possibleTypes typeRefFragment
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
