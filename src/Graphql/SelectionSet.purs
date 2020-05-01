module Fernet.Graphql.SelectionSet where

import Data.Argonaut.Decode.Combinators
import Protolude

import Data.Argonaut.Core (Json) as ArgonautCore
import Data.Argonaut.Core as Data.Argonaut.Core
import Data.Argonaut.Decode as ArgonautCodec
import Data.Array (cons) as Array
import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)
import Prim.Row as Row
import Prim.RowList (class RowToList)
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

-- [ RequiredArgument "eq" s
-- , RequiredArgument "ne" (Nothing)
-- , OptionalArgument "regex" (Absent) -- Present (Nothing)
-- , OptionalArgument "regex" (Absent) -- Present (Nothing)
-- ]

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

-- for everything else
instance toGraphqlArgumentRecordNil :: ToGraphqlArgumentImplementationRecord RowList.Nil row where
  toGraphqlArgumentImplementationRecord _proxy _record = []

else

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

------------------------------------------------------

class DefaultInput a where
  defaultInput :: a

data Optional x = Absent | Present x

derive instance optionalFunctor :: Functor Optional

instance optionalDefaultInput :: DefaultInput (Optional a) where
  defaultInput = Absent

instance recordDefaultInput :: (DefaultInputImplementationRecord row list , RowList.RowToList row list) => DefaultInput (Record row) where
  defaultInput = defaultInputImplementationRecord (RLProxy :: RLProxy list)

-- RECORD
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

------------------------------------------------------

data RawField
  = Composite String (Array Argument) (Array RawField)
  | Leaf String (Array Argument)

-- TODO: better error messages https://github.com/garyb/purescript-codec-argonaut/blob/f8766cb1dcc3c80d712e6c72ce91624dede84038/src/Data/Codec/Argonaut.purs#L60
type Decoder a = Data.Argonaut.Core.Json -> Either String a

data SelectionSet parentTypeLock a = SelectionSet (Array RawField) (Decoder a)

derive instance selectionSetFunctor :: Functor (SelectionSet parentTypeLock)

instance selectionSetApply :: Apply (SelectionSet parentTypeLock) where
  apply :: ∀ a b parentTypeLock . SelectionSet parentTypeLock (a -> b) -> SelectionSet parentTypeLock a -> SelectionSet parentTypeLock b
  apply (SelectionSet rawFieldArray f) (SelectionSet rawFieldArrayB g) = SelectionSet (rawFieldArray <> rawFieldArrayB) (\json -> f json <*> g json)

selectionForField :: forall parentTypeLock a . ArgonautCodec.DecodeJson a => String -> SelectionSet parentTypeLock a
selectionForField fieldName = SelectionSet [ Leaf fieldName [] ] (\json -> do
    -- spyM ("selectionForCompositeField for " <> fieldName <> ": json") json
    jsonObject <- ArgonautCodec.decodeJson json
    -- spyM ("selectionForCompositeField for " <> fieldName <> ": jsonObject") jsonObject
    (fieldJson :: ArgonautCore.Json) <- jsonObject .: fieldName
    ArgonautCodec.decodeJson fieldJson
  )

class DecoderTransformer a b | b -> a where
  myDecoderTransformer :: Decoder a -> Decoder b

-- for lists, maybes, but also allows nested containers (e.g. `List (Maybe x)`)
instance traversableDecoderTransformer :: (Traversable f, DecoderTransformer a b, ArgonautCodec.DecodeJson (f ArgonautCore.Json)) => DecoderTransformer a (f b) where
  myDecoderTransformer childDecoder json = do
    -- spyM "traversableDecoderTransformer json" json
    (x :: f ArgonautCore.Json) <- ArgonautCodec.decodeJson json
    let (a_to_b :: Decoder a -> Decoder b) = myDecoderTransformer
    let (to_b :: Decoder b) = a_to_b childDecoder
    -- spyM "traversableDecoderTransformer json" x
    traverse to_b x

else

-- it's like Identity functor, but better
instance idDecoderTransformer :: DecoderTransformer a a where
  myDecoderTransformer = identity

selectionForCompositeField
  :: forall objectTypeLock lockedTo a b
   . DecoderTransformer a b
  => String
  -> Array Argument
  -> SelectionSet objectTypeLock a
  -> SelectionSet lockedTo b
selectionForCompositeField fieldName args (SelectionSet fields childDecoder) =
  SelectionSet [ Composite fieldName args fields ] (\json -> do
    -- spyM ("selectionForCompositeField for " <> fieldName <> ": json") json
    jsonObject <- ArgonautCodec.decodeJson json
    -- spyM ("selectionForCompositeField for " <> fieldName <> ": jsonObject") jsonObject
    (fieldJson :: ArgonautCore.Json) <- jsonObject .: fieldName
    myDecoderTransformer childDecoder fieldJson
  )

data RootQuery
data RootMutation
data RootSubscription
