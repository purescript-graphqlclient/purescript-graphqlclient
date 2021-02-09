module Dillonkearns.MyGeneratorTests.AllTests where

import Prelude
import Test.Spec as Test.Spec
import Dillonkearns.MyGeneratorTests.IntrospectionSpec as MyGeneratorTests.IntrospectionSpec

allTests :: Test.Spec.Spec Unit
allTests = MyGeneratorTests.IntrospectionSpec.spec
