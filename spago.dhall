{ name = "purescript-dillonkearns-graphql-client"
, dependencies =
  [ "affjax"
  , "effect"
  , "node-fs-aff"
  , "prelude"
  , "psci-support"
  , "record"
  , "argonaut-core"
  , "argonaut-codecs"
  , "argonaut-generic"
  , "typelevel-prelude"
  , "debug"
  , "spec"
  , "variant"
  , "web-socket"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
