{ name = "graphqlclient-generator"
, dependencies = (./spago.dhall).dependencies #
  [ "node-fs-aff"
  , "spec"
  , "console"
  , "open-mkdirp-aff"
  , "ansi"
  , "optparse"
  , "ps-cst"
  , "record-extra-srghma"
  , "strings-extra"
  , "stringutils"
  , "url-regex-safe"
  , "dodo-printer"
  , "exceptions"
  , "functions"
  , "node-buffer"
  , "node-path"
  , "node-process"
  , "ordered-collections"
  , "typelevel-prelude"
  , "unsafe-coerce"
  ]
, packages = (./spago.dhall).packages
, sources = (./spago.dhall).sources # [ "generator/**/*.purs", "generator-test/**/*.purs" ]
, license = "Apache-2.0"
, repository = "https://github.com/purescript-graphqlclient/purescript-graphqlclient"
}
