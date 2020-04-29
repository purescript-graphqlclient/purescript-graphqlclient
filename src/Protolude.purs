-- https://github.com/natefaubion/slamdata/blob/master/src/SlamData/Prelude.purs

module Protolude
  ( (\/), traceId --, (|>), (<|), (||>), (<||)
  , type ($), type (#), type (<<<), type (>>>)
  , undefined
  , traceWithoutInspect, traceWithoutInspectId, traceWithoutInspectM, spyM
  , Apply, ApplyFlipped, Compose, ComposeFlipped
  , module Prelude
  , module Control.Alt
  , module Control.Apply
  , module Control.Bind
  , module Control.Monad
  , module Control.Monad.Error.Class
  , module Control.Monad.Except
  , module Control.Monad.Maybe.Trans
  , module Control.Monad.Reader
  , module Control.Monad.Trans.Class
  , module Control.MonadPlus
  , module Control.Parallel
  , module Control.Plus
  , module Data.Bifoldable
  , module Data.Bifunctor
  , module Data.Bitraversable
  , module Data.Const
  , module Data.Either
  , module Data.Either.Nested
  , module Data.Foldable
  , module Data.Functor
  , module Data.Functor.Coproduct
  , module Data.Generic.Rep
  , module Data.Maybe
  , module Data.Newtype
  , module Data.Monoid
  , module Data.Traversable
  , module Data.Tuple
  , module Data.Tuple.Nested
  , module Data.Variant
  , module Data.Void
  , module Debug.Trace
  , module Data.List
  , module Partial.Unsafe
  , module Effect
  , module Effect.Class
  , module Effect.Aff
  , module Effect.Aff.Class
  )
  where

import Prelude

import Control.Alt (class Alt, (<|>))
import Control.Apply ((*>), (<*))
import Control.Bind (join, (>=>), (<=<), bindFlipped, bind)
import Control.Monad (when, unless)
import Control.Monad.Error.Class (class MonadError, class MonadThrow, throwError, catchError, try)
import Control.Monad.Except (ExceptT(..), runExcept, runExceptT, except)
import Control.Monad.Maybe.Trans (MaybeT(..), runMaybeT)
import Control.Monad.Reader (class MonadAsk, class MonadReader, ask)
import Control.Monad.Trans.Class (class MonadTrans, lift)
import Control.MonadPlus (class MonadPlus, guard)
import Control.Parallel (class Parallel, parTraverse, parTraverse_)
import Control.Plus (class Plus, empty)

import Data.Bifoldable (class Bifoldable, bitraverse_, bifor_)
import Data.Bifunctor (class Bifunctor, bimap, lmap, rmap)
import Data.Bitraversable (class Bitraversable, bitraverse, bisequence, bifor)
import Data.Const (Const(..))
import Data.Either (Either(..), either, isLeft, isRight, fromRight, note)
import Data.Either.Nested (type (\/))
import Data.Foldable (class Foldable, traverse_, for_, foldMap, foldl, foldr, fold, intercalate)
import Data.Functor (($>), (<$))
import Data.Functor.Coproduct (Coproduct, coproduct, left, right)
import Data.Generic.Rep (class Generic)
import Data.List (List(..))
import Data.Maybe (Maybe(..), fromMaybe, fromMaybe', isJust, isNothing, maybe, maybe', fromJust)
import Data.Monoid (class Monoid, mempty)
import Data.Newtype (class Newtype, unwrap, ala, alaF)
import Data.Traversable (class Traversable, traverse, sequence, for)
import Data.Tuple (Tuple(..), fst, snd, uncurry)
import Data.Tuple.Nested (type (/\), (/\))
import Data.Variant (SProxy(..), Variant)
import Data.Void (Void, absurd)

import Debug.Trace (trace, traceM, spy)

import Partial.Unsafe (unsafePartial)

import Effect (Effect)
import Effect.Class (class MonadEffect, liftEffect)
import Effect.Aff (Aff, launchAff)
import Effect.Aff.Class (class MonadAff, liftAff)

import Debug.Trace as Internal.DebugTrace
import Unsafe.Coerce as Internal.Unsafe.Coerce
import Prim.TypeError as Internal.Prim.TypeError

infixr 5 either as \/

traceId :: ∀ a . Internal.DebugTrace.DebugWarning => a -> a
traceId a = trace a (const a)

foreign import traceWithoutInspect :: forall a b. Internal.DebugTrace.DebugWarning => a -> (Unit -> b) -> b
foreign import spyWithCallback :: forall a b. Internal.DebugTrace.DebugWarning => String -> a -> (Unit -> b) -> b

traceWithoutInspectId :: ∀ a . Internal.DebugTrace.DebugWarning => a -> a
traceWithoutInspectId a = traceWithoutInspect a (const a)

traceWithoutInspectM :: forall m a. Internal.DebugTrace.DebugWarning => Monad m => a -> m Unit
traceWithoutInspectM s = do
  pure unit
  traceWithoutInspect s \_ -> pure unit

spyM :: forall m a. Internal.DebugTrace.DebugWarning => Monad m => String -> a -> m Unit
spyM s a = do
  pure unit
  spyWithCallback s a \_ -> pure unit

undefined :: ∀ a. (Internal.Prim.TypeError.Warn (Internal.Prim.TypeError.Text "undefined usage")) => a
undefined = Internal.Unsafe.Coerce.unsafeCoerce unit

-- import Data.Function as Internal.DataFunction
-- import Data.Functor as Internal.DataFunctor
-- infixr 0 Internal.DataFunction.apply as <|
-- infixr 0 apply as $
-- infixl 1 Internal.DataFunction.applyFlipped as |>
-- infixl 1 applyFlipped as #
-- infixl 4 Internal.DataFunctor.map as <||
-- infixl 4 map as <$>
-- infixl 4 Internal.DataFunctor.mapFlipped as ||>
-- infixl 1 mapFlipped as <#>

type Compose f g a = f (g a)
infixr 9 type Compose as <<<

type ComposeFlipped f g a = g (f a)
infixr 9 type ComposeFlipped as >>>

type Apply f a = f a
infixr 0 type Apply as $
-- infixr 0 type Apply as <|

type ApplyFlipped a f = f a
infixl 1 type ApplyFlipped as #
-- infixl 1 type ApplyFlipped as |>

-- test :: ∀ a b. Tuple a b -> Tuple a (Array b)
-- test :: ∀ a b. Tuple a b -> Tuple a <<< Array $ b
-- test :: ∀ a b. Tuple a b -> b # Tuple a <<< Array
-- test :: ∀ a b. Tuple a b -> b # Array >>> Tuple a
-- test :: ∀ a . Tuple a ~> Tuple a <<< Array
-- test (a /\ b) = a /\ [b]
