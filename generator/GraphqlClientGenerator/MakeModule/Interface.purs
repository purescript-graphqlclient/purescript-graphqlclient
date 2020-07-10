module GraphqlClientGenerator.MakeModule.Interface where

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

makeModule :: ModuleName -> InstorpectionQueryResult__FullType -> Module
makeModule moduleName fullType = Module
  { moduleName
  , imports: []
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
    ]
  }
