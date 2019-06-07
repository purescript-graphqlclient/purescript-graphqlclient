module Fernet.GraphQL.SelectionSet where

import Prelude

import Record as Record
import Type.Row (class Nub, class Union)

newtype SelectionSet (a :: # Type) p = SelectionSet (Record a)
newtype ArraySelectionSet (a :: # Type) p = ArraySelectionSet (SelectionSet a p)

combine ::
  forall r1 r2 r3 p.
  (Union r1 r2 r3) =>
  (Nub r3 r3) =>
  SelectionSet r1 p ->
  SelectionSet r2 p ->
  SelectionSet r3 p
combine (SelectionSet s1) (SelectionSet s2) = SelectionSet $ Record.disjointUnion s1 s2

infixr 5 combine as <~>

empty :: forall p. SelectionSet () p
empty = SelectionSet {}
