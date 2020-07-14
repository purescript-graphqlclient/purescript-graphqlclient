module GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields where

import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__Field, InstorpectionQueryResult__InputValue, InstorpectionQueryResult__TypeRef)
import GraphqlClientGenerator.IntrospectionSchema.TypeKind (TypeKind(..))
import Language.PS.CST (Binder(..), DataHead(..), Declaration(..), Expr(..), Guarded(..), Ident(..), Label(..), ProperName(..), Row(..), Type(..), (====>>))
import Language.PS.CST.Sugar (nonQualifiedExprIdent, nonQualifiedNameTypeConstructor, typeVar, typeVarName)
import Protolude (List(..), Maybe(..), const, maybe, (#), ($), (<#>), (<<<), (<>))

import Data.Array as Array
import Data.List ((:))
import Data.List as List
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra

arrayType :: Type -> Type
arrayType typeInside = nonQualifiedNameTypeConstructor "Array" `TypeApp` typeInside

typeRefType :: Maybe String -> Type
typeRefType name = nonQualifiedNameTypeConstructor (maybe "ERROR_TYPE_REF_NAME_SHOULD_NOT_BE_NOTHING" StringsExtra.pascalCase name)

typeRefTypeScope :: Maybe String -> Type
typeRefTypeScope name = nonQualifiedNameTypeConstructor (maybe "ERROR_TYPE_REF_NAME_SHOULD_NOT_BE_NOTHING" (const "r") name)

mkFieldType :: String -> List { kind :: TypeKind, name :: Maybe String } -> Type
mkFieldType maybeConstructor = go true
  where
    go :: Boolean -> List { kind :: TypeKind, name :: Maybe String } -> Type
    go _ Nil = nonQualifiedNameTypeConstructor "ERROR_NULL_OR_LIST_BUT_WITHOUT_TYPE_INSIDE"
    go wrapInMaybe (typeRef : xs) =
      let
          maybeWrap t = if wrapInMaybe then nonQualifiedNameTypeConstructor maybeConstructor `TypeApp` t else t
      in case typeRef.kind of
          NonNull     -> go false xs -- next pass is with false
          List        -> arrayType $ go true xs -- reset to true again
          Scalar      -> maybeWrap $ typeRefType typeRef.name
          Enum        -> maybeWrap $ typeRefType typeRef.name
          InputObject -> maybeWrap $ typeRefType typeRef.name
          Object      -> maybeWrap $ typeRefTypeScope typeRef.name
          Interface   -> maybeWrap $ typeRefTypeScope typeRef.name
          Union       -> maybeWrap $ typeRefTypeScope typeRef.name

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

declInput :: String -> Array InstorpectionQueryResult__InputValue -> Declaration
declInput parentName args = DeclType
  { comments: Nothing
  , head: DataHead
    { dataHdName: ProperName $ parentName <> "Input"
    , dataHdVars: []
    }
  , type_: TypeRecord $ Row
    { rowLabels: args <#> \(arg :: InstorpectionQueryResult__InputValue) -> { label: Label arg.name, type_: mkFieldType "Optional" $ collectTypeRefInfo arg."type" }
    , rowTail: Nothing
    }
  }

declarationsForField :: String -> InstorpectionQueryResult__Field -> Array Declaration
declarationsForField parentName field =
  let
    typeRefInfo :: List { kind :: TypeKind, name :: Maybe String }
    typeRefInfo = collectTypeRefInfo field."type"

    infoThatRequiresPassingDecoder :: Maybe { kind :: TypeKind, name :: Maybe String } -- there can be many, but we handle only one
    infoThatRequiresPassingDecoder = findObjectThatRequiresPassingDecoder typeRefInfo
  in
  (if Array.null field.args then [] else [declInput (StringsExtra.pascalCase field.name) field.args]) <>
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
          nonQualifiedNameTypeConstructor ("Scope__" <> StringsExtra.pascalCase parentName)
          `TypeApp`
          mkFieldType "Maybe" typeRefInfo
        in case infoThatRequiresPassingDecoder of
                Nothing -> maybeWrapInInput inside
                Just infoThatRequiresPassingDecoder' ->
                  let
                    name :: Maybe String
                    name = infoThatRequiresPassingDecoder'.name <#> \name' ->
                        case infoThatRequiresPassingDecoder'.kind of
                            Interface -> name' <> "Interface"
                            _ -> name'

                    insideDecoderAndResult :: Type
                    insideDecoderAndResult =
                      ( nonQualifiedNameTypeConstructor "SelectionSet"
                      `TypeApp`
                      (nonQualifiedNameTypeConstructor $ "Scope__" <> maybe "ERROR" StringsExtra.pascalCase name)
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

declarationsForFields :: String -> Array InstorpectionQueryResult__Field -> Array Declaration
declarationsForFields parentName fields =
  fields
  <#> declarationsForField parentName
  # Array.concat
