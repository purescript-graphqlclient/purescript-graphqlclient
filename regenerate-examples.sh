#!/usr/bin/env bash

set -euxo pipefail

rm -fdR examples/Examples/Swapi
rm -fdR examples/Examples/Github
rm -fdR examples/Examples/Normalize

# the code of this server is here https://github.com/dillonkearns/graphqelm-demo/blob/master/lib/star_wars_web/schema.ex
spago --config generator-spago.dhall run --no-install \
  --main GraphQLClientGenerator.Main \
  --node-args "--input-url https://elm-graphql.herokuapp.com/ --output examples/Examples/Swapi --api Examples.Swapi --custom-scalars-module Examples.SwapiCustomScalars"

# KEY CREATED WITH https://docs.github.com/en/graphql/guides/forming-calls-with-graphql#authenticating-with-graphql (ONLY public repos)
#
# update with
# sd -s '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' 'NEWKEY' $(fd --type f . .)
spago --config generator-spago.dhall run --no-install \
  --main GraphQLClientGenerator.Main \
  --node-args "--input-url https://api.github.com/graphql --header \"Authorization: Bearer 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\" --output examples/Examples/Github --api Examples.Github"

spago --config generator-spago.dhall run --no-install \
  --main GraphQLClientGenerator.Main \
  --node-args "--input-url https://elm-graphql-normalize.herokuapp.com --output examples/Examples/Normalize --api Examples.Normalize"
