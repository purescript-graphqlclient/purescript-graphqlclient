module Fernet.GraphQL.WriteGraphQL where

import Prelude

import Fernet.GraphQL.SelectionSet (SelectionSet(..), ArraySelectionSet(..))
import Prim.RowList (class RowToList, kind RowList, Cons, Nil)
import Record as Record
import Type.Prelude (class IsSymbol, class ListToRow, SProxy(..), reflectSymbol)
import Type.Proxy (Proxy)
import Type.Row (class Cons, class Lacks)

class WriteGraphQL a where
  writeGQL :: a -> String

instance selectionSetWriteGraphQL ::
  ( RowToList row rowlist
  , ListToRow rowlist row
  , WriteGraphQLFields rowlist row
  ) => WriteGraphQL (SelectionSet row p) where
    writeGQL (SelectionSet r) = " { " <> writeFields r <> " } "

instance arraySelectionWriteGraphQL ::
  ( RowToList row rowlist
  , ListToRow rowlist row
  , WriteGraphQLFields rowlist row
  ) => WriteGraphQL (ArraySelectionSet row p) where
  writeGQL (ArraySelectionSet s) = writeGQL s

instance proxyWriteGraphQL :: WriteGraphQL (Proxy a) where
  writeGQL _ = ""

class WriteGraphQLFields (rl :: RowList) row where
  writeFields :: RowToList row rl
    => ListToRow rl row
    => Record row
    -> String

-- The case where the next record key/value pair has a value type of SelectionSet
instance consSelectionSetWriteGraphQLFields ::
  ( IsSymbol name
  , ListToRow tail tailrow
  , RowToList tailrow tail
  , Cons name v tailrow row
  , Lacks name tailrow
  , WriteGraphQL v
  , WriteGraphQLFields tail tailrow
  ) => WriteGraphQLFields (Cons name v tail) row where
    writeFields rec =
      reflectSymbol namep
      <> writeGQL value
      <> if writeFields rest == "" then "" else ", " <> writeFields rest
      where
        rest :: Record tailrow
        rest = Record.delete namep rec

        value :: v
        value = Record.get namep rec

        namep :: SProxy name
        namep = SProxy

instance writeGraphQLFieldsNil :: WriteGraphQLFields Nil row where
  writeFields _ = ""
