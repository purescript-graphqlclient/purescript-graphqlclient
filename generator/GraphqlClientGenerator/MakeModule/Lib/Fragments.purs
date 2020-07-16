module GraphqlClientGenerator.MakeModule.Lib.Fragments where

import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKindWithNull
import Language.PS.CST
import Language.PS.CST.Sugar
import Protolude

import Data.Array as Array
import Data.Array.NonEmpty as NonEmpty
import Data.NonEmpty (NonEmpty(..))
import Data.String.Extra (pascalCase)
import Data.String.Extra as StringsExtra

nameOfTypeKindWithNull :: TypeKindWithNull -> String
nameOfTypeKindWithNull =
  case _ of
       TypeKindWithNull__Null        type_ -> nameOfTypeKindWithNull type_
       TypeKindWithNull__List        type_ -> nameOfTypeKindWithNull type_
       TypeKindWithNull__Scalar      name -> name
       TypeKindWithNull__Enum        name -> name
       TypeKindWithNull__InputObject name -> name
       TypeKindWithNull__Object      name -> name
       TypeKindWithNull__Interface   name -> name
       TypeKindWithNull__Union       name -> name

declarationForPossibleTypes :: (String -> String) -> String -> Array TypeKindWithNull -> Array Declaration
declarationForPossibleTypes nameToScope parentName typeRefs =
  let
      names :: Array String
      names = typeRefs <#> nameOfTypeKindWithNull
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
            nonQualifiedNameTypeConstructor (nameToScope name)
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
            nonQualifiedNameTypeConstructor (nameToScope parentName)
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
