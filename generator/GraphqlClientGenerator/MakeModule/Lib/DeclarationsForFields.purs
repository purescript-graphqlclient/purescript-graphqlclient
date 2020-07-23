module GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields where

import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__Field, InstorpectionQueryResult__InputValue)
import GraphqlClientGenerator.MakeModule.Lib.Utils (qualifyScope)
import Language.PS.SmartCST (Binder(..), DataHead(..), Declaration(..), Expr(..), Guarded(..), Ident(..), Label(..), ModuleName, OpName(..), ProperName(..), Row, SmartQualifiedName(..), Type(..), TypeVarBinding(..), arrayType, emptyRow, maybeType, mkModuleName, (====>>))
import Protolude (type ($), Maybe(..), const, isJust, map, maybe, not, (#), ($), (<#>), (<<<), (<>), (||))

import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra
import GraphqlClientGenerator.IntrospectionSchema.TypeKindWithNull (TypeKindWithNull(..))

optionalType :: Type -> Type
optionalType = TypeApp (TypeConstructor $ SmartQualifiedName__Simple (mkModuleName (NonEmpty.cons' "GraphqlClient" [])) $ ProperName "Optional")

typeRefTypeScalar :: ModuleName -> String -> Type
typeRefTypeScalar customOrNotScalarModule name =
  let
    objectName' = graphqlTypeToPurescriptType $ StringsExtra.pascalCase name

    isPrimScalar =
      case objectName' of
           "Number" -> true
           "Boolean" -> true
           "String" -> true
           "Int" -> true
           _ -> false
   in if isPrimScalar
        then TypeConstructor (SmartQualifiedName__Ignore (ProperName objectName'))
        else TypeConstructor (SmartQualifiedName__Simple customOrNotScalarModule (ProperName objectName'))

graphqlTypeToPurescriptType :: String -> String
graphqlTypeToPurescriptType =
  case _ of
    "Float" -> "Number"
    x -> x

typeRefTypeNonScalarObjectFromFileInDir :: NonEmptyArray String -> String -> String -> Type
typeRefTypeNonScalarObjectFromFileInDir apiModuleName fromModuleName objectName =
  let
    objectName' = StringsExtra.pascalCase objectName
    moduleName' = mkModuleName $ apiModuleName <> NonEmpty.cons' fromModuleName [objectName']
   in TypeConstructor (SmartQualifiedName__Simple moduleName' (ProperName objectName'))

typeRefTypeNonScalarObjectFromFileInRootDir :: NonEmptyArray String -> String -> String -> Type
typeRefTypeNonScalarObjectFromFileInRootDir apiModuleName fromModuleName objectName =
  let
    objectName' = StringsExtra.pascalCase objectName
    moduleName' = mkModuleName $ apiModuleName <> NonEmpty.cons' fromModuleName []
   in TypeConstructor (SmartQualifiedName__Full moduleName' (ProperName objectName'))

typeRefTypeScopeHole :: Type
typeRefTypeScopeHole = TypeVar $ Ident "r"

type Context =
  { apiModuleName :: NonEmptyArray String
  , scalarModule :: ModuleName
  }

mkFieldTypeWithoutHoleAndMaybe :: Context -> TypeKindWithNull -> Type
mkFieldTypeWithoutHoleAndMaybe context =
  case _ of
       TypeKindWithNull__Null        type_ -> maybeType $ mkFieldTypeWithHoleAndMaybe context type_
       TypeKindWithNull__List        type_ -> arrayType $ mkFieldTypeWithHoleAndMaybe context type_ -- reset to true again
       TypeKindWithNull__Scalar      name  -> typeRefTypeScalar context.scalarModule name
       TypeKindWithNull__Enum        name  -> typeRefTypeNonScalarObjectFromFileInDir context.apiModuleName "Enum" name
       TypeKindWithNull__InputObject name  -> typeRefTypeNonScalarObjectFromFileInRootDir context.apiModuleName "InputObject" name
       TypeKindWithNull__Object      name  -> typeRefTypeNonScalarObjectFromFileInDir context.apiModuleName "Object" name
       TypeKindWithNull__Interface   name  -> typeRefTypeNonScalarObjectFromFileInDir context.apiModuleName "Interface" name
       TypeKindWithNull__Union       name  -> typeRefTypeNonScalarObjectFromFileInDir context.apiModuleName "Union" name

mkFieldTypeWithoutHoleAndOptionalForTopLevel :: Context -> TypeKindWithNull -> Type
mkFieldTypeWithoutHoleAndOptionalForTopLevel context =
  case _ of
       TypeKindWithNull__Null type_ -> optionalType $ mkFieldTypeWithoutHoleAndMaybe context type_
       other -> mkFieldTypeWithoutHoleAndMaybe context other

mkFieldTypeWithHoleAndMaybe :: Context -> TypeKindWithNull -> Type
mkFieldTypeWithHoleAndMaybe context =
  case _ of
       TypeKindWithNull__Null        type_ -> maybeType $ mkFieldTypeWithHoleAndMaybe context type_
       TypeKindWithNull__List        type_ -> arrayType $ mkFieldTypeWithHoleAndMaybe context type_ -- reset to true again
       TypeKindWithNull__Scalar      name  -> typeRefTypeScalar context.scalarModule name
       TypeKindWithNull__Enum        name  -> typeRefTypeNonScalarObjectFromFileInDir context.apiModuleName "Enum" name
       TypeKindWithNull__InputObject name  -> typeRefTypeNonScalarObjectFromFileInRootDir context.apiModuleName "InputObject" name
       TypeKindWithNull__Object      _     -> typeRefTypeScopeHole
       TypeKindWithNull__Interface   _     -> typeRefTypeScopeHole
       TypeKindWithNull__Union       _     -> typeRefTypeScopeHole

mkFieldTypeWithHoleAndOptionalForTopLevel :: Context -> TypeKindWithNull -> Type
mkFieldTypeWithHoleAndOptionalForTopLevel context =
  case _ of
       TypeKindWithNull__Null type_ -> optionalType $ mkFieldTypeWithHoleAndMaybe context type_
       other -> mkFieldTypeWithHoleAndMaybe context other

nameOfTheObjectLikeTypeKind :: TypeKindWithNull -> Maybe String
nameOfTheObjectLikeTypeKind = case _ of
  TypeKindWithNull__Null        _type -> nameOfTheObjectLikeTypeKind _type
  TypeKindWithNull__List        _type -> nameOfTheObjectLikeTypeKind _type
  TypeKindWithNull__Scalar      _     -> Nothing
  TypeKindWithNull__Enum        _     -> Nothing
  TypeKindWithNull__InputObject _     -> Nothing
  TypeKindWithNull__Object      s     -> Just s -- just like in mkFieldTypeWithHoleAndMaybe
  TypeKindWithNull__Interface   s     -> Just s
  TypeKindWithNull__Union       s     -> Just s

isOptionalInputValue :: InstorpectionQueryResult__InputValue -> Boolean
isOptionalInputValue inputValue =
  isJust inputValue.defaultValue
  || case inputValue."type" of
          TypeKindWithNull__Null _ -> true
          _ -> false

filterAndNonEmpty
  :: (InstorpectionQueryResult__InputValue -> Boolean)
  -> Array InstorpectionQueryResult__InputValue
  -> Maybe $ NonEmptyArray InstorpectionQueryResult__InputValue
filterAndNonEmpty pred = NonEmpty.fromFoldable <<< Array.mapMaybe (\el -> if pred el then Just el else Nothing)

toRow
  :: (TypeKindWithNull -> Type)
  -> NonEmptyArray InstorpectionQueryResult__InputValue
  -> Row
toRow mkType els =
  { rowLabels: NonEmpty.toArray els <#> \el -> { label: Label el.name, type_: mkType el."type" }
  , rowTail: Just (TypeVar $ Ident "r")
  }

rowPlus :: Type -> Type -> Type
rowPlus x y = TypeOp x (SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Type" ["Row"]) $ OpName "+") y

toRowType :: String -> Maybe Row -> Array Declaration
toRowType name =
  maybe
  []
  (\row ->
    [ DeclType
      { comments: Nothing
      , head: DataHead
        { dataHdName: ProperName $ name
        , dataHdVars: [TypeVarName (Ident "r")]
        }
      , type_: TypeRow row
      }
    ]
  )

declInput :: Context -> String -> Array InstorpectionQueryResult__InputValue -> Array Declaration
declInput context parentName args =
  let
    rowOptional :: Maybe Row
    rowOptional = filterAndNonEmpty isOptionalInputValue args <#> toRow (mkFieldTypeWithHoleAndOptionalForTopLevel context)

    rowRequired :: Maybe Row
    rowRequired = filterAndNonEmpty (not <<< isOptionalInputValue) args <#> toRow (mkFieldTypeWithHoleAndMaybe context)
  in
    (toRowType (parentName <> "InputRowOptional") rowOptional) <>
    (toRowType (parentName <> "InputRowRequired") rowRequired) <>
    [ DeclType
      { comments: Nothing
      , head: DataHead
        { dataHdName: ProperName $ parentName <> "Input"
        , dataHdVars: []
        }
      , type_: TypeRecord
        { rowLabels: []
        , rowTail:
          let
            rowOptional' :: Maybe Type
            rowOptional' = map (const (TypeConstructor $ SmartQualifiedName__Ignore $ ProperName $ parentName <> "InputRowOptional")) rowOptional

            rowRequired' :: Maybe Type
            rowRequired' = map (const (TypeConstructor $ SmartQualifiedName__Ignore $ ProperName $ parentName <> "InputRowRequired")) rowRequired

            rowOptional'' :: Maybe (Type -> Type)
            rowOptional'' = rowOptional' <#> rowPlus

            rowRequired'' :: Maybe (Type -> Type)
            rowRequired'' = rowRequired' <#> rowPlus
            in case rowOptional'' of
                    Nothing ->
                      case rowRequired'' of
                          Nothing -> Just $ TypeVar $ Ident "ERROR"
                          Just rowRequired''' -> Just $ rowRequired''' (TypeRow emptyRow)
                    Just rowOptional''' ->
                      case rowRequired'' of
                          Nothing -> Just $ rowOptional''' (TypeRow emptyRow)
                          Just rowRequired''' -> Just $ rowOptional''' $ rowRequired''' (TypeRow emptyRow)
        }
      }
    ]

declarationsForField :: Context -> (String -> String) -> String -> InstorpectionQueryResult__Field -> Array Declaration
declarationsForField context nameToScope parentName field =
  (if Array.null field.args then [] else declInput context (StringsExtra.pascalCase field.name) field.args) <>
  [ DeclSignature
    { comments: Nothing
    , ident: Ident field.name
    , type_:
      let
        input :: Maybe Type
        input =
          if Array.null field.args
            then Nothing
            else Just $ TypeConstructor $ SmartQualifiedName__Ignore $ ProperName $ StringsExtra.pascalCase field.name <> "Input"

        maybeWrapInInput :: Type -> Type
        maybeWrapInInput x =
          case input of
              Nothing -> x
              (Just inputType) -> inputType ====>> x

        inside :: Type
        inside =
          (TypeConstructor $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphqlClient" []) $ ProperName "SelectionSet")
          `TypeApp`
          (TypeConstructor $ qualifyScope context.apiModuleName (nameToScope parentName))
          `TypeApp`
          (mkFieldTypeWithHoleAndMaybe context field."type")
        in case nameOfTheObjectLikeTypeKind field."type" of
                Just name ->
                  let
                    insideDecoderAndResult :: Type
                    insideDecoderAndResult =
                      ( (TypeConstructor $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphqlClient" []) $ ProperName "SelectionSet")
                        `TypeApp`
                        (TypeConstructor $ qualifyScope context.apiModuleName (nameToScope name))
                        `TypeApp`
                        (TypeVar $ Ident "r")
                      )
                      ====>>
                      inside
                  in TypeForall (NonEmpty.singleton (TypeVarName $ Ident "r")) (maybeWrapInInput insideDecoderAndResult)
                Nothing -> maybeWrapInInput inside
    }
  , DeclValue
    { comments: Nothing
    , valueBindingFields:
        { name: Ident field.name
        , binders:
            if Array.null field.args
              then []
              else [BinderVar (Ident "input")]
        , guarded:
            let
              inputArg :: Expr
              inputArg =
                if Array.null field.args
                  then ExprArray []
                  else
                    (ExprIdent $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphqlClient" []) $ Ident "toGraphqlArguments")
                    `ExprApp`
                    (ExprVar $ Ident "input")
            in Unconditional
              { expr: case nameOfTheObjectLikeTypeKind field."type" of
                  Nothing ->
                    (ExprIdent $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphqlClient" []) $ Ident "selectionForField")
                    `ExprApp`
                    (ExprString field.name)
                    `ExprApp`
                    inputArg
                    `ExprApp`
                    (ExprIdent $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphqlClient" []) $ Ident "graphqlDefaultResponseScalarDecoder")
                  Just _ ->
                    (ExprIdent $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphqlClient" []) $ Ident "selectionForCompositeField")
                    `ExprApp`
                    (ExprString field.name)
                    `ExprApp`
                    inputArg
                    `ExprApp`
                    (ExprIdent $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphqlClient" []) $ Ident "graphqlDefaultResponseFunctorOrScalarDecoderTransformer")
              , whereBindings: []
              }
        }
      }
  ]

declarationsForFields :: Context -> (String -> String) -> String -> Array InstorpectionQueryResult__Field -> Array Declaration
declarationsForFields context nameToScope parentName fields =
  fields
  <#> declarationsForField context nameToScope parentName
  # Array.concat
