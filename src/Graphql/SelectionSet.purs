module Fernet.Graphql.SelectionSet where

import Protolude
import Data.Argonaut.Decode.Combinators

import Data.Argonaut.Core (Json) as ArgonautCore
import Data.Argonaut.Core as Data.Argonaut.Core
import Data.Argonaut.Decode as ArgonautCodec

--import Record (insert)
data ArgumentValue
  = ArgString String
  | ArgInt Int
  | ArgBoolean Boolean

data Argument
  = RequiredArgument String ArgumentValue
  | OptionalArgument String (Maybe ArgumentValue)

data RawField
  = Composite String (Array Argument) (Array RawField)
  | Leaf String (Array Argument)

-- TODO: better error messages https://github.com/garyb/purescript-codec-argonaut/blob/f8766cb1dcc3c80d712e6c72ce91624dede84038/src/Data/Codec/Argonaut.purs#L60
type Decoder a = Data.Argonaut.Core.Json -> Either String a

data SelectionSet parentTypeLock a = SelectionSet (Array RawField) (Decoder a)

-- NOT possible
-- instance selectionSetSemigroup :: Semigroup (SelectionSet parentTypeLock a) where
--   append (SelectionSet rawFieldArrayA decoderA) (SelectionSet rawFieldArrayB decoderB) = ?asdf

-- instance selectionSetFunctor :: Functor (SelectionSet parentTypeLock) where
--   map :: ∀ a b parentTypeLock . (a -> b) -> SelectionSet parentTypeLock a -> SelectionSet parentTypeLock b
--   map f (SelectionSet rawFieldArray decoder) = SelectionSet rawFieldArray (decoder >>> map f)

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
  myDecoderTransformer = \childDecoder -> \json -> do
     -- spyM "idDecoderTransformer json" json
     childDecoder json

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

-- noArgsWithCustomDecoder :: forall parentTypeLock a . ArgonautCodec.DecodeJson a => String -> SelectionSet parentTypeLock a
-- noArgsWithCustomDecoder name = SelectionSet [ Leaf name [] ] ArgonautCodec.decodeJson

data RootQuery = RootQuery
