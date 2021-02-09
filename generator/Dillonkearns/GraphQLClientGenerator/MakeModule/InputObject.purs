module Dillonkearns.GraphQLClientGenerator.MakeModule.InputObject where

import Prelude
import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String.Extra as StringsExtra
import Dillonkearns.GraphQLClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import Dillonkearns.GraphQLClientGenerator.IntrospectionSchema.TypeKindWithNull (TypeKindWithNull)
import Dillonkearns.GraphQLClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import Language.PS.SmartCST
import Data.Array.NonEmpty as NonEmpty
import Dillonkearns.GraphQLClientGenerator.MakeModule.Lib.Utils

mkRow
  :: forall t.
  { apiModuleName :: NonEmptyArray String, scalarModule :: ModuleName } ->
  { name :: String, type :: TypeKindWithNull | t } ->
  { label :: Label, type_ :: PSType }
mkRow context field =
  { label: Label field.name
  , type_: DeclarationsForFields.mkFieldTypeWithoutHoleAndOptionalForTopLevel context field."type"
  }

makeModule ::
  ModuleName ->
  NonEmptyArray String ->
  ModuleName ->
  Array InstorpectionQueryResult__FullType ->
  Module
makeModule scalarModule apiModuleName moduleName inputObjectTypes =
  Module
    { moduleName
    , exports: []
    , declarations:
      inputObjectTypes
        <#> ( \inputObjectType ->
              let
                pascalName :: String
                pascalName = StringsExtra.pascalCase inputObjectType.name
              in
                [ DeclNewtype
                    { comments: Just $ OneLineComments [ "original name - " <> inputObjectType.name ]
                    , name: ProperName pascalName
                    , head:
                      DataHead
                        { dataHdName: ProperName pascalName
                        , dataHdVars: []
                        }
                    , type_:
                      TypeRecord
                        { rowLabels: fromMaybe [] inputObjectType.inputFields <#> mkRow { apiModuleName, scalarModule }
                        , rowTail: Nothing
                        }
                    }
                , mkDeriveGenericClass { typeName: pascalName, typeModuleName: moduleName }
                , mkDeriveNewtypeClass { typeName: pascalName, typeModuleName: moduleName }

                -- | , mkDeriveClassAsNewtype { typeName: pascalName, typeModuleName: moduleName, className: "Eq", classModuleName: mkModuleName $ NonEmpty.singleton "Prelude" }
                -- | , mkDeriveClassAsNewtype { typeName: pascalName, typeModuleName: moduleName, className: "Ord", classModuleName: mkModuleName $ NonEmpty.singleton "Prelude" }
                -- | , mkShowClass { typeName: pascalName, typeModuleName: moduleName }

                , DeclInstanceChain
                  { comments: Nothing
                  , instances: NonEmpty.singleton
                    { head:
                      { instName: Ident $ "toGraphQLArgumentValue" <> pascalName
                      , instConstraints: []
                      , instClass: SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Dillonkearns" [ "GraphQLClient" ]) $ ProperName "ToGraphQLArgumentValue"
                      , instTypes: NonEmpty.cons' (TypeConstructor $ SmartQualifiedName__Simple moduleName $ ProperName pascalName) [ ]
                      }
                    , body:
                      [ InstanceBindingName
                        { name: Ident "toGraphQLArgumentValue"
                        , binders:
                          [ BinderConstructor
                            { name: SmartQualifiedNameConstructor__Ignore (ProperName pascalName)
                            , args:
                              [ BinderVar $ Ident "x"
                              ]
                            }
                          ]
                        , guarded: Unconditional
                          { expr:
                              (ExprIdent $ SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Dillonkearns" [ "GraphQLClient" ]) $ Ident "toGraphQLArgumentValue")
                              `ExprApp`
                              (ExprVar $ Ident "x")
                          , whereBindings: []
                          }
                        }
                      ]
                    }
                  }

                -- | , mkDeriveClassAsNewtype { typeName: pascalName, typeModuleName: moduleName, className: "ToGraphQLArgumentValue", classModuleName: mkModuleName $ NonEmpty.cons' "Dillonkearns" [ "GraphQLClient" ] }
                ]
          )
        # Array.concat
    }
