module GraphqlClient.Implementation where

import Data.Argonaut.Decode.Combinators
import Protolude

import Data.Argonaut.Core (Json)
import Data.Argonaut.Core as ArgonautCore
import Data.Argonaut.Decode (JsonDecodeError(..))
import Data.Argonaut.Decode as ArgonautDecoders
import Data.Argonaut.Decode.Decoders as ArgonautDecoders.Decoder
import Data.Array as Array
import Data.List ((:))
import Data.List as List
import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)
import Prim.Row as Row
import Prim.RowList (class RowToList)
import Prim.RowList as RowList
import Record as Record
import Type.Data.RowList (RLProxy(..))

data RootQuery
data RootMutation
data RootSubscription

--------------------

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

------------------------------------------------------

class DefaultInput a where
  defaultInput :: a

data Optional x = Absent | Present x -- it's like Maybe, but with DefaultInput class, and only for input of graphql

derive instance optionalFunctor :: Functor Optional

instance optionalDefaultInput :: DefaultInput (Optional a) where
  defaultInput = Absent

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

------------------------------------------------------

data RawField
  = Composite String (Array Argument) (Array RawField)
  | Leaf String (Array Argument)

data SelectionSet parentTypeLock a = SelectionSet (Array RawField) (Json -> Either JsonDecodeError a)

derive instance selectionSetFunctor :: Functor (SelectionSet parentTypeLock)

instance selectionSetApply :: Apply (SelectionSet parentTypeLock) where
  apply :: ∀ a b parentTypeLock . SelectionSet parentTypeLock (a -> b) -> SelectionSet parentTypeLock a -> SelectionSet parentTypeLock b
  apply (SelectionSet rawFieldArray f) (SelectionSet rawFieldArrayB g) = SelectionSet (rawFieldArray <> rawFieldArrayB) (\json -> f json <*> g json)

------------------------------------------------------

class GraphqlDefaultResponseScalarDecoder a where
  graphqlDefaultResponseScalarDecoder :: Json -> Either JsonDecodeError a

instance stringGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder String where
  graphqlDefaultResponseScalarDecoder = ArgonautDecoders.Decoder.decodeString

instance intGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder Int where
  graphqlDefaultResponseScalarDecoder = ArgonautDecoders.Decoder.decodeInt

instance booleanGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder Boolean where
  graphqlDefaultResponseScalarDecoder = ArgonautDecoders.Decoder.decodeBoolean

instance numberGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder Number where
  graphqlDefaultResponseScalarDecoder = ArgonautDecoders.Decoder.decodeNumber

instance functorGraphqlDefaultResponseScalarDecoder :: (GraphqlDefaultResponseFunctorDecoder f, GraphqlDefaultResponseScalarDecoder a) => GraphqlDefaultResponseScalarDecoder (f a) where
  graphqlDefaultResponseScalarDecoder = graphqlDefaultResponseFunctorDecoder graphqlDefaultResponseScalarDecoder

------------------------------------------------------

class GraphqlDefaultResponseFunctorDecoder f where
  graphqlDefaultResponseFunctorDecoder :: ∀ a. (Json -> Either JsonDecodeError a) -> Json -> Either JsonDecodeError (f a)

instance maybeGraphqlDefaultResponseFunctorDecoder :: GraphqlDefaultResponseFunctorDecoder Maybe where
  graphqlDefaultResponseFunctorDecoder = ArgonautDecoders.Decoder.decodeMaybe

instance arrayGraphqlDefaultResponseFunctorDecoder :: GraphqlDefaultResponseFunctorDecoder Array where
  graphqlDefaultResponseFunctorDecoder = ArgonautDecoders.Decoder.decodeArray

instance listGraphqlDefaultResponseFunctorDecoder :: GraphqlDefaultResponseFunctorDecoder List where
  graphqlDefaultResponseFunctorDecoder = ArgonautDecoders.Decoder.decodeList

------------------------------------------------------

class GraphqlDefaultResponseDecoderTransformer a b | b -> a where
  graphqlDefaultResponseDecoderTransformer :: (Json -> Either JsonDecodeError a) -> Json -> Either JsonDecodeError b

-- finds decoders for Array, Maybe, but also allows nested containers (e.g. `Array (Maybe x)`)
instance traversableDecoderTransformer :: (GraphqlDefaultResponseDecoderTransformer a b, GraphqlDefaultResponseFunctorDecoder f) => GraphqlDefaultResponseDecoderTransformer a (f b) where
  graphqlDefaultResponseDecoderTransformer childDecoder = do
     let (json_to_b :: Json -> Either JsonDecodeError b) = graphqlDefaultResponseDecoderTransformer childDecoder
     let (json_to_fb :: Json -> Either JsonDecodeError (f b)) = graphqlDefaultResponseFunctorDecoder json_to_b
     json_to_fb

else

instance idDecoderTransformer :: GraphqlDefaultResponseDecoderTransformer a a where
  graphqlDefaultResponseDecoderTransformer = identity

------------------------------------------------------

selectionForField :: forall parentTypeLock a . String -> Array Argument -> (Json -> Either JsonDecodeError a) -> SelectionSet parentTypeLock a
selectionForField fieldName args decoder = SelectionSet [Leaf fieldName args] (\json -> do
    object <- ArgonautDecoders.Decoder.decodeJObject json
    ArgonautDecoders.Decoder.getField decoder object fieldName
  )

selectionForCompositeField
  :: forall objectTypeLock lockedTo a b
   . String
  -> Array Argument
  -> ((Json -> Either JsonDecodeError a) -> Json -> Either JsonDecodeError b)
  -> SelectionSet objectTypeLock a
  -> SelectionSet lockedTo b
selectionForCompositeField fieldName args jsonDecoderTransformer (SelectionSet fields childDecoder) =
  SelectionSet [ Composite fieldName args fields ] (\json -> do
    object <- ArgonautDecoders.Decoder.decodeJObject json
    ArgonautDecoders.Decoder.getField (jsonDecoderTransformer childDecoder) object fieldName
  )

getSelectionSetDecoder :: ∀ lockedTo a . SelectionSet lockedTo a -> Json -> Either JsonDecodeError a
getSelectionSetDecoder (SelectionSet fields decoder) = decoder

enumDecoder :: ∀ a . String -> Array (String /\ a) -> Json -> Either JsonDecodeError a
enumDecoder = enumDecoder'
  where
    enumDecoder' name fromToMap = implementation name (List.fromFoldable fromToMap)

    go Nil parsed = Nothing
    go ((str /\ val) : t) parsed = if str == parsed then Just val else go t parsed

    implementation :: String -> List (String /\ a) -> Json -> Either JsonDecodeError a
    implementation name fromToMap json = lmap (Named name) do
      string <- ArgonautDecoders.Decoder.decodeString json
      go fromToMap string # note (UnexpectedValue json)
