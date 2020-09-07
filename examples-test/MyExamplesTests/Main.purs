module MyExamplesTests.Main where

import Effect.Aff (Milliseconds(..))
import Protolude

import MyExamplesTests.AllTests as MyExamplesTests.AllTests
import Test.Spec.Reporter as Test.Spec.Reporter
import Test.Spec.Runner as Test.Spec.Runner

main :: Effect Unit
main = launchAff_ $ Test.Spec.Runner.runSpec' (Test.Spec.Runner.defaultConfig { timeout = Just (Milliseconds 10000.0) }) [ Test.Spec.Reporter.consoleReporter ] MyExamplesTests.AllTests.allTests
