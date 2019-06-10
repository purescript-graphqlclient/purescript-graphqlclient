module Fernet.GraphQL.SelectionSet where

import Record (disjointUnion)
import Type.Row (class Nub, class Union, RProxy(..))

data SelectionSet (args :: #Type) (return :: #Type) onQuery
  = SelectionSet (Record args) (RProxy return)

emptyArgs :: forall r p. SelectionSet () r p
emptyArgs = SelectionSet {} RProxy

combine ::
  forall a1 a2 a3 r1 r2 r3 p.
  (Union a1 a2 a3) =>
  (Nub a3 a3) =>
  (Union r1 r2 r3) =>
  (Nub r3 r3) =>
  SelectionSet a1 r1 p ->
  SelectionSet a2 r2 p ->
  SelectionSet a3 r3 p
combine (SelectionSet a1 _) (SelectionSet a2 _) = SelectionSet (disjointUnion a1 a2) RProxy

infixr 5 combine as <~>

empty :: forall p. SelectionSet () () p
empty = SelectionSet {} RProxy

data RootQuery
  = RootQuery
