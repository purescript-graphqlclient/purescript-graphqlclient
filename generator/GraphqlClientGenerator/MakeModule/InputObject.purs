module GraphqlClientGenerator.MakeModule.InputObject where

import GraphqlClientGenerator.IntrospectionSchema
import Language.PS.CST
import Language.PS.CST.Sugar
import Protolude

import Data.Array as Array
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields

makeModule :: String -> ModuleName -> Array InstorpectionQueryResult__FullType -> Array String -> Module
makeModule apiModuleName moduleName inputObjectTypes instorpectionQueryResult__FullType__enum_names = Module
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
      { moduleName: mkModuleName $ NonEmpty.cons' "Data" ["Maybe"]
      , names: []
      , qualification: Nothing
      }
    ] <>
      (instorpectionQueryResult__FullType__enum_names <#>
        (\name -> ImportDecl
          { moduleName: mkModuleName $ NonEmpty.cons' apiModuleName ["Enum", name]
          , names: []
          , qualification: Nothing
          }
        )
      )
  , exports: []
  , declarations:
      inputObjectTypes <#>
      (\inputObjectType ->
        let
          pascalName :: String
          pascalName = StringsExtra.pascalCase inputObjectType.name
        in
          [ DeclType
            { comments: Just $ OneLineComments ["original name - " <> inputObjectType.name]
            , head: DataHead
              { dataHdName: ProperName $ pascalName
              , dataHdVars: []
              }
            , type_: TypeRecord $ Row
              { rowLabels: (fromMaybe [] inputObjectType.inputFields) <#> \(field :: InstorpectionQueryResult__InputValue) -> { label: Label field.name, type_: DeclarationsForFields.mkFieldType $ DeclarationsForFields.collectTypeRefInfo field."type" }
              , rowTail: Nothing
              }
            }
          ]
      )
      # Array.concat
  }
