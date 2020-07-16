module GraphqlClientGenerator.MakeModule.InputObject where

import Protolude
import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType, InstorpectionQueryResult__InputValue)
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import Language.PS.CST (Comments(..), DataHead(..), Declaration(..), ImportDecl(..), Label(..), Module(..), ModuleName, ProperName(..), Row(..), Type(..))
import Language.PS.CST.Sugar (mkModuleName)

makeModule
  :: ImportDecl
  -> NonEmptyArray String
  -> ModuleName
  -> Array InstorpectionQueryResult__FullType
  -> Array String
  -> Module
makeModule importScalar apiModuleName moduleName inputObjectTypes instorpectionQueryResult__FullType__enum_names = Module
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
    , ImportDecl
      { moduleName: mkModuleName $ apiModuleName <> NonEmpty.singleton "Scopes"
      , names: []
      , qualification: Nothing
      }
    , importScalar
    ] <>
      (instorpectionQueryResult__FullType__enum_names <#>
        (\name -> ImportDecl
          { moduleName: mkModuleName $ apiModuleName <> NonEmpty.cons' "Enum" [name]
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
              { rowLabels:
                let
                  mkRow field =
                    { label: Label field.name
                    , type_: DeclarationsForFields.mkFieldTypeWithoutHoleAndOptionalForTopLevel field."type"
                    }
                 in (fromMaybe [] inputObjectType.inputFields) <#> mkRow
              , rowTail: Nothing
              }
            }
          ]
      )
      # Array.concat
  }
