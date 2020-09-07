module GraphqlClient.Implementation where

import Protolude

import Data.Argonaut.Core (Json, fromString)
import Data.Argonaut.Decode (JsonDecodeError(..))
import Data.Argonaut.Decode.Decoders as ArgonautDecoders.Decoder
import Data.Array as Array
import Data.List ((:))
import Data.List as List
import GraphqlClient.Argument (Argument)
import GraphqlClient.WriteGraphqlHash (Cache, argsHash)

data Scope__RootQuery
data Scope__RootMutation
data Scope__RootSubscription

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

-- Internal to this lib, you should use GraphqlDefaultResponseFunctorOrScalarDecoderTransformer instead usually
class GraphqlDefaultResponseFunctorDecoder f where
  graphqlDefaultResponseFunctorDecoder :: ∀ a. (Json -> Either JsonDecodeError a) -> Json -> Either JsonDecodeError (f a)

instance maybeGraphqlDefaultResponseFunctorDecoder :: GraphqlDefaultResponseFunctorDecoder Maybe where
  graphqlDefaultResponseFunctorDecoder = ArgonautDecoders.Decoder.decodeMaybe

instance arrayGraphqlDefaultResponseFunctorDecoder :: GraphqlDefaultResponseFunctorDecoder Array where
  graphqlDefaultResponseFunctorDecoder = ArgonautDecoders.Decoder.decodeArray

instance listGraphqlDefaultResponseFunctorDecoder :: GraphqlDefaultResponseFunctorDecoder List where
  graphqlDefaultResponseFunctorDecoder = ArgonautDecoders.Decoder.decodeList

------------------------------------------------------

-- To find decoder for nested functors (e.g. `f (g a)`) or non-functor types (e.g. `a`)
class GraphqlDefaultResponseFunctorOrScalarDecoderTransformer a b | b -> a where
  graphqlDefaultResponseFunctorOrScalarDecoderTransformer :: (Json -> Either JsonDecodeError a) -> Json -> Either JsonDecodeError b

-- finds decoders for Array, Maybe, but also allows nested containers (e.g. `Array (Maybe x)`)
instance traversableDecoderTransformer :: (GraphqlDefaultResponseFunctorOrScalarDecoderTransformer a b, GraphqlDefaultResponseFunctorDecoder f) => GraphqlDefaultResponseFunctorOrScalarDecoderTransformer a (f b) where
  graphqlDefaultResponseFunctorOrScalarDecoderTransformer childDecoder =
     let
       (json_to_b :: Json -> Either JsonDecodeError b) = graphqlDefaultResponseFunctorOrScalarDecoderTransformer childDecoder
       (json_to_fb :: Json -> Either JsonDecodeError (f b)) = graphqlDefaultResponseFunctorDecoder json_to_b
      in json_to_fb

else

instance idDecoderTransformer :: GraphqlDefaultResponseFunctorOrScalarDecoderTransformer a a where
  graphqlDefaultResponseFunctorOrScalarDecoderTransformer = identity

------------------------------------------------------

data RawField
  = Composite
    String -- field name, e.g. `hero {...}`
    (Array RawField)
    (Maybe Cache)
  | OnSpread
    String -- e.g. `... on Human`
    (Array RawField)
  | Leaf
    -- TODO: should I add `typeString` https://github.com/dillonkearns/elm-graphql/blob/9aab5ae867a9d0036526deafa0375de90b377b28/src/Graphql/Document/Field.elm#L29 ?
    String -- field name
    (Maybe Cache)

data SelectionSet parentTypeLock a = SelectionSet (Array RawField) (Json -> Either JsonDecodeError a)

derive instance selectionSetFunctor :: Functor (SelectionSet parentTypeLock)

instance applicativeSelectionSet :: Applicative (SelectionSet parentTypeLock) where
  pure :: ∀ a parentTypeLock . a -> SelectionSet parentTypeLock a
  pure a = SelectionSet [] (const $ Right a)

