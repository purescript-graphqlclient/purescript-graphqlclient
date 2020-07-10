module Examples.MyTests.AllTests where

import Prelude
import Test.Spec as Test.Spec
import Examples.MyTests.SingleFieldQuerySpec as Examples.MyTests.SingleFieldQuerySpec

allTests :: Test.Spec.Spec Unit
allTests = Test.Spec.describe "SingleFieldQuerySpec" Examples.MyTests.SingleFieldQuerySpec.spec
