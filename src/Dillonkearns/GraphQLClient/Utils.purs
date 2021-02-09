module Dillonkearns.GraphQLClient.Utils where

import Data.Foldable (class Foldable)
import Data.List (List(..), (:))
import Data.List (fromFoldable) as List

anyPredicate :: ∀ a f. Foldable f => f (a -> Boolean) -> a -> Boolean
anyPredicate predicates = go (List.fromFoldable predicates)
  where
  go Nil a = false
  go (h : t) a = if h a then true else go t a
