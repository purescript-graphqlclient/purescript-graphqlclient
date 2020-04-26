module Test.Main where

import Prelude
import Effect
import Effect.Aff
import Test.Spec as Test.Spec
import Test.Spec.Runner as Test.Spec.Runner
import Test.Spec.Reporter as Test.Spec.Reporter
import Test.AllTests as Test.AllTests

main :: Effect Unit
main = launchAff_ $ Test.Spec.Runner.runSpec' Test.Spec.Runner.defaultConfig [ Test.Spec.Reporter.consoleReporter ] Test.AllTests.allTests
