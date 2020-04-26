module Test.AllTests where

import Prelude
import Test.Spec as Test.Spec
import Test.InsrospectionSpec as Test.InsrospectionSpec

allTests :: Test.Spec.Spec Unit
allTests = Test.InsrospectionSpec.spec
