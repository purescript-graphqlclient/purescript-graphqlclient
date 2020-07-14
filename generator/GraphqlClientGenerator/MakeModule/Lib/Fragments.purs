module GraphqlClientGenerator.MakeModule.Lib.Fragments where

import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKind
import Language.PS.CST
import Language.PS.CST.Sugar
import Protolude

import Data.Array as Array
import Data.Array.NonEmpty as NonEmpty
import Data.NonEmpty (NonEmpty(..))
import Data.String.Extra (pascalCase)
import Data.String.Extra as StringsExtra

declarationForPossibleTypes :: String -> Array InstorpectionQueryResult__TypeRef -> Array Declaration
declarationForPossibleTypes parentName typeRefs =
  let
      names :: Array String
      names =
        typeRefs
        <#> _.name
        # Array.catMaybes
  in
    [ DeclType
      { comments: Nothing
      , head: DataHead
        { dataHdName: ProperName "Fragments"
        , dataHdVars: [TypeVarName (Ident "decodesTo")]
        }
      , type_: TypeRecord $ Row
        { rowLabels: names <#> \name ->
          { label: Label $ "on" <> StringsExtra.pascalCase name
          , type_:
            nonQualifiedNameTypeConstructor "SelectionSet"
            `TypeApp`
            nonQualifiedNameTypeConstructor ("Scope__" <> StringsExtra.pascalCase name)
            `TypeApp`
            TypeVar (Ident "decodesTo")
          }
        , rowTail: Nothing
        }
      }
    , DeclSignature
      { comments: Nothing
      , ident: Ident "fragments"
      , type_: TypeForall (NonEmpty.singleton $ TypeVarName $ Ident "decodesTo")
        ( ( TypeConstructor (nonQualifiedName $ ProperName "Fragments")
          `TypeApp`
          (TypeVar $ Ident "decodesTo")
          )
          `TypeArr`
          ( nonQualifiedNameTypeConstructor "SelectionSet"
            `TypeApp`
            nonQualifiedNameTypeConstructor ("Scope__" <> StringsExtra.pascalCase parentName)
            `TypeApp`
            TypeVar (Ident "decodesTo")
          )
        )
      }
    , DeclValue
      { comments: Nothing
      , valueBindingFields:
        { name: Ident "fragments"
        , binders: [BinderVar $ Ident "selections"]
        , guarded: Unconditional
            { expr:
              ExprIdent (nonQualifiedName $ Ident "exhaustiveFragmentSelection")
              `ExprApp`
              ExprArray (names <#> \name ->
                (ExprIdent (nonQualifiedName $ Ident "buildFragment")
                `ExprApp`
                ExprString name
                `ExprApp`
                ExprRecordAccessor
                  { recExpr: ExprIdent (nonQualifiedName $ Ident $ "selections")
                  , recPath: NonEmpty.singleton (Label $ "on" <> StringsExtra.pascalCase name)
                  }
                ))
            , whereBindings: []
            }
        }
      }
    , DeclSignature
      { comments: Nothing
      , ident: Ident "maybeFragments"
      , type_: TypeForall (NonEmpty.singleton $ TypeVarName $ Ident "decodesTo")
        ( ( TypeConstructor (nonQualifiedName $ ProperName "Fragments")
            `TypeApp`
            ( TypeConstructor (nonQualifiedName $ ProperName "Maybe")
              `TypeApp`
              (TypeVar $ Ident "decodesTo")
            )
          )
        )
      }
    , DeclValue
      { comments: Nothing
      , valueBindingFields:
        { name: Ident "maybeFragments"
        , binders: []
        , guarded: Unconditional
            { expr:
              ExprRecord $ names <#> \name -> RecordField
                (Label $ "on" <> StringsExtra.pascalCase name)
                ( (ExprIdent $ nonQualifiedName $ Ident "pure")
                  `ExprApp`
                  (ExprConstructor $ nonQualifiedName $ ProperName "Nothing")
                )
            , whereBindings: []
            }
        }
      }
    ]
