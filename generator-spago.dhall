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
  , "url-regex-safe"
  ]
, packages = (./spago.dhall).packages
, sources = (./spago.dhall).sources # [ "generator/**/*.purs", "generator-test/**/*.purs" ]
}
