{ name = "purescript-dillonkearns-graphql-client-examples"
, dependencies = (./spago.dhall).dependencies -- should not install additional deps, or it will break ci caching
, packages = (./spago.dhall).packages
, sources = (./spago.dhall).sources # [ "examples/**/*.purs", "examples-test/**/*.purs" ]
}
