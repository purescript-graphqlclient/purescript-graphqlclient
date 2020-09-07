#!/usr/bin/env bash

set -euxo pipefail

rm -fdR examples/swapi

# the code of this server is here https://github.com/dillonkearns/graphqelm-demo/blob/master/lib/star_wars_web/schema.ex
spago --config generator-spago.dhall run --no-install \
  --main GraphQLClientGenerator.Main \
  --node-args "--input-url https://elm-graphql.herokuapp.com/ --output examples/swapi --api Examples.Swapi --custom-scalars-module Examples.SwapiCustomScalars"

rm -fdR examples/github

spago --config generator-spago.dhall run --no-install \
  --main GraphQLClientGenerator.Main \
  --node-args "--input-url https://api.github.com/graphql --header \"Authorization: Bearer dbd4c239b0bbaa40ab0ea291fa811775da8f5b59\" --output examples/github --api Examples.Github"

# TODO: circular deps
# spago --config generator-spago.dhall run --no-install \
#   --main GraphQLClientGenerator.Main \
#   --node-args "--input-url https://elm-graphql-normalize.herokuapp.com --output examples/normalize --api Examples.Normalize"
