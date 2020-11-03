module MyExamplesTests.AllTests where

import Prelude
import Test.Spec as Test.Spec
import MyExamplesTests.Example00SingleFieldQuery as MyExamplesTests.Example00SingleFieldQuery
import MyExamplesTests.Example01BasicQuery as MyExamplesTests.Example01BasicQuery
import MyExamplesTests.Example02AdoSyntax as MyExamplesTests.Example02AdoSyntax
import MyExamplesTests.Example03Variables as MyExamplesTests.Example03Variables
import MyExamplesTests.Example04ErrorDestructuring as MyExamplesTests.Example04ErrorDestructuring
import MyExamplesTests.Example05InterfacesAndUnions as MyExamplesTests.Example05InterfacesAndUnions
import MyExamplesTests.Example06Typename as MyExamplesTests.Example06Typename
import MyExamplesTests.Example08Foldr as MyExamplesTests.Example08Foldr
import MyExamplesTests.Example10Github as MyExamplesTests.Example10Github
import MyExamplesTests.Example11GithubPagination as MyExamplesTests.Example11GithubPagination
import MyExamplesTests.Example12Mutation as MyExamplesTests.Example12Mutation
import MyExamplesTests.Example13SSubscription as MyExamplesTests.Example13SSubscription

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
