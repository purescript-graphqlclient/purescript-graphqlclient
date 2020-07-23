module GraphqlClientGenerator.MakeModule.Enum where

import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__EnumValue, InstorpectionQueryResult__FullType)
import GraphqlClientGenerator.MakeModule.Lib.Utils (tupleDecl, tupleExpr)
import Language.PS.SmartCST
import Protolude (type ($), Maybe(..), flip, fromMaybe, join, maybe, (#), ($), (<#>), (<>))

import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra

makeModule :: ModuleName -> InstorpectionQueryResult__FullType -> Module
makeModule moduleName fullType =
  let
    enumValues' :: Maybe $ NonEmptyArray InstorpectionQueryResult__EnumValue
    enumValues' = fullType.enumValues <#> NonEmpty.fromFoldable # join

    pascalName :: String
    pascalName = StringsExtra.pascalCase fullType.name

    mkDerive :: String -> ModuleName -> Declaration
    mkDerive typeName module_ = DeclDerive
      { comments: Nothing
      , deriveType: DeclDeriveType_Odrinary
      , head:
        { instName: Ident $ StringsExtra.camelCase typeName <> pascalName
        , instConstraints: []
        , instClass: SmartQualifiedName__Simple module_ $ ProperName typeName
        , instTypes: NonEmpty.singleton $ TypeConstructor $ SmartQualifiedName__Simple moduleName $ ProperName pascalName
        }
      }
  in
  Module
  { moduleName
  , exports: []
  , declarations:
    [ DeclData
      { comments: Just $ OneLineComments ["original name - " <> fullType.name]
      , head: DataHead
          { dataHdName: ProperName $ StringsExtra.pascalCase fullType.name
          , dataHdVars: []
          }
      , constructors:
          fullType.enumValues
          # fromMaybe []
          <#> (\field -> DataCtor { dataCtorName: ProperName $ StringsExtra.pascalCase field.name, dataCtorFields: [] })
      }
    , mkDerive "Eq" (mkModuleName $ NonEmpty.singleton "Prelude")
    , mkDerive "Ord" (mkModuleName $ NonEmpty.singleton "Prelude")
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
        , guarded: Unconditional
          { expr: ExprArray
              ( fullType.enumValues
              # fromMaybe []
              <#> (\field ->
                    tupleExpr
                    (ExprString field.name)
                    (ExprConstructor $ SmartQualifiedName__Ignore
                      (ConstructorProperName
                        { constructor: ProperName $ StringsExtra.pascalCase field.name
                        , type_: ProperName "WONT_BE_RENDERED"
                        }
                      )
                    )
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
            { instClass: SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphqlClient" []) (ProperName "GraphqlDefaultResponseScalarDecoder" )
            , instConstraints: []
            , instName: Ident (StringsExtra.camelCase fullType.name <> "GraphqlDefaultResponseScalarDecoder")
            , instTypes: NonEmpty.singleton $ TypeConstructor $ SmartQualifiedName__Ignore $ ProperName (StringsExtra.pascalCase fullType.name)
            }
          , body:
            [ InstanceBindingName
              { binders: []
              , guarded: Unconditional
                { expr:
                  (ExprIdent (SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphqlClient" []) $ Ident "enumDecoder"))
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
            { instClass: SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "GraphqlClient" []) (ProperName "ToGraphqlArgumentValue" )
            , instConstraints: []
            , instName: Ident (StringsExtra.camelCase fullType.name <> "ToGraphqlArgumentValue")
            , instTypes: NonEmpty.singleton $ TypeConstructor $ SmartQualifiedName__Ignore $ ProperName (StringsExtra.pascalCase fullType.name)
            }
          , body:
            [InstanceBindingName
              { name: Ident "toGraphqlArgumentValue"
              , binders: []
              , guarded: Unconditional
                { whereBindings: []
                , expr: flip (maybe (ExprIdent $ SmartQualifiedName__Ignore $ Ident "ERROR_IS_EMPTY_ARRAY")) enumValues' \enumValues'' ->
                  ExprCase
                    { head: NonEmpty.singleton ExprSection
                    , branches: enumValues'' <#> \enumValue ->
                        { binders: NonEmpty.singleton (
                            BinderConstructor
                              { name: SmartQualifiedName__Ignore
                                (ConstructorProperName
                                  { constructor: ProperName (StringsExtra.pascalCase enumValue.name)
                                  , type_:  ProperName "WONT_BE_RENDERED"
                                  }
                                )
                              , args: []
                              }
                          )
                        , body: Unconditional
                            { whereBindings: []
                            , expr:
                              (ExprConstructor $
                                SmartQualifiedName__Simple
                                (mkModuleName $ NonEmpty.singleton "GraphqlClient")
                                (ConstructorProperName { constructor: ProperName "ArgumentValueEnum", type_: ProperName "ArgumentValue" }))
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
