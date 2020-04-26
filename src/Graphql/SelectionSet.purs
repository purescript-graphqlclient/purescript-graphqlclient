module Fernet.GraphQL.SelectionSet where

import Prelude
import Data.Maybe (Maybe)
--import Data.Symbol (class IsSymbol, SProxy(..))
--import Prim.Row (class Cons, class Lacks)
import Type.Row (class Nub, class Union)

--import Record (insert)
data ArgumentValue
  = ArgString String
  | ArgInt Int
  | ArgBoolean Boolean

data Argument
  = RequiredArgument String ArgumentValue
  | OptionalArgument String (Maybe ArgumentValue)

data RawField
  = Composite String (Array Argument) (Array RawField)
  | Leaf String (Array Argument)

data SelectionSet (return :: # Type) onQuery
  = SelectionSet (Array RawField)

combine ::
  forall r1 r2 r3 p.
  (Union r1 r2 r3) =>
  (Nub r3 r3) =>
  SelectionSet r1 p ->
  SelectionSet r2 p ->
  SelectionSet r3 p
combine (SelectionSet args1) (SelectionSet args2) = SelectionSet (args1 <> args2)

infixr 5 combine as <|>

noArgs :: String -> forall r p. SelectionSet r p
noArgs name = SelectionSet [ Leaf name [] ]

data RootQuery
  = RootQuery