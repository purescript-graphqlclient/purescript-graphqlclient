module Fernet.GraphQL.WriteGraphQL where

import Prelude

import Fernet.GraphQL.SelectionSet (RootQuery, SelectionSet(..))
import Prim.RowList (class RowToList, kind RowList, Cons, Nil)
import Type.Data.Row (RProxy(..))
import Type.Prelude (class IsSymbol, class ListToRow, SProxy(..), reflectSymbol)
import Type.Row (class Cons, class Lacks)

class WriteGraphQL a where
  writeGQL :: a -> String

instance selectionSetWriteGraphQL ::
  ( RowToList row rowlist
  , ListToRow rowlist row
  , WriteGraphQLFields rowlist row
  ) =>
  WriteGraphQL (SelectionSet args row RootQuery) where
  writeGQL (SelectionSet args _ ) = " query { " <> writeFields (RProxy :: RProxy row) <> " } "
else
instance defaultWriteGraphQL :: WriteGraphQL a where
  writeGQL _ = ""

class WriteGraphQLFields (rl :: RowList) (row :: #Type) where
  writeFields ::
    RowToList row rl =>
    ListToRow rl row =>
    RProxy row ->
    String


instance consArrayRecordWriteGraphQLFields ::
  ( IsSymbol name
  , ListToRow tail tailrow
  , RowToList tailrow tail
  , RowToList valueRow valueList
  , ListToRow valueList valueRow
  , Cons name (Array (Record valueRow)) tailrow row
  , Lacks name tailrow
  , WriteGraphQLFields valueList valueRow
  , WriteGraphQLFields tail tailrow
  ) =>
  WriteGraphQLFields (Cons name (Array (Record valueRow))  tail) row where
  writeFields _ =
    reflectSymbol namep
      <> " { " <> writeFields (RProxy :: RProxy valueRow) <> " } "
      <> if writeFields (RProxy :: RProxy tailrow) == "" then "" else ", " <> writeFields (RProxy :: RProxy tailrow)
    where
    namep :: SProxy name
    namep = SProxy
else
instance consRecordWriteGraphQLFields ::
  ( IsSymbol name
  , ListToRow tail tailrow
  , RowToList tailrow tail
  , RowToList valueRow valueList
  , ListToRow valueList valueRow
  , Cons name (Record valueRow) tailrow row
  , Lacks name tailrow
  , WriteGraphQLFields valueList valueRow
  , WriteGraphQLFields tail tailrow
  ) =>
  WriteGraphQLFields (Cons name (Record valueRow)  tail) row where
  writeFields _ =
    reflectSymbol namep
      <> " { " <> writeFields (RProxy :: RProxy valueRow) <> " } "
      <> if writeFields (RProxy :: RProxy tailrow) == "" then "" else ", " <> writeFields (RProxy :: RProxy tailrow)
    where
    namep :: SProxy name
    namep = SProxy
else
instance consDefaultSelectionSetWriteGraphQLFields ::
  ( IsSymbol name
  , ListToRow tail tailrow
  , RowToList tailrow tail
  , Cons name v tailrow row
  , Lacks name tailrow
  , WriteGraphQL a
  , WriteGraphQLFields tail tailrow
  ) =>
  WriteGraphQLFields (Cons name a tail) row where
  writeFields _ =
    reflectSymbol namep
      <> if writeFields (RProxy :: RProxy tailrow) == "" then "" else ", " <> writeFields (RProxy :: RProxy tailrow)
    where
    namep :: SProxy name
    namep = SProxy

instance writeGraphQLFieldsNil :: WriteGraphQLFields Nil row where
  writeFields _ = ""
