module GraphqlClientGenerator.MakeModule.Scalar where

import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import Language.PS.CST (Comments(..), DataHead(..), DeclDeriveType(..), Declaration(..), Ident(..), ImportDecl(..), Module(..), ModuleName, ProperName(..), Type(..))
import Language.PS.CST.Sugar (mkModuleName, nonQualifiedName, stringType)
import Protolude (Maybe(..), (#), ($), (<#>), (<>))

import Data.Array as Array
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra

makeModule :: ModuleName -> Array InstorpectionQueryResult__FullType -> Module
makeModule moduleName scalarTypes = Module
  { moduleName
  , imports:
    [ ImportDecl
      { moduleName: mkModuleName $ NonEmpty.singleton "Prelude"
      , names: []
      , qualification: Nothing
      }
    , ImportDecl
      { moduleName: mkModuleName $ NonEmpty.singleton "GraphqlClient"
      , names: []
      , qualification: Nothing
      }
    , ImportDecl
      { moduleName: mkModuleName $ NonEmpty.cons' "Data" ["Newtype"]
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
              , instTypes: NonEmpty.singleton $ TypeConstructor $ nonQualifiedName $ ProperName pascalName
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
              , instTypes: NonEmpty.cons' (TypeConstructor $ nonQualifiedName $ ProperName pascalName) [TypeWildcard]
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
