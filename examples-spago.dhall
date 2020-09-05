{ name = "purescript-graphql-client-examples"
, dependencies = (./spago.dhall).dependencies
, packages = (./spago.dhall).packages
, sources = (./spago.dhall).sources # [ "examples/**/*.purs", "examples-test/**/*.purs" ]
}
