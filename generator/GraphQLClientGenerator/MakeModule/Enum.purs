module GraphQLClientGenerator.MakeModule.Enum where

import Prelude
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.String.Extra as StringsExtra
import GraphQLClientGenerator.IntrospectionSchema (InstorpectionQueryResult__EnumValue, InstorpectionQueryResult__FullType)
import Language.PS.SmartCST (Binder(..), Comments(..), DataCtor(..), DataHead(..), DeclDeriveType(..), Declaration(..), Expr(..), Guarded(..), Ident(..), InstanceBinding(..), Module(..), ModuleName, ProperName(..), SmartQualifiedName(..), SmartQualifiedNameConstructor(..), Type(..), arrayType, mkModuleName)
import GraphQLClientGenerator.MakeModule.Lib.Utils

makeModule :: ModuleName -> InstorpectionQueryResult__FullType -> Module
makeModule moduleName fullType =
  let
    enumValues' :: Maybe (NonEmptyArray InstorpectionQueryResult__EnumValue)
    enumValues' = fullType.enumValues <#> NonEmpty.fromFoldable # join

    pascalName :: String
    pascalName = StringsExtra.pascalCase fullType.name
  in
    Module
      { moduleName
      , exports: []
      , declarations:
        [ DeclData
            { comments: Just $ OneLineComments [ "original name - " <> fullType.name ]
            , head:
              DataHead
                { dataHdName: ProperName $ StringsExtra.pascalCase fullType.name
                , dataHdVars: []
                }
            , constructors:
              fullType.enumValues
                # fromMaybe []
                <#> (\field -> DataCtor { dataCtorName: ProperName $ StringsExtra.pascalCase field.name, dataCtorFields: [] })
            }

        , mkDeriveGenericClass { typeName: pascalName, typeModuleName: moduleName }
        , mkShowClass { typeName: pascalName, typeModuleName: moduleName }

        , mkDeriveClass { typeName: pascalName, typeModuleName: moduleName, className: "Eq", classModuleName: mkModuleName $ NonEmpty.singleton "Prelude" }
        , mkDeriveClass { typeName: pascalName, typeModuleName: moduleName, className: "Ord", classModuleName: mkModuleName $ NonEmpty.singleton "Prelude" }

        , DeclSignature
            { comments: Nothing
            , ident: Ident "fromToMap"
            , type_:
              arrayType
                ( tupleDecl
                    (TypeConstructor $ SmartQualifiedName__Ignore $ ProperName "String")
                    (TypeConstructor $ SmartQualifiedName__Ignore $ ProperName $ StringsExtra.pascalCase fullType.name)
                )
            }
        , DeclValue
            { comments: Nothing
            , valueBindingFields:
              { name: Ident "fromToMap"
              , binders: []
              , guarded:
                Unconditional
                  { expr:
                    ExprArray
                      ( fullType.enumValues
                          # fromMaybe []
                          <#> ( \field ->
                                tupleExpr
                                  (ExprString field.name)
                                  (ExprConstructor $ SmartQualifiedNameConstructor__Ignore (ProperName $ StringsExtra.pascalCase field.name))
                            )
                      )
                  , whereBindings: []
                  }
              }
            }
        , DeclInstanceChain
            { comments: Nothing
            , instances:
              NonEmpty.singleton
                { head:
                  { instClass: SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphQLClient" []) (ProperName "GraphQLDefaultResponseScalarDecoder")
                  , instConstraints: []
                  , instName: Ident (StringsExtra.camelCase fullType.name <> "GraphQLDefaultResponseScalarDecoder")
                  , instTypes: NonEmpty.singleton $ TypeConstructor $ SmartQualifiedName__Ignore $ ProperName (StringsExtra.pascalCase fullType.name)
                  }
                , body:
                  [ InstanceBindingName
                      { binders: []
                      , guarded:
                        Unconditional
                          { expr:
                            (ExprIdent (SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphQLClient" []) $ Ident "enumDecoder"))
                              `ExprApp`
                                (ExprString (StringsExtra.pascalCase fullType.name))
                              `ExprApp`
                                (ExprIdent (SmartQualifiedName__Ignore $ Ident "fromToMap"))
                          , whereBindings: []
                          }
                      , name: Ident "graphqlDefaultResponseScalarDecoder"
                      }
                  ]
                }
            }
        , DeclInstanceChain
            { comments: Nothing
            , instances:
              NonEmpty.singleton
                { head:
                  { instClass: SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphQLClient" []) (ProperName "ToGraphQLArgumentValue")
                  , instConstraints: []
                  , instName: Ident (StringsExtra.camelCase fullType.name <> "ToGraphQLArgumentValue")
                  , instTypes: NonEmpty.singleton $ TypeConstructor $ SmartQualifiedName__Ignore $ ProperName (StringsExtra.pascalCase fullType.name)
                  }
                , body:
                  [ InstanceBindingName
                      { name: Ident "toGraphQLArgumentValue"
                      , binders: []
                      , guarded:
                        Unconditional
                          { whereBindings: []
                          , expr:
                            flip (maybe (ExprIdent $ SmartQualifiedName__Ignore $ Ident "ERROR_IS_EMPTY_ARRAY")) enumValues' \enumValues'' ->
                              ExprCase
                                { head: NonEmpty.singleton ExprSection
                                , branches:
                                  enumValues''
                                    <#> \enumValue ->
                                        { binders:
                                          NonEmpty.singleton
                                            ( BinderConstructor
                                                { name: SmartQualifiedNameConstructor__Ignore (ProperName (StringsExtra.pascalCase enumValue.name))
                                                , args: []
                                                }
                                            )
                                        , body:
                                          Unconditional
                                            { whereBindings: []
                                            , expr:
                                              (ExprConstructor $ SmartQualifiedNameConstructor__Simple (mkModuleName $ NonEmpty.singleton "GraphQLClient") (ProperName "ArgumentValueEnum") (ProperName "ArgumentValue"))
                                                `ExprApp`
                                                  (ExprString enumValue.name)
                                            }
                                        }
                                }
                          }
                      }
                  ]
                }
            }
        ]
      }
