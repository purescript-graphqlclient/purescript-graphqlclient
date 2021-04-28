{ name = "purescript-graphqlclient-examples"
, dependencies = (./generator-spago.dhall).dependencies -- should not install additional deps, or it will break ci caching
, packages = (./generator-spago.dhall).packages
, sources = (./generator-spago.dhall).sources # [ "examples/**/*.purs", "examples-test/**/*.purs" ]
, license = "Apache-2.0"
, repository = "https://github.com/purescript-graphqlclient/purescript-graphqlclient"
}
