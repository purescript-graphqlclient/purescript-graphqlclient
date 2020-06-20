{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purescript-fernet"
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
  , "ps-ast"
  -- , "inflection"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
