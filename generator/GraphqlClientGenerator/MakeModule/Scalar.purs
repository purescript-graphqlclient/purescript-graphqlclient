module GraphqlClientGenerator.MakeModule.Scalar where

import GraphqlClientGenerator.IntrospectionSchema
import Language.PS.AST
import Language.PS.AST.Sugar
import Protolude

import Data.Array as Array
import Data.NonEmpty ((:|))
import Data.String.Extra as StringsExtra

makeModule :: ModuleName -> Array InstorpectionQueryResult__FullType -> Module
makeModule moduleName scalarTypes = Module
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
      { moduleName: mkModuleName $ "Data" :| ["Newtype"]
      , names: []
      , qualification: Nothing
      }
    ]
  , exports: []
  , declarations:
      scalarTypes <#>
      (\scalarType ->
        let
          pascalName :: String
          pascalName = StringsExtra.pascalCase scalarType.name

          mkDeriveAsNewtype :: String -> Declaration
          mkDeriveAsNewtype typeName = DeclDerive
            { comments: Nothing
            , deriveType: DeclDeriveType_Newtype
            , head:
              { instName: Ident $ StringsExtra.camelCase typeName <> pascalName
              , instConstraints: []
              , instClass: nonQualifiedName $ ProperName typeName
              , instTypes: (TypeConstructor $ nonQualifiedName $ ProperName pascalName) :| []
              }
            }
        in
          [ DeclNewtype
            { comments: Just $ OneLineComments ["original name - " <> scalarType.name]
            , name: ProperName pascalName
            , head: DataHead
              { dataHdName: ProperName pascalName
              , dataHdVars: []
              }
            , type_: stringType
            }
          , mkDeriveAsNewtype "Eq"
          , mkDeriveAsNewtype "Ord"
          , mkDeriveAsNewtype "Show"
          , DeclDerive
            { comments: Nothing
            , deriveType: DeclDeriveType_Odrinary
            , head:
              { instName: Ident $ "newtype" <> pascalName
              , instConstraints: []
              , instClass: nonQualifiedName $ ProperName "Newtype"
              , instTypes: (TypeConstructor $ nonQualifiedName $ ProperName pascalName) :| [TypeWildcard]
              }
            }
          -- | , DeclDerive
          -- |   { comments: Nothing
          -- |   , deriveType: DeclDeriveType_Odrinary
          -- |   , head:
          -- |     { instName: Ident $ "generic" <> pascalName
          -- |     , instConstraints: []
          -- |     , instClass: nonQualifiedName $ ProperName "Generic"
          -- |     , instTypes: (TypeConstructor $ nonQualifiedName $ ProperName pascalName) :| [TypeWildcard]
          -- |     }
          -- |   }
          , mkDeriveAsNewtype "GraphqlDefaultResponseScalarDecoder"
          , mkDeriveAsNewtype "ToGraphqlArgumentValue"
          ]
      )
      # Array.concat
  }
