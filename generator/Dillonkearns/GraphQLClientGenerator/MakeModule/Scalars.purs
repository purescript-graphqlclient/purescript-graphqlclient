module Dillonkearns.GraphQLClientGenerator.MakeModule.Scalars where

import Prelude

import Data.Array as Array
import Data.Array.NonEmpty as NonEmpty
import Data.Maybe (Maybe(..))
import Data.String.Extra as StringsExtra
import Dillonkearns.GraphQLClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import Language.PS.SmartCST (Comments(..), DataHead(..), Declaration(..), Module(..), ModuleName, ProperName(..), mkModuleName, stringType)
import Dillonkearns.GraphQLClientGenerator.MakeModule.Lib.Utils (mkDeriveClassAsNewtype, mkDeriveNewtypeClass)

makeModule :: ModuleName -> Array InstorpectionQueryResult__FullType -> Module
makeModule moduleName scalarTypes =
  Module
    { moduleName
    , exports: []
    , declarations:
      scalarTypes
        <#> ( \scalarType ->
              let
                pascalName :: String
                pascalName = StringsExtra.pascalCase scalarType.name
              in
                [ DeclNewtype
                    { comments: Just $ OneLineComments [ "original name - " <> scalarType.name ]
                    , name: ProperName pascalName
                    , head:
                      DataHead
                        { dataHdName: ProperName pascalName
                        , dataHdVars: []
                        }
                    , type_: stringType
                    }
                , mkDeriveNewtypeClass { typeName: pascalName, typeModuleName: moduleName }
                , mkDeriveClassAsNewtype { typeName: pascalName, typeModuleName: moduleName, className: "Eq", classModuleName: mkModuleName $ NonEmpty.singleton "Prelude" }
                , mkDeriveClassAsNewtype { typeName: pascalName, typeModuleName: moduleName, className: "Ord", classModuleName: mkModuleName $ NonEmpty.singleton "Prelude" }
                , mkDeriveClassAsNewtype { typeName: pascalName, typeModuleName: moduleName, className: "Show", classModuleName: mkModuleName $ NonEmpty.singleton "Prelude" }
                , mkDeriveClassAsNewtype { typeName: pascalName, typeModuleName: moduleName, className: "GraphQLDefaultResponseScalarDecoder", classModuleName: mkModuleName $ NonEmpty.cons' "Dillonkearns" [ "GraphQLClient" ] }
                , mkDeriveClassAsNewtype { typeName: pascalName, typeModuleName: moduleName, className: "ToGraphQLArgumentValue", classModuleName: mkModuleName $ NonEmpty.cons' "Dillonkearns" [ "GraphQLClient" ] }
                ]
          )
        # Array.concat
    }
