#!/usr/bin/env bash

set -euxo pipefail

rm -fdR examples/Examples/Swapi
rm -fdR examples/Examples/Github
rm -fdR examples/Examples/Normalize

# the code of this server is here https://github.com/dillonkearns/graphqelm-demo/blob/master/lib/star_wars_web/schema.ex
spago --config generator-spago.dhall run --no-install \
  --main GraphQLClientGenerator.Main \
  --node-args "--input-url https://elm-graphql.herokuapp.com/ --output examples/Examples/Swapi --api Examples.Swapi --custom-scalars-module Examples.SwapiCustomScalars"

spago --config generator-spago.dhall run --no-install \
  --main GraphQLClientGenerator.Main \
  --node-args "--input-url https://api.github.com/graphql --header \"Authorization: Bearer ${MY_GITHUB_GRAPHQL_ENDPOINT_TOKEN}\" --output examples/Examples/Github --api Examples.Github"

spago --config generator-spago.dhall run --no-install \
  --main GraphQLClientGenerator.Main \
  --node-args "--input-url https://elm-graphql-normalize.herokuapp.com --output examples/Examples/Normalize --api Examples.Normalize"
