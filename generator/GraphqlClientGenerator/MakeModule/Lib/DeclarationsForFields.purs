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
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__Field, InstorpectionQueryResult__InputValue, InstorpectionQueryResult__TypeRef)
import GraphqlClientGenerator.IntrospectionSchema.TypeKind (TypeKind(..))

arrayType :: Type -> Type
arrayType typeInside = nonQualifiedNameTypeConstructor "Array" `TypeApp` typeInside

typeRefType :: Maybe String -> Type
typeRefType name = nonQualifiedNameTypeConstructor (maybe "ERROR_TYPE_REF_NAME_SHOULD_NOT_BE_NOTHING" make name)
  where
    make :: String -> String
    make = StringsExtra.pascalCase >>> graphqlTypeToPurescriptType

graphqlTypeToPurescriptType :: String -> String
graphqlTypeToPurescriptType =
  case _ of
    "Float" -> "Number"
    x -> x

typeRefTypeScope :: Maybe String -> Type
typeRefTypeScope name = nonQualifiedNameTypeConstructor (maybe "ERROR_TYPE_REF_NAME_SHOULD_NOT_BE_NOTHING" (const "r") name)

mkFieldTypeGo :: Boolean -> List { kind :: TypeKind, name :: Maybe String } -> Type
mkFieldTypeGo _ Nil = nonQualifiedNameTypeConstructor "ERROR_NULL_OR_LIST_BUT_WITHOUT_TYPE_INSIDE"
mkFieldTypeGo wrapInMaybe (typeRef : xs) =
  let
    maybeWrap t = if wrapInMaybe then nonQualifiedNameTypeConstructor "Maybe" `TypeApp` t else t
  in case typeRef.kind of
    NonNull     -> mkFieldTypeGo false xs -- next pass is with false
    List        -> arrayType $ mkFieldTypeGo true xs -- reset to true again
    Scalar      -> maybeWrap $ typeRefType typeRef.name
    Enum        -> maybeWrap $ typeRefType typeRef.name
    InputObject -> maybeWrap $ typeRefType typeRef.name
    Object      -> maybeWrap $ typeRefTypeScope typeRef.name
    Interface   -> maybeWrap $ typeRefTypeScope typeRef.name
    Union       -> maybeWrap $ typeRefTypeScope typeRef.name

mkFieldType :: String -> List { kind :: TypeKind, name :: Maybe String } -> Type
mkFieldType topLevelMaybeConstructor Nil = nonQualifiedNameTypeConstructor "ERROR_TOP_LEVEL_WITHOUT_TYPE_INSIDE"
mkFieldType topLevelMaybeConstructor (topLevelTypeRef : xs) =
  let
    wrap t = nonQualifiedNameTypeConstructor topLevelMaybeConstructor `TypeApp` t
  in case topLevelTypeRef.kind of
    NonNull     -> mkFieldTypeGo false xs -- next pass is with false
    List        -> arrayType $ mkFieldTypeGo true xs -- reset to true again
    Scalar      -> wrap $ typeRefType topLevelTypeRef.name
    Enum        -> wrap $ typeRefType topLevelTypeRef.name
    InputObject -> wrap $ typeRefType topLevelTypeRef.name
    Object      -> wrap $ typeRefTypeScope topLevelTypeRef.name
    Interface   -> wrap $ typeRefTypeScope topLevelTypeRef.name
    Union       -> wrap $ typeRefTypeScope topLevelTypeRef.name

collectTypeRefInfo :: InstorpectionQueryResult__TypeRef -> List { kind :: TypeKind, name :: Maybe String }
collectTypeRefInfo =
  with
  <<< with
  <<< with
  <<< with
  <<< with
  <<< with
  <<< with
  $ without
  where
    without :: { kind :: TypeKind, name :: Maybe String } -> List { kind :: TypeKind, name :: Maybe String }
    without = List.singleton

    with :: forall a . (a -> List { kind :: TypeKind, name :: Maybe String }) -> { kind :: TypeKind, name :: Maybe String, ofType :: Maybe a } -> List { kind :: TypeKind, name :: Maybe String }
    with handleOfType x =
      { kind: x.kind, name: x.name } : case x.ofType of
        Nothing -> Nil
        Just x' -> handleOfType x'

findObjectThatRequiresPassingDecoder :: List { kind :: TypeKind, name :: Maybe String } -> Maybe { kind :: TypeKind, name :: Maybe String }
findObjectThatRequiresPassingDecoder = List.find
  (\x ->
    case x.kind of
         Object      -> true
         Interface   -> true
         Union       -> true
         _ -> false
  )

optionalArgsFilter :: { kind :: TypeKind, name :: Maybe String } -> Boolean
optionalArgsFilter x =
  case x.kind of
       NonNull -> false
       _       -> true

