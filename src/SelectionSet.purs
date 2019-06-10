module Fernet.GraphQL.SelectionSet where

import Prelude

import Data.Maybe (Maybe)
import Type.Row (class Nub, class Union, RProxy(..))

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

data SelectionSet (return :: #Type) onQuery
  = SelectionSet (Array RawField) (RProxy return)

emptyArgs :: String -> forall r p. SelectionSet r p
emptyArgs name = SelectionSet [Leaf name []] RProxy

combine ::
  forall r1 r2 r3 p.
  (Union r1 r2 r3) =>
  (Nub r3 r3) =>
  SelectionSet r1 p ->
  SelectionSet r2 p ->
  SelectionSet r3 p
combine (SelectionSet args1 _) (SelectionSet args2 _) = SelectionSet (args1 <> args2) RProxy

infixr 5 combine as <|>

empty :: forall p. SelectionSet () p
empty = SelectionSet [] RProxy

data RootQuery
  = RootQuery
