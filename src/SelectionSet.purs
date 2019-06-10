module Fernet.GraphQL.SelectionSet where

import Type.Row (class Nub, class Union, RProxy(..))

newtype SelectionSet (output :: #Type) p
  = SelectionSet (RProxy output)

newtype ArraySelectionSet (output :: #Type) p
  = ArraySelectionSet (RProxy output)

proxy :: forall a p. SelectionSet a p
proxy = SelectionSet RProxy

combine ::
  forall r1 r2 r3 p.
  (Union r1 r2 r3) =>
  (Nub r3 r3) =>
  SelectionSet r1 p ->
  SelectionSet r2 p ->
  SelectionSet r3 p
combine _ _ = SelectionSet RProxy

infixr 5 combine as <~>

empty :: forall p. SelectionSet () p
empty = SelectionSet RProxy

data RootQuery
  = RootQuery
