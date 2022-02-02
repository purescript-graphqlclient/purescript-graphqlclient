{ name = "graphqlclient-examples"
, dependencies = (./generator-spago.dhall).dependencies #
  [ "envparse"
  ]
, packages = (./generator-spago.dhall).packages
, sources = (./generator-spago.dhall).sources # [ "examples/**/*.purs", "examples-test/**/*.purs" ]
, license = "Apache-2.0"
, repository = "https://github.com/purescript-graphqlclient/purescript-graphqlclient"
}
