#!/usr/bin/env bash

set -euxo pipefail

rm -fdR examples/swapi
rm -fdR examples/github

# the code of this server is here https://github.com/dillonkearns/graphqelm-demo/blob/master/lib/star_wars_web/schema.ex
spago run \
  --main GraphqlClientGenerator.Main \
  --node-args "--input-url https://elm-graphql.herokuapp.com/ --output examples/swapi --api Examples.Swapi --custom-scalars-module Examples.SwapiCustomScalars"

spago run \
  --main GraphqlClientGenerator.Main \
  --node-args "--input-url https://api.github.com/graphql --header \"Authorization: Bearer dbd4c239b0bbaa40ab0ea291fa811775da8f5b59\" --output examples/github --api Examples.Github"
