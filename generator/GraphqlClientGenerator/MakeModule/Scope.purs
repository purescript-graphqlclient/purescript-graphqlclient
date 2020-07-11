module GraphqlClientGenerator.MakeModule.Scope where

import Language.PS.AST
import Language.PS.AST.Sugar
import Protolude

import Data.Array as Array
import Data.String.Extra as StringsExtra

makeModule :: ModuleName -> Array String -> Module
makeModule moduleName entityNames = Module
  { moduleName
  , imports: []
  , exports: []
  , declarations:
      entityNames <#>
      (\entityName ->
        DeclData
          { comments: Nothing
          , head: DataHead
              { dataHdName: ProperName $ "Scope__" <> StringsExtra.pascalCase entityName
              , dataHdVars: []
              }
          , constructors: []
          }
      )
  }
