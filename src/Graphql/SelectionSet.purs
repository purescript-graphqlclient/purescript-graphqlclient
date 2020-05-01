module Fernet.Graphql.SelectionSet where

import Protolude
import Data.Argonaut.Decode.Combinators

import Data.Argonaut.Core (Json) as ArgonautCore
import Data.Argonaut.Core as Data.Argonaut.Core
import Data.Argonaut.Decode as ArgonautCodec
import Prim.Row as Row
import Prim.RowList as RowList
import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)
import Record as Record
import Type.Data.RowList (RLProxy(..))

data ArgumentValue
  = ArgString String
  | ArgInt Int
  | ArgBoolean Boolean
  | ArgMaybeEmpty (Maybe ArgumentValue)
  | ArgNested (Array Argument)

data Argument
  = RequiredArgument String ArgumentValue
  | OptionalArgument String (Optional ArgumentValue)

-- [ RequiredArgument "eq" s
-- , RequiredArgument "ne" (Nothing)
-- , OptionalArgument "regex" (Absent) -- Present (Nothing)
-- , OptionalArgument "regex" (Absent) -- Present (Nothing)
-- ]

------------------------------------------------------

class DefaultInput a where
  defaultInput :: a

data Optional x = Absent | Present x

derive instance optionalFunctor :: Functor Optional

instance optionalDefaultInput :: DefaultInput (Optional a) where
  defaultInput = Absent

instance recordDefaultInput :: (DefaultInputRecord row list , RowList.RowToList row list) => DefaultInput (Record row) where
  defaultInput = defaultInputRecord (RLProxy :: RLProxy list)

-- RECORD
class DefaultInputRecord (row :: # Type) (list :: RowList.RowList) | list -> row where
  defaultInputRecord :: RLProxy list -> Record row

instance defaultInputRecordNil :: DefaultInputRecord () RowList.Nil where
  defaultInputRecord _proxy = {}

instance defaultInputRecordCons ::
  ( DefaultInput value
  , DefaultInputRecord rowTail tail
  , IsSymbol field
  , Row.Cons field value rowTail row
  , Row.Lacks field rowTail
  ) =>
  DefaultInputRecord row (RowList.Cons field value tail) where
  defaultInputRecord _proxy =
    let rest = defaultInputRecord (RLProxy :: RLProxy tail)
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

-- for lists, maybes, and for nested containers (e.g. like (List (Maybe x)))
instance traversableDecoderTransformer :: (Traversable f, DecoderTransformer a b, ArgonautCodec.DecodeJson (f ArgonautCore.Json)) => DecoderTransformer a (f b) where
  myDecoderTransformer childDecoder json = do
    -- spyM "traversableDecoderTransformer json" json
    (x :: f ArgonautCore.Json) <- ArgonautCodec.decodeJson json
    let (a_to_b :: Decoder a -> Decoder b) = myDecoderTransformer
    let (to_b :: Decoder b) = a_to_b childDecoder
    -- spyM "traversableDecoderTransformer json" x
    traverse to_b x

else

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
