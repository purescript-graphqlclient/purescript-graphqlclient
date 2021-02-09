module Dillonkearns.MyExamplesTests.AllTests where

import Prelude
import Test.Spec as Test.Spec
import Dillonkearns.MyExamplesTests.Example00SingleFieldQuery as MyExamplesTests.Example00SingleFieldQuery
import Dillonkearns.MyExamplesTests.Example01BasicQuery as MyExamplesTests.Example01BasicQuery
import Dillonkearns.MyExamplesTests.Example02AdoSyntax as MyExamplesTests.Example02AdoSyntax
import Dillonkearns.MyExamplesTests.Example03Variables as MyExamplesTests.Example03Variables
import Dillonkearns.MyExamplesTests.Example04ErrorDestructuring as MyExamplesTests.Example04ErrorDestructuring
import Dillonkearns.MyExamplesTests.Example05InterfacesAndUnions as MyExamplesTests.Example05InterfacesAndUnions
import Dillonkearns.MyExamplesTests.Example06Typename as MyExamplesTests.Example06Typename
import Dillonkearns.MyExamplesTests.Example08Foldr as MyExamplesTests.Example08Foldr
import Dillonkearns.MyExamplesTests.Example10Github as MyExamplesTests.Example10Github
import Dillonkearns.MyExamplesTests.Example11GithubPagination as MyExamplesTests.Example11GithubPagination
import Dillonkearns.MyExamplesTests.Example12Mutation as MyExamplesTests.Example12Mutation
import Dillonkearns.MyExamplesTests.Example13SSubscription as MyExamplesTests.Example13SSubscription

allTests :: Test.Spec.Spec Unit
allTests =
  Test.Spec.parallel do
    MyExamplesTests.Example00SingleFieldQuery.spec
    MyExamplesTests.Example01BasicQuery.spec
    MyExamplesTests.Example02AdoSyntax.spec
    MyExamplesTests.Example03Variables.spec
    MyExamplesTests.Example04ErrorDestructuring.spec
    MyExamplesTests.Example05InterfacesAndUnions.spec
    MyExamplesTests.Example06Typename.spec
    MyExamplesTests.Example08Foldr.spec
    MyExamplesTests.Example10Github.spec
    MyExamplesTests.Example11GithubPagination.spec
    MyExamplesTests.Example12Mutation.spec
    MyExamplesTests.Example13SSubscription.spec
