module GraphqlClientGenerator.MakeModule.InputObject where

import Protolude
import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmpty
import Data.String.Extra as StringsExtra
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType, InstorpectionQueryResult__InputValue)
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import Language.PS.SmartCST

mkRow context field =
  { label: Label field.name
  , type_: DeclarationsForFields.mkFieldTypeWithoutHoleAndOptionalForTopLevel context field."type"
  }

makeModule
  :: ModuleName
  -> NonEmptyArray String
  -> ModuleName
  -> Array InstorpectionQueryResult__FullType
  -> Module
makeModule
  scalarModule
  apiModuleName
  moduleName
  inputObjectTypes
  = Module
  { moduleName
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
            , type_: TypeRecord
              { rowLabels: fromMaybe [] inputObjectType.inputFields <#> mkRow { apiModuleName, scalarModule }
              , rowTail: Nothing
              }
            }
          ]
      )
      # Array.concat
  }
