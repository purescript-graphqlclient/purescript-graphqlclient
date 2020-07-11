module Examples.MyTests.AllTests where

import Prelude
import Test.Spec as Test.Spec
import Examples.MyTests.Example00SingleFieldQuerySpec as Examples.MyTests.Example00SingleFieldQuerySpec

allTests :: Test.Spec.Spec Unit
allTests = Test.Spec.describe "Example00SingleFieldQuerySpec" Examples.MyTests.Example00SingleFieldQuerySpec.spec
