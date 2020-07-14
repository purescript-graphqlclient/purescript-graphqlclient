module MyTest.Main where

import Effect
import Effect.Aff
import Protolude

import Data.Time.Duration (Milliseconds(..))
import MyTest.AllTests as MyTest.AllTests
import Test.Spec as Test.Spec
import Test.Spec.Reporter as Test.Spec.Reporter
import Test.Spec.Runner as Test.Spec.Runner

main :: Effect Unit
main = launchAff_ $ Test.Spec.Runner.runSpec' (Test.Spec.Runner.defaultConfig { timeout = Just (Milliseconds 10000.0) }) [ Test.Spec.Reporter.consoleReporter ] MyTest.AllTests.allTests