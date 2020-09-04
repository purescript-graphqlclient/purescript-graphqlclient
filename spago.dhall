{ name = "purescript-graphql-client"
, dependencies =
  [ "affjax"
  , "effect"
  , "generics-rep"
  , "node-fs-aff"
  , "prelude"
  , "proxy"
  , "psci-support"
  , "record"
  , "argonaut-core"
  , "argonaut-codecs"
  , "argonaut-generic"
  , "typelevel-prelude"
  , "debug"
  , "spec"
  , "variant"
  , "protolude"
  , "web-socket"
  , "unordered-collection"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
