module GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields where

import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKind
import Language.PS.AST
import Language.PS.AST.Sugar
import Protolude

import Data.Array as Array
import Data.List ((:))
import Data.List as List
import Data.NonEmpty ((:|))
import Data.String.Extra as StringsExtra

maybeType :: Type -> Type
maybeType typeInside = nonQualifiedNameTypeConstructor "Maybe" `TypeApp` typeInside

arrayType :: Type -> Type
arrayType typeInside = nonQualifiedNameTypeConstructor "Array" `TypeApp` typeInside

typeRefType :: Maybe String -> Type
typeRefType name = nonQualifiedNameTypeConstructor (maybe "ERROR_TYPE_REF_NAME_SHOULD_NOT_BE_NOTHING" StringsExtra.pascalCase name)

typeRefTypeScope :: Maybe String -> Type
typeRefTypeScope name = nonQualifiedNameTypeConstructor (maybe "ERROR_TYPE_REF_NAME_SHOULD_NOT_BE_NOTHING" (const "r") name)

mkFieldType :: List { kind :: TypeKind, name :: Maybe String } -> Type
mkFieldType = go true
  where
    go :: Boolean -> List { kind :: TypeKind, name :: Maybe String } -> Type
    go _ Nil = nonQualifiedNameTypeConstructor "ERROR_NULL_OR_LIST_BUT_WITHOUT_TYPE_INSIDE"
    go wrapInMaybe (typeRef : xs) =
      let
          maybeWrap t = if wrapInMaybe then maybeType t else t
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

declarationsForFields :: String -> Array InstorpectionQueryResult__Field -> Array Declaration
declarationsForFields parentName fields =
  fields
  <#> (\field ->
    let
      typeRefInfo :: List { kind :: TypeKind, name :: Maybe String }
      typeRefInfo = collectTypeRefInfo field."type"

      infoThatRequiresPassingDecoder :: Maybe { kind :: TypeKind, name :: Maybe String }
      infoThatRequiresPassingDecoder = findObjectThatRequiresPassingDecoder typeRefInfo
    in
    [ DeclSignature
      { comments: Nothing
      , ident: Ident field.name
      , type_:
        let
          inside :: Type
          inside =
            nonQualifiedNameTypeConstructor "SelectionSet"
            `TypeApp`
            nonQualifiedNameTypeConstructor ("Scope__" <> StringsExtra.pascalCase parentName)
            `TypeApp`
            mkFieldType typeRefInfo
          in case infoThatRequiresPassingDecoder of
                  Nothing -> inside
                  Just infoThatRequiresPassingDecoder' ->
                    TypeForall
                    (typeVarName "r" :| [])
                    ( ( nonQualifiedNameTypeConstructor "SelectionSet"
                        `TypeApp`
                        (nonQualifiedNameTypeConstructor $ "Scope__" <> maybe "ERROR" StringsExtra.pascalCase infoThatRequiresPassingDecoder'.name)
                        `TypeApp`
                        typeVar "r"
                      )
                      ====>>
                      inside
                    )
      }
    , DeclValue
      { comments: Nothing
      , valueBindingFields:
        { name: Ident field.name
        , binders: []
        , guarded: Unconditional
          { expr:
            case infoThatRequiresPassingDecoder of
              Nothing ->
                nonQualifiedExprIdent "selectionForField"
                `ExprApp`
                ExprString field.name
                `ExprApp`
                ExprArray []
                `ExprApp`
                nonQualifiedExprIdent "graphqlDefaultResponseScalarDecoder"
              Just infoThatRequiresPassingDecoder' ->
                nonQualifiedExprIdent "selectionForCompositeField"
                `ExprApp`
                ExprString field.name
                `ExprApp`
                ExprArray []
                `ExprApp`
                nonQualifiedExprIdent "graphqlDefaultResponseFunctorOrScalarDecoderTransformer"
          , whereBindings: []
          }
        }
      }
    ]
    )
  # Array.concat
