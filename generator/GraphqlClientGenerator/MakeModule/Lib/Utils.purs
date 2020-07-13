module GraphqlClientGenerator.MakeModule.Lib.Utils where

import Protolude (Maybe(..), ($), (<>))

import Language.PS.CST (DataHead(..), Declaration(..), Expr(..), ProperName(..), Type(..))
import Language.PS.CST.Sugar (nonQualifiedName)
import Data.String.Extra as StringsExtra

tupleDecl :: Type -> Type -> Type
tupleDecl x y =
  (TypeConstructor $ nonQualifiedName (ProperName "Tuple"))
  `TypeApp`
  x
  `TypeApp`
  y

tupleExpr :: Expr -> Expr -> Expr
tupleExpr x y =
  (ExprConstructor $ nonQualifiedName (ProperName "Tuple"))
  `ExprApp`
  x
  `ExprApp`
  y

declDataWithoutConstructors :: String -> Declaration
declDataWithoutConstructors name = DeclData
  { comments: Nothing
  , head: DataHead
      { dataHdName: ProperName name
      , dataHdVars: []
      }
  , constructors: []
  }

scopeName :: String -> String
scopeName name = "Scope__" <> StringsExtra.pascalCase name
