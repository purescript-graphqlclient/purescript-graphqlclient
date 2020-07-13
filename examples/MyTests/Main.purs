module Examples.MyTests.Main where

import Effect.Aff (Milliseconds(..))
import Protolude (Effect, Maybe(..), Unit, launchAff_, ($))

import Examples.MyTests.AllTests as Examples.MyTests.AllTests
import Test.Spec.Reporter as Test.Spec.Reporter
import Test.Spec.Runner as Test.Spec.Runner

main :: Effect Unit
main = launchAff_ $ Test.Spec.Runner.runSpec' (Test.Spec.Runner.defaultConfig { timeout = Just (Milliseconds 10000.0) }) [ Test.Spec.Reporter.consoleReporter ] Examples.MyTests.AllTests.allTests
