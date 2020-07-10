module Examples.MyTests.Main where

import Effect
import Effect.Aff
import Protolude

import Data.Time.Duration (Milliseconds(..))
import Examples.MyTests.AllTests as Examples.MyTests.AllTests
import Test.Spec as Examples.Spec
import Test.Spec.Reporter as Test.Spec.Reporter
import Test.Spec.Runner as Test.Spec.Runner

main :: Effect Unit
main = launchAff_ $ Test.Spec.Runner.runSpec' (Test.Spec.Runner.defaultConfig { timeout = Just (Milliseconds 10000.0) }) [ Test.Spec.Reporter.consoleReporter ] Examples.MyTests.AllTests.allTests
