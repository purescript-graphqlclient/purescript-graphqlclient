module MyTest.AllTests where

import Prelude
import Test.Spec as Test.Spec
import MyTest.IntrospectionSpec as MyTest.IntrospectionSpec

allTests :: Test.Spec.Spec Unit
allTests = MyTest.IntrospectionSpec.spec