nonOptionalArgsFilter :: { kind :: TypeKind, name :: Maybe String } -> Boolean
nonOptionalArgsFilter = not <<< optionalArgsFilter

filterAndNonEmpty
  :: ({ kind :: TypeKind, name :: Maybe String } -> Boolean)
  -> Array { name :: String, "type" :: List { kind :: TypeKind, name :: Maybe String } }
  -> Maybe $ NonEmptyArray { name :: String, "type" :: NonEmptyArray { kind :: TypeKind, name :: Maybe String } }
filterAndNonEmpty pred = NonEmpty.fromFoldable <<< Array.catMaybes <<< map go
  where
  go :: { name :: String, "type" :: List { kind :: TypeKind, name :: Maybe String } } -> Maybe { name :: String, "type" :: NonEmptyArray { kind :: TypeKind, name :: Maybe String } }
  go el =
    let
      type_ :: Maybe $ NonEmptyArray { kind :: TypeKind, name :: Maybe String }
      type_ = NonEmpty.fromFoldable $ List.filter pred el."type"
     in type_ <#> \type__ -> { name: el.name, "type": type__ }

toRow
  :: (List { kind :: TypeKind, name :: Maybe String } -> Type)
  -> NonEmptyArray { name :: String, "type" :: NonEmptyArray { kind :: TypeKind, name :: Maybe String } }
  -> Row
toRow mkType els = Row
  { rowLabels: NonEmpty.toArray els <#> \el -> { label: Label el.name, type_: mkType $ List.fromFoldable el."type" }
  , rowTail: Just (TypeVar $ Ident "r")
  }

declInput :: String -> Array InstorpectionQueryResult__InputValue -> Array Declaration
declInput parentName args =
  let
    args' :: Array { name :: String, "type" :: List { kind :: TypeKind, name :: Maybe String } }
    args' = args <#> \arg -> { name: arg.name, "type": collectTypeRefInfo arg."type" }

    optionalArgs :: Maybe $ NonEmptyArray { name :: String, "type" :: NonEmptyArray { kind :: TypeKind, name :: Maybe String } }
    optionalArgs = filterAndNonEmpty optionalArgsFilter args'

    nonOptionalArgs :: Maybe $ NonEmptyArray { name :: String, "type" :: NonEmptyArray { kind :: TypeKind, name :: Maybe String } }
    nonOptionalArgs = filterAndNonEmpty nonOptionalArgsFilter args'

    rowOptional :: Maybe Row
    rowOptional = optionalArgs <#> toRow (mkFieldType "Optional")

    rowRequired :: Maybe Row
    rowRequired = nonOptionalArgs <#> toRow (mkFieldTypeGo true)

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
  let
    typeRefInfo :: List { kind :: TypeKind, name :: Maybe String }
    typeRefInfo = collectTypeRefInfo field."type"

    infoThatRequiresPassingDecoder :: Maybe { kind :: TypeKind, name :: Maybe String } -- there can be many, but we handle only one
    infoThatRequiresPassingDecoder = findObjectThatRequiresPassingDecoder typeRefInfo
  in
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
        maybeWrapInInput inside =
          case input of
              Nothing -> inside
              (Just inputType) -> inputType ====>> inside

        inside :: Type
        inside =
          nonQualifiedNameTypeConstructor "SelectionSet"
          `TypeApp`
          nonQualifiedNameTypeConstructor (nameToScope parentName)
          `TypeApp`
          mkFieldType "Maybe" typeRefInfo
        in case infoThatRequiresPassingDecoder of
                Nothing -> maybeWrapInInput inside
                Just infoThatRequiresPassingDecoder' ->
                  let
                    insideDecoderAndResult :: Type
                    insideDecoderAndResult =
                      ( nonQualifiedNameTypeConstructor "SelectionSet"
                      `TypeApp`
                      (nonQualifiedNameTypeConstructor $ maybe "ERROR" nameToScope infoThatRequiresPassingDecoder'.name)
                      `TypeApp`
                      typeVar "r"
                      )
                      ====>>
                      inside
                  in
                    TypeForall
                    (NonEmpty.singleton (typeVarName "r"))
                    (maybeWrapInInput insideDecoderAndResult)
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
              { expr: case infoThatRequiresPassingDecoder of
                  Nothing ->
                    nonQualifiedExprIdent "selectionForField"
                    `ExprApp`
                    ExprString field.name
                    `ExprApp`
                    inputArg
                    `ExprApp`
                    nonQualifiedExprIdent "graphqlDefaultResponseScalarDecoder"
                  Just infoThatRequiresPassingDecoder' ->
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
