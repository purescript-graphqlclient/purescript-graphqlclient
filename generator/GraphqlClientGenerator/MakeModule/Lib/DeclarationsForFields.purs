module GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields where

import Language.PS.CST
import Language.PS.CST.Sugar
import Protolude

import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.List ((:))
import Data.List as List
import Data.String.Extra as StringsExtra
import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKindWithNull (TypeKindWithNull(..))

applyToConstructorType :: String -> Type -> Type
applyToConstructorType name typeInside = nonQualifiedNameTypeConstructor name `TypeApp` typeInside

typeRefType :: String -> Type
typeRefType = StringsExtra.pascalCase >>> graphqlTypeToPurescriptType >>> nonQualifiedNameTypeConstructor

graphqlTypeToPurescriptType :: String -> String
graphqlTypeToPurescriptType =
  case _ of
    "Float" -> "Number"
    x -> x

typeRefTypeScopeHole :: Type
typeRefTypeScopeHole = nonQualifiedNameTypeConstructor "r"

mkFieldTypeWithoutHoleAndMaybe :: TypeKindWithNull -> Type
mkFieldTypeWithoutHoleAndMaybe =
  case _ of
       TypeKindWithNull__Null        type_ -> applyToConstructorType "Maybe" $ mkFieldTypeWithHoleAndMaybe type_
       TypeKindWithNull__List        type_ -> applyToConstructorType "Array" $ mkFieldTypeWithHoleAndMaybe type_ -- reset to true again
       TypeKindWithNull__Scalar      name  -> typeRefType name
       TypeKindWithNull__Enum        name  -> typeRefType name
       TypeKindWithNull__InputObject name  -> typeRefType name
       TypeKindWithNull__Object      name  -> typeRefType name
       TypeKindWithNull__Interface   name  -> typeRefType name
       TypeKindWithNull__Union       name  -> typeRefType name

mkFieldTypeWithoutHoleAndOptionalForTopLevel :: TypeKindWithNull -> Type
mkFieldTypeWithoutHoleAndOptionalForTopLevel =
  case _ of
       TypeKindWithNull__Null type_ -> applyToConstructorType "Optional" $ mkFieldTypeWithoutHoleAndMaybe type_
       other -> mkFieldTypeWithoutHoleAndMaybe other

mkFieldTypeWithHoleAndMaybe :: TypeKindWithNull -> Type
mkFieldTypeWithHoleAndMaybe =
  case _ of
       TypeKindWithNull__Null        type_ -> applyToConstructorType "Maybe" $ mkFieldTypeWithHoleAndMaybe type_
       TypeKindWithNull__List        type_ -> applyToConstructorType "Array" $ mkFieldTypeWithHoleAndMaybe type_ -- reset to true again
       TypeKindWithNull__Scalar      name  -> typeRefType name
       TypeKindWithNull__Enum        name  -> typeRefType name
       TypeKindWithNull__InputObject name  -> typeRefType name
       TypeKindWithNull__Object      _     -> typeRefTypeScopeHole
       TypeKindWithNull__Interface   _     -> typeRefTypeScopeHole
       TypeKindWithNull__Union       _     -> typeRefTypeScopeHole

mkFieldTypeWithHoleAndOptionalForTopLevel :: TypeKindWithNull -> Type
mkFieldTypeWithHoleAndOptionalForTopLevel =
  case _ of
       TypeKindWithNull__Null type_ -> applyToConstructorType "Optional" $ mkFieldTypeWithHoleAndMaybe type_
       other -> mkFieldTypeWithHoleAndMaybe other

nameOfTheObjectLikeTypeKind :: TypeKindWithNull -> Maybe String
nameOfTheObjectLikeTypeKind = case _ of
  TypeKindWithNull__Null        _type -> nameOfTheObjectLikeTypeKind _type
  TypeKindWithNull__List        _type -> nameOfTheObjectLikeTypeKind _type
  TypeKindWithNull__Scalar      _     -> Nothing
  TypeKindWithNull__Enum        _     -> Nothing
  TypeKindWithNull__InputObject s     -> Just s
  TypeKindWithNull__Object      s     -> Just s
  TypeKindWithNull__Interface   s     -> Just s
  TypeKindWithNull__Union       _     -> Nothing

isOptionalTypeKindWithNull :: InstorpectionQueryResult__InputValue -> Boolean
isOptionalTypeKindWithNull inputValue =
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
toRow mkType els = Row
  { rowLabels: NonEmpty.toArray els <#> \el -> { label: Label el.name, type_: mkType el."type" }
  , rowTail: Just (TypeVar $ Ident "r")
  }

rowPlus :: Type -> Type -> Type
rowPlus x y = TypeOp x (nonQualifiedName $ OpName "+") y

