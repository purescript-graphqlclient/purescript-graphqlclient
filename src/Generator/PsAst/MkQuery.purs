module Generator.PsAst.MkQueryModule where

import Fernet.Introspection.IntrospectionSchema
import Fernet.Introspection.Schema.TypeKind
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
import Fernet.Introspection.Schema.Fields (__schema)
import Data.String.Extra as StringsExtra

mkQueryModule :: ModuleName -> InstorpectionQueryResult__FullType -> Module
mkQueryModule moduleName fullType = Module
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
    ]
  }
