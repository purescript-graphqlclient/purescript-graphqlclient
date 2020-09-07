module GraphqlClientGenerator.MakeModule.Scalars where

import Language.PS.SmartCST (Comments(..), DataHead(..), DeclDeriveType(..), Declaration(..), Ident(..), Module(..), ModuleName, ProperName(..), SmartQualifiedName(..), Type(..), mkModuleName, stringType)

import Data.Array as Array
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import Protolude

makeModule :: ModuleName -> Array InstorpectionQueryResult__FullType -> Module
makeModule moduleName scalarTypes = Module
  { moduleName
  , exports: []
  , declarations:
      scalarTypes <#>
      (\scalarType ->
        let
          pascalName :: String
          pascalName = StringsExtra.pascalCase scalarType.name

          mkDeriveAsNewtype :: String -> ModuleName -> Declaration
          mkDeriveAsNewtype typeName module_ = DeclDerive
            { comments: Nothing
            , deriveType: DeclDeriveType_Newtype
            , head:
              { instName: Ident $ StringsExtra.camelCase typeName <> pascalName
              , instConstraints: []
              , instClass: SmartQualifiedName__Simple module_ $ ProperName typeName
              , instTypes: NonEmpty.singleton $ TypeConstructor $ SmartQualifiedName__Simple moduleName $ ProperName pascalName
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
          , mkDeriveAsNewtype "Eq" (mkModuleName $ NonEmpty.singleton "Prelude")
          , mkDeriveAsNewtype "Ord" (mkModuleName $ NonEmpty.singleton "Prelude")
          , mkDeriveAsNewtype "Show" (mkModuleName $ NonEmpty.singleton "Prelude")
          , DeclDerive
            { comments: Nothing
            , deriveType: DeclDeriveType_Odrinary
            , head:
              { instName: Ident $ "newtype" <> pascalName
              , instConstraints: []
              , instClass: SmartQualifiedName__Simple (mkModuleName $ NonEmpty.cons' "Data" ["Newtype"]) $ ProperName "Newtype"
              , instTypes: NonEmpty.cons' (TypeConstructor $ SmartQualifiedName__Simple moduleName $ ProperName pascalName) [TypeWildcard]
              }
            }
          , mkDeriveAsNewtype "GraphqlDefaultResponseScalarDecoder" (mkModuleName $ NonEmpty.singleton "GraphqlClient")
          , mkDeriveAsNewtype "ToGraphqlArgumentValue" (mkModuleName $ NonEmpty.singleton "GraphqlClient")
          ]
      )
      # Array.concat
  }
