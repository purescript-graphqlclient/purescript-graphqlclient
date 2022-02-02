module MyExamplesTests.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (Milliseconds(..), launchAff_)
import Env as Env
import MyExamplesTests.AllTests as MyExamplesTests.AllTests
import Test.Spec.Reporter as Test.Spec.Reporter
import Test.Spec.Runner as Test.Spec.Runner

envConfig :: Effect String
envConfig = Env.parse Env.defaultInfo (Env.var Env.nonempty "MY_GITHUB_GRAPHQL_ENDPOINT_TOKEN" $ Env.defaultVarOptions { sensitive = true })

main :: Effect Unit
main = envConfig >>= \githubGraphqlEndpointToken ->
  launchAff_ $ Test.Spec.Runner.runSpec' (Test.Spec.Runner.defaultConfig { timeout = Just (Milliseconds 10000.0) }) [ Test.Spec.Reporter.consoleReporter ] (MyExamplesTests.AllTests.allTests githubGraphqlEndpointToken)
