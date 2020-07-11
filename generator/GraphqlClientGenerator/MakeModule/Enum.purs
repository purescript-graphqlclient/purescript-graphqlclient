module GraphqlClientGenerator.MakeModule.Enum where

import GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKind
import Language.PS.AST
import Language.PS.AST.Printers
import Language.PS.AST.Sugar
import Protolude

import Data.Array (filter)
import Data.List ((:))
import Data.List (fromFoldable) as List
import Data.Map (Map)
import Data.Map (empty, fromFoldable) as Map
import Data.NonEmpty ((:|))
import Data.Predicate (Predicate(..))
import Data.String.Utils (startsWith)
import GraphqlClientGenerator.IntrospectionSchema.Fields (__schema)
import Data.String.Extra as StringsExtra

import GraphqlClientGenerator.MakeModule.Lib.Utils

makeModule :: ModuleName -> InstorpectionQueryResult__FullType -> Module
makeModule moduleName fullType = Module
  { moduleName
  , imports:
    [ ImportDecl
      { moduleName: mkModuleName $ "Prelude" :| []
      , names: []
      , qualification: Nothing
      }
    , ImportDecl
      { moduleName: mkModuleName $ "GraphqlClient" :| []
      , names: []
      , qualification: Nothing
      }
    , ImportDecl
      { moduleName: mkModuleName $ "Data" :| ["Tuple"]
      , names: []
      , qualification: Nothing
      }
    ]
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
    , DeclSignature
      { comments: Nothing
      , ident: Ident "fromToMap"
      , type_: arrayType (tupleDecl (nonQualifiedNameTypeConstructor "String") (nonQualifiedNameTypeConstructor $ StringsExtra.pascalCase fullType.name))
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
              <#> (\field -> tupleExpr (ExprString field.name) (ExprConstructor $ nonQualifiedName (ProperName $ StringsExtra.pascalCase field.name)))
              )
          , whereBindings: []
          }
        }
      }
    , DeclInstanceChain
        { comments: Nothing
        , instances:
          (
            { head:
              { instClass: nonQualifiedName (ProperName "GraphqlDefaultResponseScalarDecoder" )
              , instConstraints: []
              , instName: Ident (StringsExtra.camelCase fullType.name <> "GraphqlDefaultResponseScalarDecoder")
              , instTypes: nonQualifiedNameTypeConstructor (StringsExtra.pascalCase fullType.name) :| []
              }
            , body:
              [InstanceBindingName
                { binders: []
                , guarded: Unconditional
                  { expr:
                    (ExprIdent (nonQualifiedName $ Ident "enumDecoder"))
                    `ExprApp`
                    (ExprString (StringsExtra.pascalCase fullType.name))
                    `ExprApp`
                    (ExprIdent (nonQualifiedName $ Ident "fromToMap"))
                  , whereBindings: []
                  }
                , name: Ident "graphqlDefaultResponseScalarDecoder"
                }
              ]
            }
          )
          :|
          []
        }
    ]
  }
