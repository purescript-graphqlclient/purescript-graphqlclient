module GraphQLClientGenerator.MakeModule.InputObject where

import Prelude
import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String.Extra as StringsExtra
import GraphQLClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import GraphQLClientGenerator.IntrospectionSchema.TypeKindWithNull (TypeKindWithNull)
import GraphQLClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields
import Language.PS.SmartCST (Comments(..), DataHead(..), Declaration(..), Label(..), Module(..), ModuleName, ProperName(..), Type(..))

mkRow :: forall t. { apiModuleName :: NonEmptyArray String, scalarModule :: ModuleName } -> { name :: String, type :: TypeKindWithNull | t } -> { label :: Label, type_ :: Type }
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
                [ DeclType
                    { comments: Just $ OneLineComments [ "original name - " <> inputObjectType.name ]
                    , head:
                      DataHead
                        { dataHdName: ProperName $ pascalName
                        , dataHdVars: []
                        }
                    , type_:
                      TypeRecord
                        { rowLabels: fromMaybe [] inputObjectType.inputFields <#> mkRow { apiModuleName, scalarModule }
                        , rowTail: Nothing
                        }
                    }
                ]
          )
        # Array.concat
    }