instance applySelectionSet :: Apply (SelectionSet parentTypeLock) where
  apply :: ∀ a b parentTypeLock . SelectionSet parentTypeLock (a -> b) -> SelectionSet parentTypeLock a -> SelectionSet parentTypeLock b
  apply (SelectionSet rawFieldArray f) (SelectionSet rawFieldArrayB g) = SelectionSet (rawFieldArray <> rawFieldArrayB) (\json -> f json <*> g json)

map2 :: forall parentTypeLock a b c. (a -> b -> c) -> SelectionSet parentTypeLock a -> SelectionSet parentTypeLock b -> SelectionSet parentTypeLock c
map2 f (SelectionSet fieldsA decoderA) (SelectionSet fieldsB decoderB) = SelectionSet (fieldsA <> fieldsB) \json -> ado
  a <- decoderA json
  b <- decoderB json
  in f a b

foldl :: forall a b parentTypeLock . (b -> a -> b) -> b -> Array (SelectionSet parentTypeLock a) -> SelectionSet parentTypeLock b
foldl f accum = Array.foldl (map2 f) (pure accum)
-- | foldlSelectionSet f accum selectionSets = SelectionSet (selectionSets <#> \(SelectionSet fields _) -> Array.concat fields) (\json -> ?a)

data FragmentSelectionSet parentTypeLock a = FragmentSelectionSet String (Array RawField) (Json -> Either JsonDecodeError a)

-- | When the field is requested with some argument - the generated field name should be unique
-- | to prevent errors if the same field is requested with different arguments in some other place
-- |
-- | For example:
-- |
-- | given schema
-- |
-- | ```graphql
-- | schema {
-- |   query: RootQueryType
-- | }
-- |
-- | type RootQueryType {
-- |   xxx: Int!
-- |   yyy(yyyArg: Boolean!): String!
-- | }
-- | ```
-- |
-- | and code
-- |
-- | ```purs
-- | xxx :: SelectionSet Scope__RootQuery Int
-- | xxx = selectionForField "xxx" [] graphqlDefaultResponseScalarDecoder
-- |
-- | yyy :: { yyyArg :: Boolean } -> SelectionSet Scope__RootQuery String
-- | yyy input = selectionForField "yyy" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder
-- | -- which is equal to
-- | -- yyy input = selectionForField "yyy" [RequiredArgument "yyyArg" (ArgumentValueBoolean input.yyyArg)] graphqlDefaultResponseScalarDecoder
-- |
-- | myQuery :: SelectionSet Scope__RootQuery { xxx :: Boolean, yyy1 :: String, yyy2 :: String }
-- | myQuery =
-- |   { xxx: _, yyy1: _, yyy2: _ }
-- |   <$> xxx
-- |   <*> yyy { yyyArg: true }
-- |   <*> yyy { yyyArg: false }
-- | ```
-- |
-- | should generate
-- |
-- | ```graphql
-- | query {
-- |   xxx
-- |   yyyUNIQ_HASH_FROM_ARGS: yyy(yyyArg: true)
-- |   yyyUNIQ_HASH_FROM_ARGS2: yyy(yyyArg: false)
-- | }
-- | ```
-- |
-- | The hash was generated because `selectionForField` arguments array WAS NOT EMPTY!

fieldNameWithHash :: Maybe Cache -> String -> String
fieldNameWithHash (Just cache) fieldName = fieldName <> cache.hash
fieldNameWithHash _ fieldName = fieldName

-- Useful when json comes from external source, e.g. introspection schema from json file
-- in that case we dont need hash in the field name
-- only for internal use
fieldNameWithoutHash :: Maybe Cache -> String -> String
fieldNameWithoutHash _ fieldName = fieldName

-- only for internal use
selectionForFieldImplementation
  :: forall parentTypeLock a
   . (Maybe Cache -> String -> String)
  -> String
  -> Array Argument
  -> (Json -> Either JsonDecodeError a)
  -> SelectionSet parentTypeLock a
selectionForFieldImplementation fieldNameFn fieldName args decoder =
  let
    maybeCache :: Maybe Cache
    maybeCache = argsHash args
  in SelectionSet [Leaf fieldName maybeCache] (\json -> do
    object <- ArgonautDecoders.Decoder.decodeJObject json
    ArgonautDecoders.Decoder.getField decoder object (fieldNameFn maybeCache fieldName)
  )

selectionForField
  :: forall parentTypeLock a
   . String
  -> Array Argument
  -> (Json -> Either JsonDecodeError a)
  -> SelectionSet parentTypeLock a
selectionForField = selectionForFieldImplementation fieldNameWithHash

-- only for internal use
selectionForCompositeFieldImplementation
  :: forall objectTypeLock lockedTo a b
   . (Maybe Cache -> String -> String)
  -> String
  -> Array Argument
  -> ((Json -> Either JsonDecodeError a) -> Json -> Either JsonDecodeError b)
  -> SelectionSet objectTypeLock a
  -> SelectionSet lockedTo b
selectionForCompositeFieldImplementation fieldNameFn fieldName args jsonDecoderTransformer (SelectionSet fields childDecoder) =
  let
    maybeCache :: Maybe Cache
    maybeCache = argsHash args
  in SelectionSet
    [ Composite fieldName fields maybeCache ]
    (\json -> do
      object <- ArgonautDecoders.Decoder.decodeJObject json
      ArgonautDecoders.Decoder.getField (jsonDecoderTransformer childDecoder) object (fieldNameFn maybeCache fieldName)
    )

selectionForCompositeField
  :: forall objectTypeLock lockedTo a b
   . String
  -> Array Argument
  -> ((Json -> Either JsonDecodeError a) -> Json -> Either JsonDecodeError b)
  -> SelectionSet objectTypeLock a
  -> SelectionSet lockedTo b
selectionForCompositeField = selectionForCompositeFieldImplementation fieldNameWithHash

buildFragment :: forall decodesTo selectionLock fragmentLock . String -> SelectionSet selectionLock decodesTo -> FragmentSelectionSet fragmentLock decodesTo
buildFragment fragmentTypeName (SelectionSet fields decoder) = FragmentSelectionSet fragmentTypeName fields decoder

exhaustiveFragmentSelection :: forall typeLock decodesTo . Array (FragmentSelectionSet typeLock decodesTo) -> SelectionSet typeLock decodesTo
exhaustiveFragmentSelection fragments =
  SelectionSet
    (fragments <#> \(FragmentSelectionSet onType fields _decoder) -> OnSpread onType fields)
    (\json -> do
      object <- ArgonautDecoders.Decoder.decodeJObject json
      __typename <- ArgonautDecoders.Decoder.getField ArgonautDecoders.Decoder.decodeString object "__typename"

      let
        result :: Maybe (Either JsonDecodeError decodesTo)
        result = Array.findMap
          (\(FragmentSelectionSet onType _fields decoder) ->
            if onType == __typename
              then Just $ decoder json
              else Nothing
          )
          fragments

      case result of
           Nothing -> Left $ AtKey "__typename" $ UnexpectedValue $ fromString __typename
           Just e -> e
    )

nonNullOrFail
  :: forall lockedTo a
   . SelectionSet lockedTo (Maybe a)
  -> SelectionSet lockedTo a
nonNullOrFail = bindSelectionSet (note MissingValue)

nonNullElementsOrFail
  :: forall lockedTo a
   . SelectionSet lockedTo (Array (Maybe a))
  -> SelectionSet lockedTo (Array a)
nonNullElementsOrFail = bindSelectionSet (sequence >>> note MissingValue)

bindSelectionSet
  :: forall lockedTo a b
   . (a -> Either JsonDecodeError b)
  -> SelectionSet lockedTo a
  -> SelectionSet lockedTo b
bindSelectionSet decodeOutput (SelectionSet fields decoder) = SelectionSet fields (\json -> decoder json >>= decodeOutput)

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
