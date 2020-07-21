module GraphqlClient.Argument where

import Protolude

import Data.Array as Array
import Data.Symbol (class IsSymbol, reflectSymbol)
import Prim.Row as Row
import Prim.RowList as RowList
import Record as Record
import Type.Data.RowList (RLProxy(..))

data ArgumentValue
  = ArgumentValueString String
  | ArgumentValueInt Int
  | ArgumentValueBoolean Boolean
  | ArgumentValueMaybe (Maybe ArgumentValue)
  | ArgumentValueArray (Array ArgumentValue)
  | ArgumentValueObject (Array Argument)

data Argument
  = RequiredArgument String ArgumentValue
  | OptionalArgument String (Optional ArgumentValue)

class ToGraphqlArgumentValue a where
  toGraphqlArgumentValue :: a -> ArgumentValue

instance toGraphqlArgumentValueString :: ToGraphqlArgumentValue String where
  toGraphqlArgumentValue = ArgumentValueString

instance toGraphqlArgumentValueInt :: ToGraphqlArgumentValue Int where
  toGraphqlArgumentValue = ArgumentValueInt

instance toGraphqlArgumentValueBoolean :: ToGraphqlArgumentValue Boolean where
  toGraphqlArgumentValue = ArgumentValueBoolean

instance toGraphqlArgumentValueRecord :: (RowList.RowToList row list, ToGraphqlArgumentImplementationRecord list row) => ToGraphqlArgumentValue (Record row) where
  toGraphqlArgumentValue record = ArgumentValueObject (toGraphqlArguments record)

instance toGraphqlArgumentValueMaybe :: ToGraphqlArgumentValue a => ToGraphqlArgumentValue (Maybe a) where
  toGraphqlArgumentValue maybeA = ArgumentValueMaybe (map toGraphqlArgumentValue maybeA)

instance toGraphqlArgumentValueNested :: ToGraphqlArgumentValue a => ToGraphqlArgumentValue (Array a) where
  toGraphqlArgumentValue arguments = ArgumentValueArray (map toGraphqlArgumentValue arguments)

toGraphqlArguments
  :: ∀ row list
   . RowList.RowToList row list
  => ToGraphqlArgumentImplementationRecord list row
  => (Record row)
  -> Array Argument
toGraphqlArguments rec = toGraphqlArgumentImplementationRecord (RLProxy :: RLProxy list) rec

-------------------------------------------------------

class ToGraphqlArgumentImplementationRecord (list :: RowList.RowList) (row :: # Type) | list -> row where
  toGraphqlArgumentImplementationRecord :: forall proxy. proxy list -> Record row -> Array Argument

-- for nested records
instance toGraphqlArgumentRecordConsChildRow ::
  ( RowList.RowToList childRow childList
  , ToGraphqlArgumentImplementationRecord childList childRow
  ---
  , ToGraphqlArgumentImplementationRecord tail row
  , IsSymbol field
  , Row.Cons field (Record childRow) rowTail row
  ) =>
  ToGraphqlArgumentImplementationRecord (RowList.Cons field (Record childRow) tail) row where
  toGraphqlArgumentImplementationRecord _proxy record =
    let
      (currentValue :: Record childRow) = Record.get (SProxy :: SProxy field) record
      (currentValue' :: Array Argument) = toGraphqlArguments currentValue
      (current :: Argument) = RequiredArgument (reflectSymbol (SProxy :: SProxy field)) (ArgumentValueObject currentValue')
      (rest :: Array Argument) = toGraphqlArgumentImplementationRecord (RLProxy :: RLProxy tail) record
    in Array.cons current rest

else

-- for optional values (optional nested records too)
instance toGraphqlArgumentRecordConsOptional ::
  ( ToGraphqlArgumentValue value
  , ToGraphqlArgumentImplementationRecord tail row
  , IsSymbol field
  , Row.Cons field (Optional value) rowTail row
  ) =>
  ToGraphqlArgumentImplementationRecord (RowList.Cons field (Optional value) tail) row where
  toGraphqlArgumentImplementationRecord _proxy record =
    let
      (currentValue :: Optional value) = Record.get (SProxy :: SProxy field) record
      (currentValue' :: Optional ArgumentValue) = map toGraphqlArgumentValue currentValue
      (current :: Argument) = OptionalArgument (reflectSymbol (SProxy :: SProxy field)) currentValue'
      (rest :: Array Argument) = toGraphqlArgumentImplementationRecord (RLProxy :: RLProxy tail) record
    in Array.cons current rest

else

-- for everything else (Nil)
instance toGraphqlArgumentRecordNil :: ToGraphqlArgumentImplementationRecord RowList.Nil row where
  toGraphqlArgumentImplementationRecord _proxy _record = []

else

-- for everything else (Cons)
instance toGraphqlArgumentRecordCons ::
  ( ToGraphqlArgumentValue value
  , ToGraphqlArgumentImplementationRecord tail row
  , IsSymbol field
  , Row.Cons field value rowTail row
  ) =>
  ToGraphqlArgumentImplementationRecord (RowList.Cons field value tail) row where
  toGraphqlArgumentImplementationRecord _proxy record =
    let
      (currentValue :: value) = Record.get (SProxy :: SProxy field) record
      (currentValue' :: ArgumentValue) = toGraphqlArgumentValue currentValue
      (current :: Argument) = RequiredArgument (reflectSymbol (SProxy :: SProxy field)) currentValue'
      (rest :: Array Argument) = toGraphqlArgumentImplementationRecord (RLProxy :: RLProxy tail) record
    in Array.cons current rest

--------------------

data Optional x = Absent | Present x -- it's like Maybe, but with DefaultInput class, and only for input of graphql

derive instance optionalFunctor :: Functor Optional

instance optionalDefaultInput :: DefaultInput (Optional a) where
  defaultInput = Absent

--------------------

class DefaultInput a where
  defaultInput :: a

instance recordDefaultInput :: (DefaultInputImplementationRecord row list , RowList.RowToList row list) => DefaultInput (Record row) where
  defaultInput = defaultInputImplementationRecord (RLProxy :: RLProxy list)

-- Implementation for Record
class DefaultInputImplementationRecord (row :: # Type) (list :: RowList.RowList) | list -> row where
  defaultInputImplementationRecord :: RLProxy list -> Record row

instance defaultInputImplementationRecordNil :: DefaultInputImplementationRecord () RowList.Nil where
  defaultInputImplementationRecord _proxy = {}

instance defaultInputImplementationRecordCons ::
  ( DefaultInput value
  , DefaultInputImplementationRecord rowTail tail
  , IsSymbol field
  , Row.Cons field value rowTail row
  , Row.Lacks field rowTail
  ) =>
  DefaultInputImplementationRecord row (RowList.Cons field value tail) where
  defaultInputImplementationRecord _proxy =
    let rest = defaultInputImplementationRecord (RLProxy :: RLProxy tail)
    in Record.insert (SProxy :: SProxy field) defaultInput rest
