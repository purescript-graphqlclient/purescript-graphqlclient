module Fernet.Graphql.SelectionSet where

import Data.Argonaut.Decode.Combinators
import Protolude

import Data.Argonaut.Core (Json) as ArgonautCore
import Data.Argonaut.Core as Data.Argonaut.Core
import Data.Array (cons) as Array
import Data.Codec.Argonaut as CodecArgonaut
import Data.Codec.Argonaut.Common (list) as CodecArgonaut.Common
import Data.Codec.Argonaut.Compat (maybe) as CodecArgonaut.Compat
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

data SelectionSet parentTypeLock a = SelectionSet (Array RawField) (CodecArgonaut.JsonCodec a)

instance selectionSetFunctor :: Functor (SelectionSet parentTypeLock) where
  map f (SelectionSet rawFieldArray jsonCodec) = SelectionSet rawFieldArray (?asdf $ map f jsonCodec)

instance selectionSetApply :: Apply (SelectionSet parentTypeLock) where
  apply :: ∀ a b parentTypeLock . SelectionSet parentTypeLock (a -> b) -> SelectionSet parentTypeLock a -> SelectionSet parentTypeLock b
  apply (SelectionSet rawFieldArray f) (SelectionSet rawFieldArrayB g) = SelectionSet (rawFieldArray <> rawFieldArrayB) (?asd)

class GraphqlDefaultResponseScalarCodec a where
  graphqlDefaultResponseScalarCodec :: CodecArgonaut.JsonCodec a

instance stringGraphqlDefaultResponseScalarCodec :: GraphqlDefaultResponseScalarCodec String where
  graphqlDefaultResponseScalarCodec = CodecArgonaut.string

instance intGraphqlDefaultResponseScalarCodec :: GraphqlDefaultResponseScalarCodec Int where
  graphqlDefaultResponseScalarCodec = CodecArgonaut.int

instance booleanGraphqlDefaultResponseScalarCodec :: GraphqlDefaultResponseScalarCodec Boolean where
  graphqlDefaultResponseScalarCodec = CodecArgonaut.boolean

instance numberGraphqlDefaultResponseScalarCodec :: GraphqlDefaultResponseScalarCodec Number where
  graphqlDefaultResponseScalarCodec = CodecArgonaut.number

instance charGraphqlDefaultResponseScalarCodec :: GraphqlDefaultResponseScalarCodec Char where
  graphqlDefaultResponseScalarCodec = CodecArgonaut.char

class GraphqlDefaultResponseFunctorCodec f where
  graphqlDefaultResponseFunctorCodec :: ∀ a. CodecArgonaut.JsonCodec a → CodecArgonaut.JsonCodec (f a)

instance maybeGraphqlDefaultResponseFunctorCodec :: GraphqlDefaultResponseFunctorCodec Maybe where
  graphqlDefaultResponseFunctorCodec = CodecArgonaut.Compat.maybe

instance arrayGraphqlDefaultResponseFunctorCodec :: GraphqlDefaultResponseFunctorCodec Array where
  graphqlDefaultResponseFunctorCodec = CodecArgonaut.array

instance listGraphqlDefaultResponseFunctorCodec :: GraphqlDefaultResponseFunctorCodec List where
  graphqlDefaultResponseFunctorCodec = CodecArgonaut.Common.list

class GraphqlDefaultResponseCodecTransformer a b | b -> a where
  graphqlDefaultResponseCodecTransformer :: CodecArgonaut.JsonCodec a -> CodecArgonaut.JsonCodec b

-- finds codecs for Array, Maybe, but also allows nested containers (e.g. `Array (Maybe x)`)
instance traversableCodecTransformer :: (GraphqlDefaultResponseCodecTransformer a b, GraphqlDefaultResponseFunctorCodec f) => GraphqlDefaultResponseCodecTransformer a (f b) where
  graphqlDefaultResponseCodecTransformer = graphqlDefaultResponseFunctorCodec

else

instance idCodecTransformer :: GraphqlDefaultResponseCodecTransformer a a where
  graphqlDefaultResponseCodecTransformer = identity

selectionForField :: forall parentTypeLock a . CodecArgonaut.JsonCodec a -> String -> SelectionSet parentTypeLock a
selectionForField fieldName jsonCodec = SelectionSet [ Leaf fieldName [] ] (CodecArgonaut.recordProp (SProxy :: _ fieldName) jsonCodec)

selectionForCompositeField
  :: forall objectTypeLock lockedTo a b
   . String
  -> Array Argument
  -> (CodecArgonaut.JsonCodec a -> CodecArgonaut.JsonCodec b)
  -> SelectionSet objectTypeLock a
  -> SelectionSet lockedTo b
selectionForCompositeField fieldName args jsonCodecTransformer (SelectionSet fields childCodec) =
  SelectionSet [ Composite fieldName args fields ] (CodecArgonaut.recordProp (SProxy :: _ fieldName) $ jsonCodecTransformer childCodec)

data RootQuery
data RootMutation
data RootSubscription
