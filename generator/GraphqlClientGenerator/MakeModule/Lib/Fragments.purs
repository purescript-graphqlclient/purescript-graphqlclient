module GraphqlClientGenerator.MakeModule.Lib.Fragments where

import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKindWithNull
import GraphqlClientGenerator.MakeModule.Lib.Utils
import Language.PS.SmartCST
import Protolude

import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
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

declarationForPossibleTypes :: NonEmptyArray String -> (String -> String) -> String -> Array TypeKindWithNull -> Array Declaration
declarationForPossibleTypes apiModuleName nameToScope parentName typeRefs =
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
      , type_: TypeRecord
        { rowLabels: names <#> \name ->
          { label: Label $ "on" <> StringsExtra.pascalCase name
          , type_:
            (TypeConstructor $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.singleton "GraphqlClient") (ProperName "SelectionSet"))
            `TypeApp`
            (TypeConstructor $ qualifyScope apiModuleName (nameToScope name))
            `TypeApp`
            (TypeVar (Ident "decodesTo"))
          }
        , rowTail: Nothing
        }
      }
    , DeclSignature
      { comments: Nothing
      , ident: Ident "fragments"
      , type_: TypeForall (NonEmpty.singleton $ TypeVarName $ Ident "decodesTo")
        ( ( TypeConstructor (SmartQualifiedName__Ignore (ProperName "Fragments"))
          `TypeApp`
          (TypeVar $ Ident "decodesTo")
          )
          `TypeArr`
          ( (TypeConstructor $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.singleton "GraphqlClient") $ ProperName "SelectionSet")
            `TypeApp`
            (TypeConstructor $ qualifyScope apiModuleName (nameToScope parentName))
            `TypeApp`
            (TypeVar (Ident "decodesTo"))
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
              ExprIdent (SmartQualifiedName__Simple (mkModuleName $ NonEmpty.singleton "GraphqlClient") $ Ident "exhaustiveFragmentSelection")
              `ExprApp`
              ExprArray (names <#> \name ->
                (ExprIdent (SmartQualifiedName__Simple (mkModuleName $ NonEmpty.singleton "GraphqlClient") $ Ident "buildFragment")
                `ExprApp`
                ExprString name
                `ExprApp`
                ExprRecordAccessor
                  { recExpr: ExprVar $ Ident $ "selections"
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
        ( ( TypeConstructor (SmartQualifiedName__Ignore $ ProperName "Fragments")
            `TypeApp`
            ( TypeConstructor (SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Data" ["Maybe"]) $ ProperName "Maybe")
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
                ( (ExprIdent $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.singleton "Prelude") $ Ident "pure")
                  `ExprApp`
                  (ExprConstructor $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Data" ["Maybe"]) (ConstructorProperName { constructor: ProperName "Nothing", type_: ProperName "Maybe" }))
                )
            , whereBindings: []
            }
        }
      }
    ]
