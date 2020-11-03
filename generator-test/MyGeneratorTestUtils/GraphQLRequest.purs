module MyGeneratorTestUtils.GraphQLRequest where

import Prelude
import Data.Argonaut.Core (Json)
import Data.Function.Uncurried (Fn3, runFn3)
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)

foreign import _request :: forall r. Fn3 String String { | r } (EffectFnAff Json)

request :: forall r. String -> String -> { | r } -> Aff Json
request query graphqlUrl params = runFn3 _request query graphqlUrl params # fromEffectFnAff
