module GraphQLClient.Utils where

import Protolude
import Data.List (fromFoldable) as List
import Data.List ((:))

anyPredicate :: ∀ a f . Foldable f => f (a -> Boolean) -> a -> Boolean
anyPredicate predicates = go (List.fromFoldable predicates)
  where
    go Nil a = false
    go (h : t) a = if h a then true else go t a
