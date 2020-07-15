{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purescript-graphql-client"
, dependencies =
  [ "affjax"
  , "console"
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
  , "mkdirp-aff"
  , "spec"
  , "variant"
  , "ansi"
  , "optparse"
  , "protolude"
  , "ps-cst"
  , "homogeneous-records"
  , "unordered-collection"
  -- , "inflection"
  ]
, packages = ./packages.dhall
, sources = [ "generator/**/*.purs", "src/**/*.purs", "test/**/*.purs" ]
}
