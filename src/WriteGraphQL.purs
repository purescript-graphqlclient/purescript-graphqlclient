module Fernet.GraphQL.WriteGraphQL where

import Prelude

import Data.Maybe (Maybe)
import Fernet.GraphQL.SelectionSet (ArraySelectionSet, RootQuery, SelectionSet)
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
  WriteGraphQL (SelectionSet row RootQuery) where
  writeGQL _ = " query { " <> writeFields (RProxy :: RProxy row) <> " } "

instance arraySelectionWriteGraphQL ::
  ( RowToList row rowlist
  , ListToRow rowlist row
  , WriteGraphQLFields rowlist row
  ) =>
  WriteGraphQL (ArraySelectionSet row p) where
  writeGQL _ = " { " <> writeFields (RProxy :: RProxy row) <> " } "

instance stringWriteGraphQL :: WriteGraphQL String where
  writeGQL _ = ""

instance booleanWriteGraphQL :: WriteGraphQL Boolean where
  writeGQL _ = ""

instance intWriteGraphQL :: WriteGraphQL Int where
  writeGQL _ = ""

instance maybeWriteGraphQL :: WriteGraphQL (Maybe a) where
  writeGQL _ = ""

class WriteGraphQLFields (rl :: RowList) (row :: # Type) where
  writeFields ::
    RowToList row rl =>
    ListToRow rl row =>
    RProxy row ->
    String

instance consLeafStringSelectionSetWriteGraphQLFields ::
  ( IsSymbol name
  , ListToRow tail tailrow
  , RowToList tailrow tail
  , Cons name v tailrow row
  , Lacks name tailrow
  , WriteGraphQL String
  , WriteGraphQLFields tail tailrow
  ) =>
  WriteGraphQLFields (Cons name String tail) row where
  writeFields _ =
    reflectSymbol namep
      <> if writeFields (RProxy :: RProxy tailrow) == "" then "" else ", " <> writeFields (RProxy :: RProxy tailrow)
    where
    namep :: SProxy name
    namep = SProxy

instance consLeafMaybeSelectionSetWriteGraphQLFields ::
  ( IsSymbol name
  , ListToRow tail tailrow
  , RowToList tailrow tail
  , Cons name v tailrow row
  , Lacks name tailrow
  , WriteGraphQL (Maybe a)
  , WriteGraphQLFields tail tailrow
  ) =>
  WriteGraphQLFields (Cons name (Maybe a) tail) row where
  writeFields _ =
    reflectSymbol namep
      <> if writeFields (RProxy :: RProxy tailrow) == "" then "" else ", " <> writeFields (RProxy :: RProxy tailrow)
    where
    namep :: SProxy name
    namep = SProxy

instance consLeafIntSelectionSetWriteGraphQLFields ::
  ( IsSymbol name
  , ListToRow tail tailrow
  , RowToList tailrow tail
  , Cons name v tailrow row
  , Lacks name tailrow
  , WriteGraphQL Int
  , WriteGraphQLFields tail tailrow
  ) =>
  WriteGraphQLFields (Cons name Int tail) row where
  writeFields _ =
    reflectSymbol namep
      <> if writeFields (RProxy :: RProxy tailrow) == "" then "" else ", " <> writeFields (RProxy :: RProxy tailrow)
    where
    namep :: SProxy name
    namep = SProxy

instance consLeafBooleanSelectionSetWriteGraphQLFields ::
  ( IsSymbol name
  , ListToRow tail tailrow
  , RowToList tailrow tail
  , Cons name v tailrow row
  , Lacks name tailrow
  , WriteGraphQL Boolean
  , WriteGraphQLFields tail tailrow
  ) =>
  WriteGraphQLFields (Cons name Boolean tail) row where
  writeFields _ =
    reflectSymbol namep
      <> if writeFields (RProxy :: RProxy tailrow) == "" then "" else ", " <> writeFields (RProxy :: RProxy tailrow)
    where
    namep :: SProxy name
    namep = SProxy

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

-- The case where the next record key/value pair has a value type of SelectionSet
instance consLeafRecordWriteGraphQLFields ::
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

instance consNodeArraySelectionSetWriteGraphQLFields ::
  ( IsSymbol name
  , ListToRow tail tailrow
  , RowToList tailrow tail
  , RowToList valueRow valueList
  , ListToRow valueList valueRow
  , Cons name (ArraySelectionSet valueRow p) tailrow row
  , Lacks name tailrow
  , WriteGraphQLFields valueList valueRow
  , WriteGraphQLFields tail tailrow
  ) =>
  WriteGraphQLFields (Cons name (ArraySelectionSet valueRow p) tail) row where
  writeFields _ =
    reflectSymbol namep
      <> " { " <> writeFields (RProxy :: RProxy valueRow) <> " } "
      <> if writeFields (RProxy :: RProxy tailrow) == "" then "" else ", " <> writeFields (RProxy :: RProxy tailrow)
    where
    namep :: SProxy name
    namep = SProxy

instance writeGraphQLFieldsNil :: WriteGraphQLFields Nil row where
  writeFields _ = ""
