module MyGeneratorTestUtils.GraphqlRequest where

import Protolude

import Data.Function.Uncurried (Fn3, runFn3)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)
import Data.Argonaut.Core (Json)

foreign import _request :: forall r . Fn3 String String { | r } (EffectFnAff Json)

request :: forall r . String -> String -> { | r } -> Aff Json
request query graphqlUrl params = runFn3 _request query graphqlUrl params # fromEffectFnAff
