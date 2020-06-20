module Generator.PsAst.MkEnumModule where

import Fernet.Introspection.IntrospectionSchema
import Fernet.Introspection.Schema.TypeKind
import Language.PS.AST
import Language.PS.AST.Printers
import Language.PS.AST.Sugar
import Protolude

import Data.Array (filter)
import Data.Functor.Mu (roll)
import Data.List ((:))
import Data.List (fromFoldable) as List
import Data.Map (Map)
import Data.Map (empty, fromFoldable) as Map
import Data.NonEmpty ((:|))
import Data.Predicate (Predicate(..))
import Data.String.Utils (startsWith)
import Fernet.Introspection.Schema.Fields (__schema)
import Data.String.Extra as StringsExtra

mkEnumModule :: ModuleName -> InstorpectionQueryResult__FullType -> Module
mkEnumModule moduleName fullType = Module
  { moduleName
  , imports: []
  , exports: []
  , declarations:
    [ DeclData
      { comments: Just $ OneLineComments ["original type - " <> fullType.name]
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
      , type_: arrayType (TypeOp (nonQualifiedNameTypeConstructor "String") (nonQualifiedName (OpName "/\\")) (nonQualifiedNameTypeConstructor $ StringsExtra.pascalCase fullType.name))
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
              <#> (\field -> ExprOp (ExprString field.name) (nonQualifiedName (OpName "/\\")) (ExprConstructor $ nonQualifiedName (ProperName $ StringsExtra.pascalCase field.name)))
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