emptyRow :: Type
emptyRow = TypeRow $ Row
  { rowLabels: []
  , rowTail: Nothing
  }

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

declInput :: String -> Array InstorpectionQueryResult__InputValue -> Array Declaration
declInput parentName args =
  let
    rowOptional :: Maybe Row
    rowOptional = filterAndNonEmpty isOptionalTypeKindWithNull args <#> toRow mkFieldTypeWithHoleAndOptionalForTopLevel

    rowRequired :: Maybe Row
    rowRequired = filterAndNonEmpty (not <<< isOptionalTypeKindWithNull) args <#> toRow mkFieldTypeWithHoleAndMaybe
  in
    (toRowType (parentName <> "InputRowOptional") rowOptional) <>
    (toRowType (parentName <> "InputRowRequired") rowRequired) <>
    [ DeclType
      { comments: Nothing
      , head: DataHead
        { dataHdName: ProperName $ parentName <> "Input"
        , dataHdVars: []
        }
      , type_: TypeRecord $ Row
        { rowLabels: []
        , rowTail:
          let
            rowOptional' :: Maybe Type
            rowOptional' = map (const (TypeConstructor $ nonQualifiedName $ ProperName "RefsInputRowOptional")) rowOptional

            rowRequired' :: Maybe Type
            rowRequired' = map (const (TypeConstructor $ nonQualifiedName $ ProperName "RefsInputRowRequired")) rowRequired

            rowOptional'' :: Maybe (Type -> Type)
            rowOptional'' = rowOptional' <#> rowPlus

            rowRequired'' :: Maybe (Type -> Type)
            rowRequired'' = rowRequired' <#> rowPlus
            in case rowOptional'' of
                    Nothing ->
                      case rowRequired'' of
                          Nothing -> Just $ TypeVar $ Ident "ERROR"
                          Just rowRequired''' -> Just $ rowRequired''' emptyRow
                    Just rowOptional''' ->
                      case rowRequired'' of
                          Nothing -> Just $ rowOptional''' emptyRow
                          Just rowRequired''' -> Just $ rowRequired''' $ rowRequired''' emptyRow
        }
      }
    ]

declarationsForField :: (String -> String) -> String -> InstorpectionQueryResult__Field -> Array Declaration
declarationsForField nameToScope parentName field =
  (if Array.null field.args then [] else declInput (StringsExtra.pascalCase field.name) field.args) <>
  [ DeclSignature
    { comments: Nothing
    , ident: Ident field.name
    , type_:
      let
        input :: Maybe Type
        input =
          if Array.null field.args
            then Nothing
            else Just $ nonQualifiedNameTypeConstructor $ StringsExtra.pascalCase field.name <> "Input"

        maybeWrapInInput :: Type -> Type
        maybeWrapInInput x =
          case input of
              Nothing -> x
              (Just inputType) -> inputType ====>> x

        inside :: Type
        inside =
          nonQualifiedNameTypeConstructor "SelectionSet"
          `TypeApp`
          nonQualifiedNameTypeConstructor (nameToScope parentName)
          `TypeApp`
          mkFieldTypeWithHoleAndMaybe field."type"
        in case nameOfTheObjectLikeTypeKind field."type" of
                Just name ->
                  let
                    insideDecoderAndResult :: Type
                    insideDecoderAndResult =
                      ( nonQualifiedNameTypeConstructor "SelectionSet"
                      `TypeApp`
                      (nonQualifiedNameTypeConstructor $ nameToScope name)
                      `TypeApp`
                      typeVar "r"
                      )
                      ====>>
                      inside
                  in TypeForall (NonEmpty.singleton (typeVarName "r")) (maybeWrapInInput insideDecoderAndResult)
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
                  else nonQualifiedExprIdent "toGraphqlArguments" `ExprApp` nonQualifiedExprIdent "input"
            in Unconditional
              { expr: case nameOfTheObjectLikeTypeKind field."type" of
                  Nothing ->
                    nonQualifiedExprIdent "selectionForField"
                    `ExprApp`
                    ExprString field.name
                    `ExprApp`
                    inputArg
                    `ExprApp`
                    nonQualifiedExprIdent "graphqlDefaultResponseScalarDecoder"
                  Just _ ->
                    nonQualifiedExprIdent "selectionForCompositeField"
                    `ExprApp`
                    ExprString field.name
                    `ExprApp`
                    inputArg
                    `ExprApp`
                    nonQualifiedExprIdent "graphqlDefaultResponseFunctorOrScalarDecoderTransformer"
              , whereBindings: []
              }
        }
      }
  ]

declarationsForFields :: (String -> String) -> String -> Array InstorpectionQueryResult__Field -> Array Declaration
declarationsForFields nameToScope parentName fields =
  fields
  <#> declarationsForField nameToScope parentName
  # Array.concat
