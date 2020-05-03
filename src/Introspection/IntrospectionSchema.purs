module Fernet.Introspection.IntrospectionSchema where

import Fernet.Graphql.SelectionSet
import Fernet.Introspection.Schema.Fields
import Protolude
import Type.Row

import Fernet.Introspection.Schema.Fields.InputValue as Fernet.Introspection.Schema.Fields.InputValue
import Fernet.Introspection.Schema.Fields.TypeRef as Fernet.Introspection.Schema.Fields.TypeRef

type InstorpectionQueryResult
  = { __schema ::
      { queryType :: { name :: String }
      , mutationType :: Maybe { name :: String }
      , subscriptionType :: Maybe { name :: String }
      , types :: Array InstorpectionQueryResult__FullType
      }
    }

type InstorpectionQueryResult__FullType
  = { kind :: String
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

ofTypeStop :: SelectionSet Fernet.Introspection.Schema.Fields.TypeRef.InstorpectionQueryResult_TypeRef (Record (InstorpectionQueryResult__TypeRef_shared ()))
ofTypeStop = { kind: _, name: _ } <$> Fernet.Introspection.Schema.Fields.TypeRef.kind <*> Fernet.Introspection.Schema.Fields.TypeRef.name

ofTypeNest
  :: ∀ r
   . SelectionSet Fernet.Introspection.Schema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r
  -> SelectionSet Fernet.Introspection.Schema.Fields.TypeRef.InstorpectionQueryResult_TypeRef (Record (InstorpectionQueryResult__TypeRef_shared (ofType :: Maybe r)))
ofTypeNest other = { kind: _, name: _, ofType: _ } <$> Fernet.Introspection.Schema.Fields.TypeRef.kind <*> Fernet.Introspection.Schema.Fields.TypeRef.name <*> Fernet.Introspection.Schema.Fields.TypeRef.ofType other

typeRefFragment :: SelectionSet Fernet.Introspection.Schema.Fields.TypeRef.InstorpectionQueryResult_TypeRef InstorpectionQueryResult__TypeRef
typeRefFragment = ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest ofTypeStop

inputValueFragment :: SelectionSet Fernet.Introspection.Schema.Fields.InputValue.InstorpectionQueryResult_InputValue InstorpectionQueryResult__InputValue
inputValueFragment = { name: _ , description: _ , type: _ , defaultValue: _ }
  <$> Fernet.Introspection.Schema.Fields.InputValue.name
  <*> Fernet.Introspection.Schema.Fields.InputValue.description
  <*> Fernet.Introspection.Schema.Fields.InputValue.type_ typeRefFragment
  <*> Fernet.Introspection.Schema.Fields.InputValue.defaultValue

introspectionQuery :: Boolean -> SelectionSet RootQuery InstorpectionQueryResult
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
