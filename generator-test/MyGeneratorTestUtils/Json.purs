module MyGeneratorTestUtils.Json where

import Protolude

import Ansi.Codes as Ansi.Codes
import Data.Argonaut.Core (Json)
import Data.Function.Uncurried (Fn2, runFn2)
import Test.Spec.Assertions (fail)

foreign import _jsonDiffString :: Fn2 Json Json String

jsonDiffString :: Json → Json → String
jsonDiffString = runFn2 _jsonDiffString

jsonShouldEqual :: Json -> Json -> Aff Unit
jsonShouldEqual x y = when (not $ eq x y) do
  let removeRed = Ansi.Codes.escapeCodeToString (Ansi.Codes.Graphics (pure Ansi.Codes.Reset))
  fail $ "Json are not equal\n\n" <> removeRed <> jsonDiffString x y
