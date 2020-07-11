module GraphqlClientGenerator.MakeModule.Lib.WithScopeAndFields where

import Language.PS.AST
import Language.PS.AST.Sugar
import Protolude

import Data.Array as Array
import Data.NonEmpty ((:|))
import Data.String.Extra as StringsExtra
import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKind

imports :: String -> Array ImportDecl
imports apiModuleName =
  [ ImportDecl
    { moduleName: mkModuleName $ "Prelude" :| []
    , names: []
    , qualification: Nothing
    }
  , ImportDecl
    { moduleName: mkModuleName $ "GraphqlClient" :| []
    , names: []
    , qualification: Nothing
    }
  , ImportDecl
    { moduleName: mkModuleName $ "Data" :| ["Maybe"]
    , names: []
    , qualification: Nothing
    }
  , ImportDecl
    { moduleName: mkModuleName $ apiModuleName :| ["Scalar"]
    , names: []
    , qualification: Nothing
    }
  ]

maybeType :: Type -> Type
maybeType typeInside = nonQualifiedNameTypeConstructor "Maybe" `TypeApp` typeInside

arrayType :: Type -> Type
arrayType typeInside = nonQualifiedNameTypeConstructor "Array" `TypeApp` typeInside

typeRefType :: Maybe String -> Type
typeRefType name = nonQualifiedNameTypeConstructor (maybe "ERROR_TYPE_REF_NAME_SHOULD_NOT_BE_NOTHING" StringsExtra.pascalCase name)

typeRefTypeScope :: Maybe String -> Type
typeRefTypeScope name = nonQualifiedNameTypeConstructor (maybe "ERROR_TYPE_REF_NAME_SHOULD_NOT_BE_NOTHING" mkName name)
  where
    mkName :: String -> String
    mkName name' = "Scope__" <> StringsExtra.pascalCase name'

mkFieldTypeWithoutOfType :: { kind :: TypeKind, name :: Maybe String } -> Type
mkFieldTypeWithoutOfType typeRef =
  case typeRef.kind of
       NonNull -> nonQualifiedNameTypeConstructor "ERROR_NOT_NULL_BUT_WITHOUT_TYPE_INSIDE"
       List -> nonQualifiedNameTypeConstructor "ERROR_NOT_NULL_BUT_WITHOUT_TYPE_INSIDE"
       Scalar -> typeRefType typeRef.name
       Object -> typeRefTypeScope typeRef.name
       Interface -> typeRefTypeScope typeRef.name
       Union -> typeRefTypeScope typeRef.name
       Enum -> typeRefType typeRef.name
       InputObject -> typeRefType typeRef.name

mkFieldType :: forall a . (a -> Type) -> { kind :: TypeKind, name :: Maybe String, ofType :: Maybe a } -> Type
mkFieldType handleOfType typeRef =
  case typeRef.kind of
       NonNull ->
         case typeRef.ofType of
              Nothing -> nonQualifiedNameTypeConstructor "ERROR_NOT_NULL_BUT_WITHOUT_TYPE_INSIDE"
              Just typeRef' -> maybeType $ handleOfType typeRef'
       Scalar -> typeRefType typeRef.name
       Object -> typeRefTypeScope typeRef.name
       Interface -> typeRefTypeScope typeRef.name
       Union -> typeRefTypeScope typeRef.name
       Enum -> typeRefType typeRef.name
       InputObject -> typeRefType typeRef.name
       List ->
         case typeRef.ofType of
              Nothing -> nonQualifiedNameTypeConstructor "ERROR_LIST_BUT_WITHOUT_TYPE_INSIDE"
              Just typeRef' -> arrayType $ handleOfType typeRef'

declarations :: InstorpectionQueryResult__FullType -> Array Declaration
declarations fullType =
  let
    scopeName = "Scope__" <> StringsExtra.pascalCase fullType.name
  in
    [ DeclData
      { comments: Nothing
      , head: DataHead
          { dataHdName: ProperName scopeName
          , dataHdVars: []
          }
      , constructors: []
      }
    ] <>
      ( fullType.fields
      # fromMaybe []
      <#> (\field ->
        [ DeclSignature
          { comments: Nothing
          , ident: Ident field.name
          , type_:
            nonQualifiedNameTypeConstructor "SelectionSet"
            `TypeApp`
            nonQualifiedNameTypeConstructor scopeName
            `TypeApp`
            mkFieldType (mkFieldType <<< mkFieldType <<< mkFieldType <<< mkFieldType <<< mkFieldType <<< mkFieldType $ mkFieldTypeWithoutOfType) field."type"
          }
        , DeclValue
          { comments: Nothing
          , valueBindingFields:
            { name: Ident field.name
            , binders: []
            , guarded: Unconditional
              { expr:
                nonQualifiedExprIdent "selectionForField"
                `ExprApp`
                ExprString field.name
                `ExprApp`
                ExprArray []
                `ExprApp`
                nonQualifiedExprIdent "graphqlDefaultResponseScalarDecoder"
              , whereBindings: []
              }
            }
          }
        ]
        )
      # Array.concat
      )
