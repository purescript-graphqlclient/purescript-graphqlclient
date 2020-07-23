module Examples.MyTests.AllTests where

import Prelude
import Test.Spec as Test.Spec
import Examples.MyTests.Example00SingleFieldQuery as Examples.MyTests.Example00SingleFieldQuery
import Examples.MyTests.Example01BasicQuery as Examples.MyTests.Example01BasicQuery
import Examples.MyTests.Example02AdoSyntax as Examples.MyTests.Example02AdoSyntax
import Examples.MyTests.Example03Variables as Examples.MyTests.Example03Variables
import Examples.MyTests.Example04ErrorDestructuring as Examples.MyTests.Example04ErrorDestructuring
import Examples.MyTests.Example05InterfacesAndUnions as Examples.MyTests.Example05InterfacesAndUnions
import Examples.MyTests.Example06Typename as Examples.MyTests.Example06Typename
import Examples.MyTests.Example08Foldr as Examples.MyTests.Example08Foldr
import Examples.MyTests.Example10Github as Examples.MyTests.Example10Github
import Examples.MyTests.Example11GithubPagination as Examples.MyTests.Example11GithubPagination
import Examples.MyTests.Example12Mutation as Examples.MyTests.Example12Mutation
import Examples.MyTests.Example13SSubscription as Examples.MyTests.Example13SSubscription

allTests :: Test.Spec.Spec Unit
allTests = Test.Spec.parallel do
  Examples.MyTests.Example00SingleFieldQuery.spec
  Examples.MyTests.Example01BasicQuery.spec
  Examples.MyTests.Example02AdoSyntax.spec
  Examples.MyTests.Example03Variables.spec
  Examples.MyTests.Example04ErrorDestructuring.spec
  Examples.MyTests.Example05InterfacesAndUnions.spec
  Examples.MyTests.Example06Typename.spec
  Examples.MyTests.Example08Foldr.spec
  Examples.MyTests.Example10Github.spec
  Examples.MyTests.Example11GithubPagination.spec
  Examples.MyTests.Example12Mutation.spec
  Examples.MyTests.Example13SSubscription.spec
