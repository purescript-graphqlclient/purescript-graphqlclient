module Examples.MyTests.AllTests where

import Prelude
import Test.Spec as Test.Spec
import Examples.MyTests.Example00SingleFieldQuerySpec as Examples.MyTests.Example00SingleFieldQuerySpec
import Examples.MyTests.Example01BasicQuerySpec as Examples.MyTests.Example01BasicQuerySpec

allTests :: Test.Spec.Spec Unit
allTests = do
  Test.Spec.describe "Example00SingleFieldQuerySpec" Examples.MyTests.Example00SingleFieldQuerySpec.spec
  Test.Spec.describe "Example01BasicQuerySpec" Examples.MyTests.Example01BasicQuerySpec.spec
