{ name = "purescript-graphql-client-generator"
, dependencies = (./spago.dhall).dependencies #
  [ "console"
  , "mkdirp-aff"
  , "ansi"
  , "optparse"
  , "ps-cst"
  , "homogeneous-records"
  , "strings-extra"
  , "stringutils"
  ]
, packages = (./spago.dhall).packages
, sources = (./spago.dhall).sources # [ "generator/**/*.purs" ]
}
